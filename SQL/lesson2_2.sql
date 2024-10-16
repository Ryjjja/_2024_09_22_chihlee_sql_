/*刪除資料表*/
DROP TABLE IF EXISTS stations;

/*醫療表*/
/*序號,直轄市或省轄縣市,醫療機構名稱,市話,分機,聯絡人,地址*/
CREATE TABLE IF NOT EXISTS hospital (
	id SERIAL PRIMARY KEY,
    state VARCHAR(5) NOT NULL,
    name VARCHAR(30) NOT NULL UNIQUE,
	phone VARCHAR(15),
	ext VARCHAR(7),
	contact VARCHAR(7),
	address VARCHAR(50)   
    );

/*天氣表*/
/*城市,啟始時間,結束時間,最高溫度,最低溫度,感覺*/
CREATE TABLE IF NOT EXISTS weather(
	id SERIAL PRIMARY KEY,
	city VARCHAR(20) NOT NULL,
    startDate timestamp,
    endDate timestamp,
	high real,
	low real,
	status VARCHAR(20)  
    );

	
/*車站*/
/*車站代號,車站中文名稱,車站英文名稱*/
CREATE TABLE IF NOT EXISTS stations(
	id SERIAL PRIMARY KEY,
	code VARCHAR(7) NOT NULL UNIQUE,
	name VARCHAR(80) UNIQUE,
	e_name VARCHAR(80)
	);

