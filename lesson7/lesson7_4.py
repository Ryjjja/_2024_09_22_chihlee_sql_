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


st.title('世界大盤分析')
with st.sidebar:
    st.sidebar.title('請選擇股票市場:')
    st.write('## 台灣')
    st.write(all_country)

## 執行時，先進入chihlee_sql的虛擬環境 / lesson7的整合終端機 / 輸入 streamlit run lesson7_4.py