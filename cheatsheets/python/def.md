# def

[Назад][back]

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

Выход из функции

```python
def get_message():
    return "Hello METANIT.COM"
    print("End of the function") # не имеет смысла - она никогда выполнится

print(get_message())
```

### Функция как тип

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

[Назад][back]

[back]: <.> "Назад к оглавлению"