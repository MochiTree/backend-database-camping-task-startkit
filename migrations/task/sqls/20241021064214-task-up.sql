
-- ████████  █████   █     █ 
--   █ █   ██    █  █     ██ 
--   █ █████ ███ ███       █ 
--   █ █   █    ██  █      █ 
--   █ █   █████ █   █     █ 
-- ===================== ====================
-- 1. 用戶資料，資料表為 USER

-- 1. 新增：新增六筆用戶資料，資料如下：
--     1. 用戶名稱為`李燕容`，Email 為`lee2000@hexschooltest.io`，Role為`USER`
--     2. 用戶名稱為`王小明`，Email 為`wXlTq@hexschooltest.io`，Role為`USER`
--     3. 用戶名稱為`肌肉棒子`，Email 為`muscle@hexschooltest.io`，Role為`USER`
--     4. 用戶名稱為`好野人`，Email 為`richman@hexschooltest.io`，Role為`USER`
--     5. 用戶名稱為`Q太郎`，Email 為`starplatinum@hexschooltest.io`，Role為`USER`
--     6. 用戶名稱為 透明人，Email 為 opacity0@hexschooltest.io，Role 為 USER

insert into "USER" (name,email,role)
values ('李燕容','lee2000@hexschooltest.io','USER'),
('王小明','wXlTq@hexschooltest.io','USER'),
('肌肉棒子','muscle@hexschooltest.io','USER'),
('好野人','richman@hexschooltest.io','USER'),
('Q太郎','starplatinum@hexschooltest.io','USER'),
('透明人','opacity0@hexschooltest.io','USER');

-- 1-2 修改：用 Email 找到 李燕容、肌肉棒子、Q太郎，如果他的 Role 為 USER 將他的 Role 改為 COACH

update "USER"
set role='COACH'
where email='lee2000@hexschooltest.io' or email='muscle@hexschooltest.io' or email='starplatinum@hexschooltest.io'
select * from "USER";

-- 1-3 刪除：刪除USER 資料表中，用 Email 找到透明人，並刪除該筆資料

delete from "USER"
where email='opacity0@hexschooltest.io';
select * from "USER";

-- 1-4 查詢：取得USER 資料表目前所有用戶數量（提示：使用count函式）
select COUNT(*)
from "USER";

-- 1-5 查詢：取得 USER 資料表所有用戶資料，並列出前 3 筆（提示：使用limit語法）
select * from "USER"
limit 3;


--  ████████  █████   █    ████  
--    █ █   ██    █  █         █ 
--    █ █████ ███ ███       ███  
--    █ █   █    ██  █     █     
--    █ █   █████ █   █    █████ 
-- ===================== ====================
-- 2. 組合包方案 CREDIT_PACKAGE、客戶購買課程堂數 CREDIT_PURCHASE
-- 2-1. 新增：在`CREDIT_PACKAGE` 資料表新增三筆資料，資料需求如下：
    -- 1. 名稱為 `7 堂組合包方案`，價格為`1,400` 元，堂數為`7`
    -- 2. 名稱為`14 堂組合包方案`，價格為`2,520` 元，堂數為`14`
    -- 3. 名稱為 `21 堂組合包方案`，價格為`4,800` 元，堂數為`21`

insert into "CREDIT_PACKAGE" (name,credit_amount,price)
VALUES('7 堂組合包方案',7,1400),
	  ('14 堂組合包方案',14,2520),
	  ('21 堂組合包方案',21,4800);


-- 2-2. 新增：在 `CREDIT_PURCHASE` 資料表，新增三筆資料：（請使用 name 欄位做子查詢）
    -- 1. `王小明` 購買 `14 堂組合包方案`
    -- 2. `王小明` 購買 `21 堂組合包方案`
    -- 3. `好野人` 購買 `14 堂組合包方案`

insert into "CREDIT_PURCHASE" (user_id,credit_package_id,purchased_credits,price_paid)
values
(( select id from "USER" where name='王小明'),
( select id from "CREDIT_PACKAGE" where name='14 堂組合包方案'),
( select credit_amount from "CREDIT_PACKAGE" where name='14 堂組合包方案'),
( select price from "CREDIT_PACKAGE" where name='14 堂組合包方案' )),

(( select id from "USER" where name='王小明'),
( select id from "CREDIT_PACKAGE" where name='21 堂組合包方案'),
( select credit_amount from "CREDIT_PACKAGE" where name='21 堂組合包方案'),
( select price from "CREDIT_PACKAGE" where name='21 堂組合包方案' )),

(( select id from "USER" where name='好野人'),
( select id from "CREDIT_PACKAGE" where name='14 堂組合包方案'),
( select credit_amount from "CREDIT_PACKAGE" where name='14 堂組合包方案'),
( select price from "CREDIT_PACKAGE" where name='14 堂組合包方案' ));

-- (額外自我練習：嘗試 顯示 USER與購買之課程)
select user.name as 名稱 from "CREDIT_PURCHASE"
inner join "USER" on credit_purchase.user_id= user.id;
-- 在Dbeaver無法運行，會報語法.錯誤

-- 上面跟下面差別在有沒有下別名(AS)  下面SQL語法在Dbeaver可運行，但不理解為什麼「 . 」會被Dbeaver報語法錯誤，請助教解惑Ｑ_Ｑ！
 select us.name as 使用者名稱,C_PK.name as 方案 from "CREDIT_PURCHASE" as C_P
 inner join "USER" as us on C_P.user_id= us.id
 inner join "CREDIT_PACKAGE" as C_PK on C_PK.id= C_P.credit_package_id; 







