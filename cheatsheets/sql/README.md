# SQL

[Назад к перечню шпаргалок][back]

## 1. Запросы для поиска данных

**SELECT** используется для выбора данных из базы данных.

```sql
SELECT * FROM table_name;
 ```

**DISTINCT** отфильтровывает повторяющиеся значения и возвращает строки указанного столбца.

```sql
SELECT DISTINCT column_name;
```

**WHERE** используется для фильтрации записей/строк.

```sql
SELECT column1, column2 FROM table_name WHERE condition;
SELECT * FROM table_name WHERE condition1 AND condition2;
SELECT * FROM table_name WHERE condition1 OR condition2;
SELECT * FROM table_name WHERE NOT condition;
SELECT * FROM table_name WHERE condition1 AND (condition2 OR condition3);
SELECT * FROM table_name WHERE EXISTS (SELECT column_name FROM table_name WHERE condition);
```

**ORDER BY** используется для сортировки набора результатов в порядке возрастания или убывания.

```sql
SELECT * FROM table_name ORDER BY column;
SELECT * FROM table_name ORDER BY column DESC;
SELECT * FROM table_name ORDER BY column1 ASC, column2 DESC;
```

**SELECT TOP** используется для указания количества записей, возвращаемых из верхней части таблицы.

```sql
SELECT TOP number columns_names FROM table_name WHERE condition;
SELECT TOP percent columns_names FROM table_name WHERE condition;
-- Not all database systems support SELECT TOP. The MySQL equivalent is the LIMIT clause
SELECT column_names FROM table_name LIMIT offset, count;
```

**LIKE** оператор, используемый в предложении `WHERE` для поиска определенного шаблона в столбце.

```sql
WHERE CustomerName LIKE ‘a%’   -- Находит любые значения, которые начинаются с “a”
WHERE CustomerName LIKE ‘%a’   -- Находит любые значения, которые заканчиваются на “a”
WHERE CustomerName LIKE ‘%or%’ -- Находит любые значения, которые имеют “or” в любой позиции
WHERE CustomerName LIKE ‘_r%’  -- Находит любые значения, имеющие букву “r” во второй позиции
WHERE CustomerName LIKE ‘a__%’ -- Находит любые значения, начинающиеся с буквы “a” и имеющие длину не менее 3 символов
WHERE ContactName LIKE ‘a%o’   -- Находит любые значения, которые начинаются с “a” и заканчиваются “о”
```

**IN** оператор, который позволяет указать несколько значений в предложении `WHERE`.

По сути, оператор `IN` является сокращением для нескольких условий `OR`.

```sql
SELECT column_names FROM table_name WHERE column_name IN (value1, value2, …);
SELECT column_names FROM table_name WHERE column_name IN (SELECT STATEMENT);
```

**BETWEEN** оператор выбирает значения в заданном диапазоне включительно.

```sql
SELECT column_names FROM table_name WHERE column_name BETWEEN value1 AND value2;
SELECT * FROM Products WHERE (column_name BETWEEN value1 AND value2) AND NOT column_name2 IN (value3, value4);
SELECT * FROM Products WHERE column_name BETWEEN #01/07/1999# AND #03/12/1999#;
```

**NULL**

```sql
SELECT * FROM table_name WHERE column_name IS NULL;
SELECT * FROM table_name WHERE column_name IS NOT NULL;
```

**AS** используются для присвоения временного имени таблице или столбцу.

```sql
SELECT column_name AS alias_name FROM table_name;
SELECT column_name FROM table_name AS alias_name;
SELECT column_name AS alias_name1, column_name2 AS alias_name2;
SELECT column_name1, column_name2 + ‘, ‘ + column_name3 AS alias_name;
```

**UNION** используется в SQL для объединения набора результатов двух или более операторов `SELECT`.

Каждый оператор `SELECT` в `UNION` должен иметь одинаковое количество столбцов.\
Столбцы должны иметь похожие типы данных.\
Столбцы в каждом операторе SELECT также должны быть в том же порядке.

```sql
SELECT columns_names FROM table1 UNION SELECT column_name FROM table2;
```

Оператор `UNION` выбирает только отдельные значения, `UNION ALL` разрешает дубликаты.

**INTERSECT** используется для возврата записей, общих для двух операторов `SELECT`.

Обычно используется так же, как `UNION`.

```sql
SELECT columns_names FROM table1 INTERSECT SELECT column_name FROM table2;
```

