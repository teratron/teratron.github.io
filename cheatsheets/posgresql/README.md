# PostgreSQL

← [Назад к перечню шпаргалок][back]

## Ограничения столбцов и таблиц

### PRIMARY KEY

С помощью выражения PRIMARY KEY столбец можно сделать первичным ключом.
Первичный ключ уникально идентифицирует строку в таблице.

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30),
    LastName CHARACTER VARYING(30),
    Email CHARACTER VARYING(30),
    Age INTEGER
)
```

```posgresql
CREATE TABLE Customers
(
    Id SERIAL,
    FirstName CHARACTER VARYING(30),
    LastName CHARACTER VARYING(30),
    Email CHARACTER VARYING(30),
    Age INTEGER,
    PRIMARY KEY(Id)
);
```

#### Compound key

таблице OrderLines не может быть двух строк, где для обоих из этих полей одновременно были бы одни и те же значения.

```posgresql
CREATE TABLE OrderLines
(
    OrderId INTEGER,
    ProductId INTEGER,
    Quantity INTEGER,
    Price MONEY,
    PRIMARY KEY(OrderId, ProductId)
);
```

### UNIQUE

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(20),
    LastName CHARACTER VARYING(20),
    Email CHARACTER VARYING(30) UNIQUE,
    Phone CHARACTER VARYING(30) UNIQUE,
    Age INTEGER
);
```

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(20),
    LastName CHARACTER VARYING(20),
    Email CHARACTER VARYING(30),
    Phone CHARACTER VARYING(30),
    Age INTEGER,
    UNIQUE(Email, Phone)
);
```

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(20),
    LastName CHARACTER VARYING(20),
    Email CHARACTER VARYING(30),
    Phone CHARACTER VARYING(30),
    Age INTEGER,
    UNIQUE(Email),
    UNIQUE(Phone)
);
```

### NULL и NOT NULL

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(20) NOT NULL,
    LastName CHARACTER VARYING(20) NOT NULL,
    Age INTEGER
);
```

### DEFAULT

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(20),
    LastName CHARACTER VARYING(20),
    Age INTEGER DEFAULT 18
);
```

### CHECK

Ключевое слово CHECK задает ограничение для диапазона значений, которые могут храниться в столбце.

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(20),
    LastName CHARACTER VARYING(20),
    Age INTEGER DEFAULT 18 CHECK(Age >0 AND Age < 100),
    Email CHARACTER VARYING(30) UNIQUE CHECK(Email !=''),
    Phone CHARACTER VARYING(20) UNIQUE CHECK(Phone !='')
);
```

Также с помощью CHECK можно создать ограничение в целом для таблицы:

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    Age INTEGER DEFAULT 18,
    FirstName CHARACTER VARYING(20),
    LastName CHARACTER VARYING(20),
    Email CHARACTER VARYING(30) UNIQUE,
    Phone CHARACTER VARYING(20) UNIQUE,
    CHECK((Age >0 AND Age<100) AND (Email !='') AND (Phone !=''))
);
```

### CONSTRAINT

С помощью ключевого слова CONSTRAINT можно задать имя для ограничений.
В качестве ограничений могут использоваться PRIMARY KEY, UNIQUE, CHECK.

```posgresql
CREATE TABLE Customers
(
    Id SERIAL CONSTRAINT customer_Id PRIMARY KEY,
    Age INTEGER CONSTRAINT customers_age_check CHECK(Age >0 AND Age < 100),
    FirstName CHARACTER VARYING(20) NOT NULL,
    LastName CHARACTER VARYING(20) NOT NULL,
    Email CHARACTER VARYING(30) CONSTRAINT customers_email_key UNIQUE,
    Phone CHARACTER VARYING(20) CONSTRAINT customers_phone_key UNIQUE
);
```

```posgresql
CREATE TABLE Customers
(
    Id SERIAL,
    Age INTEGER,
    FirstName CHARACTER VARYING(20) NOT NULL,
    LastName CHARACTER VARYING(20) NOT NULL,
    Email CHARACTER VARYING(30),
    Phone CHARACTER VARYING(20),
    CONSTRAINT customer_Id PRIMARY KEY(Id),
    CONSTRAINT customers_age_check CHECK(Age >0 AND Age < 100),
    CONSTRAINT customers_email_key UNIQUE(Email),
    CONSTRAINT customers_phone_key UNIQUE(Phone)
);
```

## Внешние ключи

### REFERENCES

Customers является главной и представляет клиента.
Orders является зависимой и представляет заказ, сделанный клиентом.
Эта таблица через столбец CustomerId связана с таблицей Customers и ее столбцом Id.

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    Age INTEGER,
    FirstName VARCHAR(20) NOT NULL
);

CREATE TABLE Orders
(
    Id SERIAL PRIMARY KEY,
    CustomerId INTEGER REFERENCES Customers (Id),
    Quantity INTEGER
);
```

```posgresql
CREATE TABLE Customers
(
    Id SERIAL PRIMARY KEY,
    Age INTEGER,
    FirstName VARCHAR(20) NOT NULL
);

CREATE TABLE Orders
(
    Id SERIAL PRIMARY KEY,
    CustomerId INTEGER,
    Quantity INTEGER,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id)
);
```

### ON DELETE и ON UPDATE

С помощью выражений ON DELETE и ON UPDATE можно установить действия, которые выполняются соответственно при удалении и изменении связанной строки из главной таблицы.

| опции |  |
|---|---|
| CASCADE | автоматически удаляет или изменяет строки из зависимой таблицы при удалении или изменении связанных строк в главной таблице. |
| RESTRICT | предотвращает какие-либо действия в зависимой таблице при удалении или изменении связанных строк в главной таблице. То есть фактически какие-либо действия отсутствуют. |
| NO ACTION | действие по умолчанию, предотвращает какие-либо действия в зависимой таблице при удалении или изменении связанных строк в главной таблице. И генерирует ошибку. В отличие от RESTRICT выполняет отложенную проверку на связанность между таблицами. |
| SET NULL | при удалении связанной строки из главной таблицы устанавливает для столбца внешнего ключа значение NULL. |
| SET DEFAULT | при удалении связанной строки из главной таблицы устанавливает для столбца внешнего ключа значение по умолчанию, которое задается с помощью атрибуты DEFAULT. Если для столбца не задано значение по умолчанию, то в качестве него применяется значение NULL. |

#### CASCADE

```posgresql
CREATE TABLE Orders
(
    Id SERIAL PRIMARY KEY,
    CustomerId INTEGER,
    Quantity INTEGER,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE CASCADE
)
```

#### SET NULL

```posgresql
CREATE TABLE Orders
(
    Id SERIAL PRIMARY KEY,
    CustomerId INTEGER,
    Quantity INTEGER,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE SET NULL
);
```

#### SET DEFAULT

```posgresql
CREATE TABLE Orders
(
    Id SERIAL PRIMARY KEY,
    CustomerId INTEGER DEFAULT 1,
    Quantity INTEGER,
    FOREIGN KEY (CustomerId) REFERENCES Customers (Id) ON DELETE SET DEFAULT
);
```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

```posgresql

```

← [Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"
