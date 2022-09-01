# match

[Назад][back]

```python
def print_hello(language):
    match language:
        case "russian":
            print("Привет")
        case "english" | "british english" | "english":
            print("Hello")
        case "german": print("Hallo")
        case _:
            print("Undefined")

print_hello("english")      # Hello
print_hello("german")       # Hallo
print_hello("russian")      # Привет
print_hello("spanish")      # Undefined
```

```python
def operation(a, b, code):
    match code:
        case 1:
            return a + b
        case 2:
            return a - b
        case 3:
            return a * b
        case _:
            return 0

print(operation(10, 5, 1))      # 15
print(operation(10, 5, 2))      # 5
print(operation(10, 5, 3))      # 50
print(operation(10, 5, 4))      # 0
```

### Кортежи в pattern matching

```python
def print_data(user):
    match user:
        case ("Tom" | "Tomas" | "Tommy", 37) | ("Sam", 22):
            print("default user")
        case ("Tom", age):
            print(f"Age: {age}")
        case (name, 22):
            print(f"Name: {name}")
        case (name, age):
            print(f"Name: {name}  Age: {age}")

print_data(("Tom", 37))     # default user
print_data(("Tomas", 37))   # default user
print_data(("Tom", 28))     # Age: 28
print_data(("Sam", 37))     # Name: Sam  Age: 37
```

### Пропуск элементов

```python
def print_data(user):
    match user:
        case ("Tom", 37):
            print("default user")
        case ("Sam", _):
            print("Name: Sam")
        case (_, _):
            print("Undefined user")

print_data(("Tom", 37))     # default user
print_data(("Sam", 25))     # Name: Sam
print_data(("Bob", 41))     # Undefined user
```

```python
def print_data(user):
    match user:
        case (name, age):
            print(f"Name: {name}  Age: {age}")
        case (name, age, company):
            print(f"Name: {name}  Age: {age}  Company: {company}")
        case (name, age, company, lang):
            print(f"Name: {name}  Age: {age}  Company: {company} Language: {lang}")

print_data(("Tom", 37))                         # Name: Tom  Age: 37
print_data(("Sam", 22, "Microsoft"))            # Name: Sam  Age: 22  Company: Microsoft
print_data(("Bob", 41, "Google", "english"))    # Name: Bob  Age: 41  Company: Google Language: english
```

### Кортеж с неопределенным количеством элементов

```python
def print_data(user):
    match user:
        case ("Tom", 37, *rest):
            print(f"Rest: {rest}")
        case (name, age, *rest):
            print(f"{name} ({age}): {rest}")

print_data(("Tom", 37))                             # Rest: []
print_data(("Tom", 37, "Google"))                   # Rest: ["Google"]
print_data(("Bob", 41, "Microsoft", "english"))     # Bob (41): ["Microsoft", "english"]
```

```python
def print_data(user):
    match user:
        case ("Tom", 37, *_):
            print("Default user")
        case (name, age, *_):
            print(f"{name} ({age})")

print_data(("Tom", 37))                             # Default user
print_data(("Tom", 37, "Google"))                   # Default user
print_data(("Bob", 41, "Microsoft", "english"))     # Bob (41)
```

### Массивы в pattern matching

```python
def print_people(people):
    match people:
        case ["Tom", "Sam", "Bob"]:
            print("default people")
        case ["Tom", second, _]:
            print(f"Second Person: {second}")
        case [first, second, third]:
            print(f"{first}, {second}, {third}")

print_people(["Tom", "Sam", "Bob"])         # default people
print_people(["Tom", "Mike", "Bob"])        # Second Person: Mike
print_people(["Alice", "Bill", "Kate"])     # Alice, Bill, Kate
print_people(["Tom", "Kate"])               # несоответствует ни одному из шаблонов
```

```python
def print_people(people):
    match people:
        case [_]:
            print("Массив из одного элемента")
        case [_, _]:
            print("Массив из двух элементов")
        case [_, _, _]:
            print("Массив из трех элементов")
        case _:
            print("Непонятно")

print_people(["Tom"])                   # Массив из одного элемента
print_people(["Tom", "Sam"])            # Массив из двух элементов
print_people(["Tom", "Sam", "Bob"])     # Массив из трех элементов
print_people("Tom")                     # Непонятно
```

### Массивы неопределенной длины

```python
def print_people(people):
    match people:
        case [first, *other]:
            print(f"First: {first}  Other: {other}")

print_people(["Tom"])                   # First: Tom  Other: []
print_people(["Tom", "Sam"])            # First: Tom  Other: ["Sam"]
print_people(["Tom", "Sam", "Bob"])     # First: Tom  Other: ["Sam", "Bob"]
```

```python
def print_people(people):
    match people:
        case [first, *_]:
            print(f"First: {first}")

print_people(["Tom"])                   # First: Tom
print_people(["Sam", "Tom"])            # First: Sam
print_people(["Bob", "Sam", "Tom"])     # First: Bob
```

### Альтернативные значения

```python
def print_people(people):
    match people:
        case ["Tom", "Sam", "Bob"] | ["Tomas", "Sam", "Bob"]:
            print("Tom/Tomas, Sam, Bob")
        case [first, second, third]:
            print(f"{first}, {second}, {third}")

print_people(["Tom", "Sam", "Bob"])         # Tom/Tomas, Sam, Bob
print_people(["Tomas", "Sam", "Bob"])       # Tom/Tomas, Sam, Bob
print_people(["Alice", "Bill", "Kate"])     # Alice, Bill, Kate
```

### Словари в pattern matching

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