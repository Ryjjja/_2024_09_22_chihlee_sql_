SELECT *
FROM stations;

SELECT *
FROM station_in_out;

/*全省各站點2022年進站總人數*/
SELECT stationname AS 站名,
	   SUM(gateincomingcnt) AS 進站總人數 /*因下方用GROUP BY整合後筆數不同，要用聚合函數處理，例如:SUM加總*/
FROM stations s JOIN station_in_out in_out
				ON in_out.stacode = s.stationcode /*欄位名不同，可以不指定資料表，可省略.之前的資料表名稱*/
/*WHERE date BETWEEN '2022-01-01' AND '2022-12-31'  /*BETWEEN寫法*/ */
WHERE EXTRACT(YEAR FROM date) = 2022
GROUP BY stationname  /*GROUP BY語法，是把相同的值整合成一個，整合後筆數不同，要用聚合函數處理，例如:SUM加總*/
ORDER BY 進站總人數 DESC; /*排序 預設由小到大ASC; 由大到小用DESC*/


/*全省各站點2022年進站總人數大於5佰萬人的站點*/
SELECT stationname AS 站名,
		SUM(gateincomingcnt) AS 進站總人數
FROM stations s JOIN station_in_out in_out
							ON in_out.stacode = s.stationcode
WHERE EXTRACT(YEAR FROM date) = 2022
GROUP BY stationname
HAVING SUM(gateincomingcnt) > 5000000 /*GROUP BY完成後，用HAVING*/
ORDER BY 進站總人數 DESC;


/*基隆火車站2020年,每月份進站人數*/
SELECT stationname AS 站名, TO_CHAR(date, 'YYYY-MM') AS 日期,SUM(gateincomingcnt) AS 當月總進站人數
FROM stations JOIN station_in_out ON stationcode = stacode
/*WHERE date BETWEEN '2022-01-01' AND '2022-12-31';*/
WHERE EXTRACT(YEAR FROM date) = 2020 AND stationname='基隆'
GROUP BY 站名,日期;


/*基隆火車站2020年,每月份進站人數,由多至少*/
SELECT stationname AS 站名,
		EXTRACT(MONTH FROM date) AS 月份,
		SUM(gateincomingcnt) AS 進站人數
FROM station_in_out in_out JOIN stations s
							ON in_out.stacode = s.stationcode
WHERE EXTRACT(YEAR FROM date) = 2020 AND stationname = '基隆'
GROUP BY stationname,EXTRACT(MONTH FROM date)
ORDER BY 進站人數 DESC;


/*基隆火車站2020,2021,2022,每年進站人數*/
SELECT stationname AS 站名,
		EXTRACT(YEAR FROM date) AS 年份,
		SUM(gateincomingcnt) AS 進站人數
FROM station_in_out in_out JOIN stations s
							ON in_out.stacode = s.stationcode
WHERE EXTRACT(YEAR FROM date) BETWEEN 2020 AND 2022 AND stationname = '基隆'
GROUP BY stationname, EXTRACT(YEAR FROM date)
ORDER BY 年份;


/*基隆火車站,臺北火車站2020,2021,2022,每年進站人數*/
SELECT stationname AS 站名,
	   EXTRACT(YEAR FROM date) AS 年份,
	   SUM(gateincomingcnt) AS 進站人數
FROM station_in_out in_out JOIN stations s
							ON in_out.stacode = s.stationcode
WHERE EXTRACT(YEAR FROM date) BETWEEN 2020 AND 2022 AND stationname IN ('基隆','臺北')
GROUP BY stationname , EXTRACT(YEAR FROM date)
ORDER BY 站名;


/*請使用SubQuery*/
/*進站人數最多的一筆*/
SELECT stationname AS 站名,
	   date AS 日期,
	   gateincomingcnt AS 進站人數
FROM station_in_out in_out JOIN stations s
							ON in_out.stacode = s.stationcode
WHERE gateincomingcnt = (
		SELECT MAX(gateincomingcnt)
	    FROM station_in_out
);

/*各站點進站人數最多的一筆*/
SELECT stationname AS 站名,
	   date AS 日期,
	   gateincomingcnt AS 進站人數最多
FROM station_in_out in_out JOIN stations s
							ON in_out.stacode = s.stationcode
WHERE (stacode,gateincomingcnt) IN (
		SELECT stacode, MAX(gateincomingcnt)
		FROM station_in_out
		GROUP BY stacode)	
ORDER BY gateincomingcnt DESC ;
