### Создание базы данных

```mysql
CREATE DATABASE productsdb;
CREATE DATABASE IF NOT EXISTS productsdb;
```

### Установка/подключение базы данных

```mysql
USE productsdb;
```

### Удаление базы данных

```mysql
DROP DATABASE productsdb;
DROP DATABASE IF EXISTS productsdb;
```

### Создание таблицы

```mysql
CREATE TABLE Customers
(
    Id        INT PRIMARY KEY AUTO_INCREMENT,
    Age       INT DEFAULT 18 CHECK (Age > 0 AND Age < 100),
    FirstName VARCHAR(20) NOT NULL,
    LastName  VARCHAR(20) NOT NULL,
    Email     VARCHAR(30) NULL UNIQUE CHECK (Email != ''),
    Phone     VARCHAR(20) NULL UNIQUE CHECK (Phone != '')
);

CREATE TABLE IF NOT EXISTS Customers
(
    Id    INT,
    Age   INT,
    Email VARCHAR(30),
    Phone VARCHAR(20),
    PRIMARY KEY (Id),
    UNIQUE (Email, Phone),
    CHECK ((Age > 0 AND Age < 100) AND (Email != '') AND (Phone != ''))
);
```

Здесь поля OrderId и ProductId вместе выступают как составной первичный ключ.
То есть в таблице OrderLines не может быть двух строк, где для обоих из этих полей одновременно были бы одни и те же
значения.

```mysql
CREATE TABLE OrderLines
(
    OrderId   INT,
    ProductId INT,
    Quantity  INT,
    Price MONEY,
    PRIMARY KEY (OrderId, ProductId)
);
```

В данном случае ограничение для PRIMARY KEY называется customers_pk, для UNIQUE - customer_phone_uq, а для CHECK -
customer_age_chk.
Смысл установки имен ограничений заключается в том, что впоследствии через эти имена мы сможем управлять ограничениями -
удалять или изменять их.
Установить имя можно для ограничений PRIMARY KEY, CHECK, UNIQUE, а также FOREIGN KEY.

```mysql
CREATE TABLE Customers
(
    Id        INT AUTO_INCREMENT,
    Age       INT,
    FirstName VARCHAR(20) NOT NULL,
    LastName  VARCHAR(20) NOT NULL,
    Email     VARCHAR(30),
    Phone     VARCHAR(20),
    CONSTRAINT customers_pk PRIMARY KEY (Id),
    CONSTRAINT customer_phone_uq UNIQUE (Phone),
    CONSTRAINT customer_age_chk CHECK (Age > 0 AND Age < 100)
);
```

### Переименование таблиц

```mysql
RENAME TABLE старое_название TO новое_название;
RENAME TABLE Customers TO Clients;
```

### Полное удаление данных

```mysql
TRUNCATE TABLE Clients;
```

### Удаление таблиц

```mysql
DROP TABLE Clients;
DROP TABLE IF EXISTS Clients;
```

### Атрибуты столбцов и таблиц

| Keyword        | Описание                                                                                                                                                                                                            |
|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PRIMARY KEY    | первичный уникально идентифицирует строку в таблице                                                                                                                                                                 |
| AUTO_INCREMENT | значение столбца будет автоматически увеличиваться при добавлении новой строки                                                                                                                                      |
| UNIQUE         | столбец может хранить только уникальные значения                                                                                                                                                                    |
| NULL           | атрибут явным образом не будет использован, то по умолчанию столбец будет допускать значение NULL. Исключением является тот случай, когда столбец выступает в роли первичного ключа                                 |
| NOT NULL       | не обязательное к заполнению поле                                                                                                                                                                                   |
| DEFAULT        | определяет значение по умолчанию для столбца                                                                                                                                                                        |
| CHECK          | задает ограничение для диапазона значений                                                                                                                                                                           |
| CONSTRAINT     | можно задать имя для ограничений, через эти имена мы сможем управлять ограничениями - удалять или изменять их                                                                                                       |
| FOREIGN KEY    | внешний ключ устанавливается для столбцов из зависимой, подчиненной таблицы, и указывает на один из столбцов из главной таблицы. Как правило, внешний ключ указывает на первичный ключ из связанной главной таблицы |

### Внешние ключи FOREIGN KEY

В данном случае определены таблицы Customers и Orders.
Customers является главной и представляет клиента.
Orders является зависимой и представляет заказ, сделанный клиентом.
Таблица Orders через столбец CustomerId связана с таблицей Customers и ее столбцом Id.
То есть столбец CustomerId является внешним ключом, который указывает на столбец Id из таблицы Customers.

