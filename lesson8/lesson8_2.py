import streamlit as st

import psycopg2
from dotenv import load_dotenv
import os
load_dotenv()

conn = psycopg2.connect(host=os.environ['HOST'],database=os.environ['DATABASE'],user=os.environ['USER'],password=os.environ['PASSWORD'])
with conn:
    with conn.cursor() as cursor:
        sql = '''
        SELECT * FROM 市場
        '''
        cursor.execute(sql)
        all_country = cursor.fetchall()
conn.close()

def user_select():
    print('使用者選擇了') #定義funtion
    print(st.session_state.stocks)

st.title('世界大盤分析')
with st.sidebar:
    default_country = '台灣'
    st.sidebar.title('請選擇股票市場:')
    input_dict= dict(all_country)
    st.multiselect("請選擇",input_dict.values(),   #若不需要一開始傳出值,開頭options= 就拿掉,縮排往前
                    default=default_country,
                    placeholder='請選擇市場',
                    label_visibility='hidden',
                    key='stocks',  #key
                    on_change=user_select) #funtions名稱
    st.write(default_country)
  
