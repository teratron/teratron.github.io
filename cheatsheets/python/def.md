# def

← [Назад][back]

```python
def say_hello():    # определение функции say_hello
    print("Hello")

say_hello()         # вызов функции say_hello
```

```python
def say_hello(): print("Hello")

say_hello()
```

### Параметры функции

```python
def print_person(name, age):
    print(f"Name: {name}")
    print(f"Age: {age}")

print_person("Tom", 37)
```

### Значения по умолчанию

```python
def print_person(name, age = 18):
    print(f"Name: {name}  Age: {age}")

print_person("Bob")
print_person("Tom", 37)
```

```python
def print_person(name = "Tom", age = 18):
    print(f"Name: {name}  Age: {age}")

print_person()          # Name: Tom  Age: 18
print_person("Bob")     # Name: Bob  Age: 18
print_person("Sam", 37) # Name: Sam  Age: 37
```

### Именованные параметры

```python
def print_person(name, age):
    print(f"Name: {name}  Age: {age}")

print_person(age = 22, name = "Tom")
```

Все параметры, которые располагаются справа от символа `*`, получают значения **только по имени**:

```python
def print_person(name, *,  age, company):
    print(f"Name: {name}  Age: {age}  Company: {company}")

print_person("Bob", age = 41, company ="Microsoft") # Name: Bob  Age: 41  company: Microsoft
```

Можно сделать все параметры именованными, поставив перед списком параметров символ `*`:

```python
def print_person(*,  name, age, company):
    print(f"Name: {name}  Age: {age}  Company: {company}")
```

Все параметры, которые идут до символа `/`, являются позиционными и могут получать значения **только по позиции**:

```python
def print_person(name, /, age, company="Microsoft"):
    print(f"Name: {name}  Age: {age}  Company: {company}")
 
print_person("Tom", company="JetBrains", age = 24) # Name: Tom  Age: 24  company: JetBrains
print_person("Bob", 41)                            # Name: Bob  Age: 41  company: Microsoft
```

Для одной функции можно определять одновременно позиционные и именованные параметры:

```python
def print_person(name, /,  age = 18, *, company):
    print(f"Name: {name}  Age: {age}  Company: {company}")

print_person("Sam", company ="Google")              # Name: Sam  Age: 18  company: Google
print_person("Tom", 37, company ="JetBrains")       # Name: Tom  Age: 37  company: JetBrains
print_person("Bob", company ="Microsoft", age = 42) # Name: Bob  Age: 42  company: Microsoft
```

### Неопределенное количество параметров

```python
def sum(*numbers):
    result = 0
    for n in numbers:
        result += n
    print(f"sum = {result}")

sum(1, 2, 3, 4, 5) # sum = 15
sum(3, 4, 5, 6)    # sum = 18
```

### Возвращение результата return

```python
def sum(a, b):
    return a + b

result = sum(4, 6)                  # result = 0
print(f"sum(4, 6) = {result}")      # sum(4, 6) = 10
print(f"sum(3, 5) = {sum(3, 5)}")   # sum(3, 5) = 8
```

Выход из функции:

```python
def get_message():
    return
    print("End of the function") # не имеет смысла - она никогда выполнится

print(get_message())
```

### Функция как тип

```python
def sum(a, b): return a + b
def multiply(a, b): return a * b

operation = sum
result = operation(5, 6)
print(result)            # 11

operation = multiply
print(operation(5, 6))   # 30
```

### Функция как параметр функции

```python
def do_operation(a, b, operation):
    result = operation(a, b)
    print(f"result = {result}")

def sum(a, b): return a + b
def multiply(a, b): return a * b

do_operation(5, 4, sum)        # result = 9
do_operation(5, 4, multiply)   # result = 20
```

### Функция как результат функции

```python
def sum(a, b): return a + b
def subtract(a, b): return a - b
def multiply(a, b): return a * b

def select_operation(choice):
    if choice == 1:
        return sum
    elif choice == 2:
        return subtract
    else:
        return multiply

operation = select_operation(1)     # operation = sum
print(operation(10, 6))             # 16

operation = select_operation(2)     # operation = subtract
print(operation(10, 6))             # 4

operation = select_operation(3)     # operation = multiply
print(operation(10, 6))             # 60
```

### Замыкания closure

```python
def outer():          # внешняя функция
    n = 5             # лексическое окружение - локальная переменная
    def inner():      # локальная функция
        nonlocal n
        n += 1        # операции с лексическим окружением
        print(n)
    return inner

fn = outer()   # fn = inner, так как функция outer возвращает функцию inner
# вызываем внутреннюю функцию inner
fn()    # 6
fn()    # 7
fn()    # 8
```

Применение параметров:

```python
def multiply(n):
    def inner(m): return n * m
    return inner

fn = multiply(5)
print(fn(5))        # 25
print(fn(6))        # 30
print(fn(7))        # 35
```

### Скрытие переменных

```python
name = "Tom"

def say_hi():
    name = "Bob"        # скрываем значение глобальной переменной
    print("Hello", name)

def say_bye():
    print("Good bye", name)

say_hi()    # Hello Bob
say_bye()   # Good bye Tom
```

### global {#global-id}

```python
name = "Tom"

def say_hi():
    global  name
    name = "Bob"        # изменяем значение глобальной переменной
    print("Hello", name)

def say_bye():
    print("Good bye", name)

say_hi()    # Hello Bob
say_bye()   # Good bye Bob
```

### nonlocal {#nonlocal-id}

```python
def outer():    # внешняя функция
    n = 5
    def inner():    # вложенная функция
        nonlocal n  # указываем, что n - это переменная из окружающей функции
        n = 25
        print(n)
    inner()     # 25
    print(n)

outer()         # 25
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"