**EXCEPT** оператор, используемый для возврата всех записей в первом операторе `SELECT`, которые не найдены во втором
операторе `SELECT`.

Обычно используется так же, как `UNION` выше.

```sql
SELECT columns_names FROM table1 EXCEPT SELECT column_name FROM table2;
```

**ANY|ALL** оператор, используемый для проверки условий подзапроса, используемых в предложениях `WHERE` или `HAVING`.

- `ANY` возвращает значение `true`, если какие-либо значения подзапроса соответствуют условию.
- `ALL` возвращает значение `true`, если все значения подзапроса соответствуют условию.

```sql
SELECT columns_names FROM table1 WHERE column_name operator (ANY|ALL) (SELECT column_name FROM table_name WHERE condition);
```

**GROUP BY** оператор, часто используемый с агрегатными функциями (`COUNT`, `MAX`, `MIN`, `SUM`, `AVG`) для группировки
набора результатов по одному или нескольким столбцам.

```sql
SELECT column_name1, COUNT(column_name2) FROM table_name WHERE condition GROUP BY column_name1 ORDER BY COUNT(column_name2) DESC;
```

**HAVING** оператор SQL является указателем на результат выполнения агрегатных функций.

Агрегатной функцией в языке SQL называется функция, возвращающая какое-либо одно значение по набору значений столбца.

Такими функциями являются:

- COUNT()
- MIN()
- MAX()
- AVG()
- SUM()

```sql
SELECT COUNT(column_name1), column_name2 FROM table GROUP BY column_name2 HAVING COUNT(column_name1) > 5;
```

**WITH** запрос, который часто используется для извлечения иерархических данных.

```sql
WITH RECURSIVE cte AS (
    SELECT c0.* FROM categories AS c0 WHERE id = 1 # Starting point
    UNION ALL
    SELECT c1.* FROM categories AS c1 JOIN cte ON c1.parent_category_id = cte.id
)
SELECT *
FROM cte
```

## 2. Запросы для модификации данных

**INSERT INTO** используется для вставки новых записей/строк в таблицу.

```sql
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
INSERT INTO table_name VALUES (value1, value2 …);
```

**UPDATE** используется для изменения существующих записей в таблице.

```sql
UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;
UPDATE table_name SET column_name = value;
```

**DELETE** используется для удаления существующих записей/строк в таблице.

```sql
DELETE FROM table_name WHERE condition;
DELETE * FROM table_name;
```

## 3. Считаем количество записей

**COUNT** возвращает количество вхождений

```sql
SELECT COUNT (DISTINCT column_name);
```

**MIN()** и **MAX()** возвращает наименьшее/наибольшее значение выбранного столбца.

```sql
SELECT MIN (column_names) FROM table_name WHERE condition;
SELECT MAX (column_names) FROM table_name WHERE condition;
```

**AVG()** возвращает среднее значение числового столбца.

```sql
SELECT AVG (column_name) FROM table_name WHERE condition;
```

**SUM()** возвращает общую сумму числового столбца.

```sql
SELECT SUM (column_name) FROM table_name WHERE condition;
```

## 4. Join запросы SQL

**INNER JOIN** возвращает записи, имеющие совпадающее значение в обеих таблицах.

```sql
SELECT column_names FROM table1 INNER JOIN table2 ON table1.column_name=table2.column_name;
SELECT table1.column_name1, table2.column_name2, table3.column_name3 FROM ((table1 INNER JOIN table2 ON relationship) INNER JOIN table3 ON relationship);
```

**LEFT (OUTER) JOIN** возвращает все записи из левой таблицы (1) и соответствующие записи из правой таблицы (2).

```sql
SELECT column_names FROM table1 LEFT JOIN table2 ON table1.column_name=table2.column_name;
```

**RIGHT (OUTER) JOIN** возвращает все записи из правой таблицы (2) и соответствующие записи из левой таблицы (1).

```sql
SELECT column_names FROM table1 RIGHT JOIN table2 ON table1.column_name=table2.column_name;
FULL (OUTER) JOIN
SELECT column_names FROM table1 FULL OUTER JOIN table2 ON table1.column_name=table2.column_name;
```

**Self JOIN** обычные джоины.

```sql
SELECT column_names FROM table1 T1, table1 T2 WHERE condition;
```

## 5. Запросы на просмотр

**CREATE** создаёт представление.

