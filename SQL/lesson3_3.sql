SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE code = '1001'

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE code = '1001' OR  code = '1002'

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE code IN ('1001','1002')

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE code = '1001' OR name = '八堵'

/* 台_ 代表第一個字只要是'台'帶出來後,限制1個字數*/
SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE name LIKE '台_';

/* 台% 代表第一個字只要是'台'都會帶出來,不限字數*/
SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE name LIKE '台%';










