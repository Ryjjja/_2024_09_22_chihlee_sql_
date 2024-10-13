/*建立台鐵車站資訊的資料表*/

CREATE TABLE IF NOT EXISTS stations(
	stations_id SERIAL PRIMARY KEY,
	stationCode VARCHAR(5) UNIQUE NOT NULL,
	stationName VARCHAR(20) NOT NULL,
	name VARCHAR(20),
	stationAddrTw VARCHAR(50),
	stationTel VARCHAR(20),
	gps VARCHAR(30),
	haveBike BOOLEAN
);

SELECT *
FROM stations;



/*建立每日各站進出站人數的資料表*/
CREATE TABLE IF NOT EXISTS station_in_out(
	date DATE,
	staCode VARCHAR(5) NOT NULL,
	gateInComingCnt INTEGER,
	gateOutGoingCnt INTEGER,
	PRIMARY KEY(date,staCode),
	FOREIGN KEY(staCode) REFERENCES stations(stationCode) /*對應*/
	ON DELETE SET NULL
	ON UPDATE CASCADE /*如果對應的資料被更新，把所有關聯的全部一起刪除*/
);


/*ON DELETE CASCADE _如果對應的資料被刪除，把所有關聯的全部一起更新*/

SELECT *
FROM station_in_out;