```sql
CREATE VIEW view_name AS SELECT column1, column2 FROM table_name WHERE condition;
```

**SELECT** получает представление.

```sql
SELECT * FROM view_name;
```

**DROP** отказаться от представления.

```sql
DROP VIEW view_name;
```

## 6. Altering запросы

**ADD** добавить столбец.

```sql
ALTER TABLE table_name ADD column_name column_definition;
```

**MODIFY** изменить тип данных столбца.

```sql
ALTER TABLE table_name MODIFY column_name column_type;
```

**DROP** удалить столбец.

```sql
ALTER TABLE table_name DROP COLUMN column_name;
```

## 7. Создание таблицы sql

**CREATE** создаёт таблицу.

```sql
CREATE TABLE table_name (
  column1 datatype,
  column2 datatype,
  column3 datatype,
  column4 datatype,
);
```

## 8. Обобщенное табличное выражение

```sql
WITH CTE_Name (column1, column2)
AS
-- Define the CTE query.
(
  SELECT column1, column2
  FROM Table1
  WHERE column1 IS NOT NULL
)
-- Define the outer query referencing the CTE name.
SELECT *
FROM CTE_Name
GROUP BY column1, column2
ORDER BY column1, column2;
GO

star_border

-- Поиск текста в SP

SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Find_Text_In_SP]
@StringToSearch VARCHAR(100),
@StringToSearch2 VARCHAR(100) = '',
@StringToSearch3 VARCHAR(100) = '',
@Name VARCHAR(100) = ''

AS
	SET @StringToSearch = '%' +@StringToSearch + '%'
	SET @StringToSearch2 = '%' +@StringToSearch2 + '%'
	SET @StringToSearch3 = '%' +@StringToSearch3 + '%'
	SET @Name = '%' +@Name + '%'

	SELECT ROUTINE_NAME, LEN(OBJECT_DEFINITION(OBJECT_ID(ROUTINE_NAME))) AS SP_Length
		FROM INFORMATION_SCHEMA.ROUTINES
	WHERE OBJECT_DEFINITION(OBJECT_ID(ROUTINE_NAME)) LIKE @stringtosearch
		AND OBJECT_DEFINITION(OBJECT_ID(ROUTINE_NAME)) LIKE @StringToSearch2
		AND OBJECT_DEFINITION(OBJECT_ID(ROUTINE_NAME)) LIKE @StringToSearch3
		AND (ROUTINE_TYPE='PROCEDURE' OR ROUTINE_TYPE='FUNCTION')
		AND ROUTINE_NAME LIKE @Name
	ORDER BY routine_name
GO
```

### OFFSET FETCH

Пропустить первые 10 строк из отсортированного набора результатов и вернуть остальные строки.

```sql
SELECT column1, column2 FROM table_name ORDER BY column1 OFFSET 10 ROWS;
```

Пропустить первые 10 строк из отсортированного набора результатов и вернуть следующие 5 строк.

```sql
SELECT column1, column2 FROM table_name ORDER BY column1 OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;
```

### Переименование Table

```sql
exec sp_rename '[schema.old_table_name]', 'new_table_name'
```

### Переименование Column

```sql
exec sp_rename 'table_name.[oldColumName]' , 'newColumName', 'COLUMN'
```

### SCOPE_IDENTITY

```sql
-- возвращает последнее значение IDENTITY, вставленное в столбец IDENTITY в той же области
-- возвращает последнее значение идентификатора, сгенерированное для любой таблицы в текущем сеансе и текущей области
-- область видимости — это модуль; хранимая процедура, триггер, функция или пакет

SELECT SCOPE_IDENTITY()
```

### Найти, какой таблице принадлежит ограничение

```sql
SELECT
    OBJECT_NAME(o.parent_object_id)
FROM
    sys.objects o
WHERE
    o.name = 'MyConstraintName' AND o.parent_object_id <> 0
```

### TRY-CATCH

```sql
BEGIN TRY
    BEGIN TRANSACTION

    -- Do something here

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    DECLARE
        @ErrorMessage NVARCHAR(4000),
        @ErrorSeverity INT,
        @ErrorState INT;
    SELECT
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();
    RAISERROR (
        @ErrorMessage,
        @ErrorSeverity,
        @ErrorState
    );

    ROLLBACK TRANSACTION
END CATCH
```

### Условия с переменными WHERE CLAUSE

