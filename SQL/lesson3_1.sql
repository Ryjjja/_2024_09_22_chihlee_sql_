/*刪除資料表*/
DROP TABLE IF EXISTS stations;

/*車站*/
/*車站代號,車站中文名稱,車站英文名稱*/
CREATE TABLE IF NOT EXISTS stations(
	id SERIAL PRIMARY KEY,
	code VARCHAR(5) NOT NULL UNIQUE,
	name VARCHAR(10) NOT NULL UNIQUE,
	e_name VARCHAR(50)
	);


/*修改欄位類型*/
ALTER TABLE stations
ALTER COLUMN name 
TYPE VARCHAR(10);