```mysql
CREATE TABLE Customers
(
    Id        INT PRIMARY KEY AUTO_INCREMENT,
    Age       INT,
    FirstName VARCHAR(20) NOT NULL,
    LastName  VARCHAR(20) NOT NULL,
    Phone     VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Orders
(
    Id         INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt  Date,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id)
);
```

С помощью оператора CONSTRAINT можно задать имя для ограничения внешнего ключа.

```mysql
CREATE TABLE Orders
(
    Id         INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt  Date,
    CONSTRAINT orders_custonmers_fk FOREIGN KEY (CustomerId) REFERENCES Customers (Id)
);
```

### ON DELETE и ON UPDATE

С помощью выражений ON DELETE и ON UPDATE можно установить действия, которые выполняются соответственно при удалении и
изменении связанной строки из главной таблицы.
В качестве действия могут использоваться следующие опции:

| Keyword     | Описание                                                                                                                                                                                                                                                                   |
|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CASCADE     | автоматически удаляет или изменяет строки из зависимой таблицы при удалении или изменении связанных строк в главной таблице.                                                                                                                                               |
| SET NULL    | при удалении или обновлении связанной строки из главной таблицы устанавливает для столбца внешнего ключа значение NULL. (В этом случае столбец внешнего ключа должен поддерживать установку NULL)                                                                          |
| RESTRICT    | отклоняет удаление или изменение строк в главной таблице при наличии связанных строк в зависимой таблице.                                                                                                                                                                  |
| NO ACTION   | то же самое, что и RESTRICT.                                                                                                                                                                                                                                               |
| SET DEFAULT | при удалении связанной строки из главной таблицы устанавливает для столбца внешнего ключа значение по умолчанию, которое задается с помощью атрибуты DEFAULT. Несмотря на то, что данная опция в принципе доступна, однако движок InnoDB не поддерживает данное выражение. |

Каскадное удаление позволяет при удалении строки из главной таблицы автоматически удалить все связанные строки из
зависимой таблицы.
Для этого применяется опция CASCADE.
Подобным образом работает и выражение ON UPDATE CASCADE.

```mysql
CREATE TABLE Orders
(
    Id         INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt  Date,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE CASCADE
);
```

При установках для внешнего ключа опции SET NULL необходимо, чтобы столбец внешнего ключа допускал значение NULL.

```mysql
CREATE TABLE Orders
(
    Id         INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt  Date,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE SET NULL
);
```

### Добавление нового столбца

```mysql
ALTER TABLE Customers
    ADD Address VARCHAR(50) NULL;
```

### Удаление столбца

```mysql
ALTER TABLE Customers
    DROP COLUMN Address;
```

### Изменение значения по умолчанию

```mysql
ALTER TABLE Customers
    ALTER COLUMN Age SET DEFAULT 22;
```

### Изменение типа столбца

```mysql
ALTER TABLE Customers
    MODIFY COLUMN FirstName CHAR(100) NULL;
```

### Добавление и удаление внешнего ключа

```mysql
CREATE TABLE Customers
(
    Id        INT PRIMARY KEY AUTO_INCREMENT,
    Age       INT,
    FirstName VARCHAR(20) NOT NULL,
    LastName  VARCHAR(20) NOT NULL
);

CREATE TABLE Orders
(
    Id         INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreatedAt  Date
);

ALTER TABLE Orders
    ADD FOREIGN KEY (CustomerId) REFERENCES Customers (Id);
```

При добавлении ограничений мы можем указать для них имя, используя оператор CONSTRAINT, после которого указывается имя
ограничения:

```mysql
ALTER TABLE Orders
    ADD CONSTRAINT orders_customers_fk FOREIGN KEY (CustomerId) REFERENCES Customers (Id);
```

В данном случае ограничение внешнего ключа называется orders_customers_fk.
Затем по этому имени мы можем удалить ограничение:

```mysql
ALTER TABLE Orders
    DROP FOREIGN KEY orders_customers_fk;
```

### Добавление и удаление первичного ключа

```mysql
CREATE TABLE Products
(
    Id    INT,
    Model VARCHAR(20)
);

ALTER TABLE Products
    ADD PRIMARY KEY (Id);
ALTER TABLE Products
    DROP PRIMARY KEY;
```