```sql
-- using '=' operator
WHERE Column = IIF(@Variable IS NULL ,@Variable, Column)

-- using 'LIKE, IN, etc.'
WHERE (@Variable IS NULL OR Column LIKE '%' + @Variable + '%' )
```

### Вставить разделенную запятой строку в таблицу

```sql
DECLARE @String = '1, 4, 3'
DECLARE @Tbl TABLE(ID INT);

INSERT INTO @Tbl (ID)
(
    SELECT value
    FROM STRING_SPLIT(@String, ',')
    WHERE RTRIM(value) <> ''
);
```

### UPDATE с JOIN

```sql
UPDATE Table1
SET Table1.Column = B.Column
FROM Table1 A
    INNER JOIN Table2 B
        ON A.ID = B.ID
```

### DELETE с JOIN

```sql
DELETE A
FROM Table1 A
INNER JOIN Table2 B
    ON B.Id = A.Id
WHERE A.Column = 1 AND B.Column = 2
```

### UPDATE/INSERT identity column

```sql
SET IDENTITY_INSERT YourTable ON

-- UPDATE/INSERT STATEMENT HERE

SET IDENTITY_INSERT YourTable OFF
```

### Находим Foreign Key ограничения ссылок таблицы

```sql
SELECT
    OBJECT_NAME(f.parent_object_id) TableName,
    COL_NAME(fc.parent_object_id,fc.parent_column_id) ColName
FROM
    sys.foreign_keys AS f
INNER JOIN
    sys.foreign_key_columns AS fc
        ON f.OBJECT_ID = fc.constraint_object_id
INNER JOIN
    sys.tables t
        ON t.OBJECT_ID = fc.referenced_object_id
WHERE
    OBJECT_NAME (f.referenced_object_id) = 'Table_Name'
```

### Парсим JSON файл в таблицу

```sql
-- JSON Data sample:
-- {
-- "label": "test ",
-- "value": 1
-- },
-- {
-- "label": "test2 ",
-- "value": 2
-- }

DECLARE @tbl TABLE (id INT, label VARCHAR(500));

DECLARE @json VARCHAR(max);

SELECT @json = BulkColumn
    FROM OPENROWSET (BULK 'C:\jsonFile.json', SINGLE_CLOB) as j
    
    INSERT INTO @tbl (id, label)
    SELECT [value], label
    FROM OPENJSON(@json)
    WITH ([value] int,
        label nvarchar(max))

SELECT * FROM @tbl
```

### Добавляем FK в существующую колонку

```sql
ALTER TABLE [Table1]
ADD CONSTRAINT FK_Table2_Id FOREIGN KEY (Table1_Id)
    REFERENCES Table2(Table2_Id);
```

### Список всех пользовательских функций по типу

```sql
SELECT [Name], [Definition], [Type_desc]
    FROM sys.sql_modules m
INNER JOIN sys.objects o
    ON m.object_id=o.object_id
WHERE [Type_desc] like '%function%'
```

### Обновляем и изменяем часть строки

```sql
UPDATE dbo.[Table]
SET Value = REPLACE(Value, '123\', '')
WHERE ID <=4
```

### Генерируем случайные INT SQL

```sql
-- Создайте переменные для генерации случайных чисел
DECLARE @Random INT;
DECLARE @Upper INT;
DECLARE @Lower INT

-- Это создаст случайное число от 1 до 999
SET @Lower = 1   -- Наименьшее случайное число
SET @Upper = 999 -- Самое большое случайное число
SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
SELECT @Random
```

### Создаем случайные ДАТЫ между двумя диапазонами

```sql
DECLARE @FromDate DATE = '2019-09-01';
DECLARE @ToDate DATE = '2019-12-31';

SELECT DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(1+DATEDIFF(DAY, @FromDate, @ToDate)), @FromDate)
```

### Получаем список таблиц

```sql
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'
```

### Проверить, существует ли таблица в базе данных

```sql
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Table')
BEGIN
-- exists
END
```

### Сгенерировать 6-значный уникальный номер

```sql
SELECT LEFT(CAST(RAND()*1000000000+999999 AS INT),6) AS OTP
```

### Ищем table name

```sql
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE '%%'
```

### Поиск между двумя датами

```sql
-- convert to date to ignore time
SELECT * FROM Table T
WHERE CONVERT(DATE,T.DateColumn) BETWEEN COALESCE(CONVERT(DATE,@DateFrom), CONVERT(DATE,T.DateColumn)) AND COALESCE(
CONVERT(DATE,@DateTo), CONVERT(DATE,T.DateColumn))
```

### Формат дат

```sql
-- Output: 21/03/2022
SELECT FORMAT (getdate(), 'dd/MM/yyyy ') as date

-- Output: 21/03/2022, 11:36:14
SELECT FORMAT (getdate(), 'dd/MM/yyyy, hh:mm:ss ') as date

-- Output: Wednesday, March, 2022
SELECT FORMAT (getdate(), 'dddd, MMMM, yyyy') as date

-- Output: Mar 21 2022
SELECT FORMAT (getdate(), 'MMM dd yyyy') as date

-- Output: 03.21.22
SELECT FORMAT (getdate(), 'MM.dd.yy') as date

-- Output: 03-21-22
SELECT FORMAT (getdate(), 'MM-dd-yy') as date

-- Output: 11:36:14 AM
SELECT FORMAT (getdate(), 'hh:mm:ss tt') as date

-- Output: 03/21/2022
SELECT FORMAT (getdate(), 'd','us') as date
```

### Триггеры

```sql
create trigger t1 on table1
after insert
as
begin
    insert into Audit
    (Column)
    select 'Insert New Row with Key' + cast(t.Id as nvarchar(10)) + 'in table1'
    from table1 t where Id IN (select Id from inserted)
end
go
```

### Найти все таблицы, содержащие столбец с указанным именем

```sql
SELECT c.name AS 'ColumnName', t.name AS 'TableName'
FROM sys.columns c
JOIN sys.tables t ON c.object_id = t.object_id
WHERE c.name LIKE '%COLUMN_NAME%'
ORDER BY TableName, ColumnName;
```

### Скрипт для создания отбрасываемых всех таблиц с префиксом

```sql
SELECT 'DROP TABLE ' + TABLE_NAME + ''
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE 'PREFIX_%'
```

### Скрипт для изменения таблиц, чтобы удалить все ограничения

```sql
DECLARE @SQL varchar(4000)=''
SELECT @SQL =
@SQL + 'ALTER TABLE ' + s.name+'.'+t.name + ' DROP CONSTRAINT [' + RTRIM(f.name) +'];' + CHAR(13)
FROM sys.Tables t
INNER JOIN sys.foreign_keys f ON f.parent_object_id = t.object_id
INNER JOIN sys.schemas s ON s.schema_id = f.schema_id
WHERE t.name LIKE 'PREFIX_%'

-- EXEC (@SQL)

PRINT @SQL
```

## Cursor

### Перебрать набор данных

```sql
-- two variables to hold product name and list price (gonna be used on the loop)
DECLARE
    @product_name VARCHAR(MAX),
    @list_price DECIMAL;

-- defines the result set for the cursor
DECLARE cursor_product CURSOR
FOR SELECT
        product_name,
        list_price
    FROM
        dbo.products;

-- open cursor
OPEN cursor_product;

-- fetch a row from the cursor into one or more variables
FETCH NEXT FROM cursor_product INTO
    @product_name,
    @list_price;

-- loop through the cursor
WHILE @@FETCH_STATUS = 0
    BEGIN
        -- use current product_name and list_price from current index of the cursor in the loop
        PRINT @product_name + CAST(@list_price AS varchar);
        -- fetch next row from the cursor
        FETCH NEXT FROM cursor_product INTO
        @product_name,
        @list_price;
    END;

-- close cursor
CLOSE cursor_product;

-- deallocate the cursor to release it
DEALLOCATE cursor_product;
Join Multiple Tables
SELECT
comments.body,
posts.title,
users.first_name,
users.last_name
FROM comments
INNER JOIN posts on posts.id = comments.post_id
INNER JOIN users on users.id = comments.user_id
ORDER BY posts.title;
Aggregate Functions
SELECT COUNT(id) FROM users;
SELECT MAX(age) FROM users;
SELECT MIN(age) FROM users;
SELECT SUM(age) FROM users;
SELECT UCASE(first_name), LCASE(last_name) FROM users;
Group By
SELECT age, COUNT(age) FROM users GROUP BY age;
SELECT age, COUNT(age) FROM users WHERE age > 20 GROUP BY age;
SELECT age, COUNT(age) FROM users GROUP BY age HAVING count(age) >=2;
```

[https://uproger.com/shpargalki-sql-2023/](https://uproger.com/shpargalki-sql-2023/)

[Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"