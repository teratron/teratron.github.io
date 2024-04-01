# match

← [Назад][back]

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

### Установка псевдонимов и паттерн as

```python
def print_person(person):
    match person:
        case "Tom" | "Tomas" | "Tommy" as name:
            print(f"Name: {name}")
        case _:
            print("Undefined")
 
print_person("Tom")     # Name: Tom
print_person("Tomas")   # Name: Tomas
print_person("Bob")     # Undefined
```

## Кортежи

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

### Ограничения шаблонов

```python
def check_data(data):
    match data:
        case name, age if name == "admin" or age not in range(1, 101):
            print("Некорректные значения")
        case name, age:
            print(f"Данные проверены. Name: {name}  Age: {age}")

check_data(("admin", -45))      # Некорректные значения
check_data(("Tom", 37))         # Данные проверены. Name: Tom  Age: 37
```

### Установка псевдонимов и паттерн as

```python
def print_person(person):
    match person:
        case ("Tom" | "Tomas" as name, 37 | 38 as age):   # псевдонимы для отдельных значений
            print(f"Tom | Name: {name}  Age: {age}")
        case ("Bob" | "Robert", 41 | 42) as bob:          # псевдоним для всего шаблона
            print(f"Bob | Name: {bob[0]}  Age: {bob[1]}")
        case _:
            print("Undefined")

print_person(("Tomas", 38))     # Tom | Name: Tomas  Age: 38
print_person(("Robert", 41))    # Bob | Name: Robert  Age: 41
```

## Массивы

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

## Словари

### Словари в pattern matching

```python
def look(words):
    match words:
        case {"red": "красный", "blue": "синий"}:  # если в словаре words слова red и blue
            print("Слова red и blue есть в словаре")
        case {"red": "красный"}:                   # если в словаре words есть слово red
            print("Слово red есть в словаре, а слово blue отсутствует")
        case {"blue": "синий"}:                    # если в словаре words есть слово blue
            print("Слово blue есть в словаре, а слово red отсутствует")
        case {}:
            print("Слова red и blue в словаре отсутствует")
        case _:
            print("Это не словарь")

look({"red": "красный", "blue": "синий", "green": "зеленый"})   # Слова red и blue есть в словаре
look({"red": "красный", "green": "зеленый"})                    # Слово red есть в словаре, а слово blue отсутствует
look({"blue": "синий", "green": "зеленый"})                     # Слово blue есть в словаре, а слово red отсутствует
look({"green": "зеленый"})                                      # Слова red и blue в словаре отсутствует
look("yelllow")                                                 # Это не словарь
```

### Передача набора значений

```python
def look(words):
    match words:
        case {"red": "красный" | "алый" | "червонный"}:  # если значение "красный", "алый" или "червонный"
            print("Слово red есть в словаре")
        case {}:
            print("Слово red в словаре отсутствует или имеет некорректное значение")

look({"red": "красный", "green": "зеленый"})        # Слово red есть в словаре
look({"red": "алый", "green": "зеленый"})           # Слово red есть в словаре
look({"green": "зеленый"})                          # Слово red в словаре отсутствует или имеет некорректное значение
```

```python
def look(words):
    match words:
        case {"red": "красный"} | {"blue": "синий"}:
            print("либо red, либо blue есть в словаре")
        case {}:
            print("надо проверить слова red и blue")

look({"red": "красный", "green": "зеленый"})    # либо red, либо blue есть в словаре
look({"blue": "синий", "green": "зеленый"})     # либо red, либо blue есть в словаре
look({"green": "зеленый"})                      # надо проверить слова red и blue
```

```python
def look(words):
    match words:
        case {"red": _, "blue": _}:
            print("Слова red и blue есть в словаре")
        case {}:
            print("red и/или blue отсутствуют в словаре")

look({"red": "красный", "blue": "синий"})       # Слова red и blue есть в словаре
look({"red": "алый", "blue": "синий"})          # Слова red и blue есть в словаре
look({"red": "красный", "green": "зеленый"})    # red и/или blue отсутствуют в словаре
```

### Получение значений по ключам

```python
def look(words):
    match words:
        case {"red": red, "blue": blue}:
            print(f"red: {red}  blue: {blue}")
        case {}:
            print("надо проверить слова red и blue")

look({"red": "красный", "blue": "синий"})    # red: красный  blue: синий
look({"red": "алый", "blue": "синий"})       # red: алый  blue: синий
```

### Получение всех значений

С помощью символов `**` можно получить остальные элементы словаря:

```python
def look(words):
    match words:
        case {"red": red, **rest}:
            print(f"red: {red}")
            for key in rest:        # rest - тоже словарь
                print(f"{key}: {rest[key]}")

look({"red": "красный", "blue": "синий", "green": "зеленый"})
# red: красный
# blue: синий
# green: зеленый
```

## Классы

### Классы в pattern matching

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

def print_person(person):
    match person:
        case Person(name="Tom", age=37):
            print("Default Person")
        case Person(name=name, age=37):
            print(f"Name: {name}")
        case Person(name="Tom", age=age):
            print(f"Age: {age}")
        case Person(name=name, age=age):
            print(f"Name: {name}  Age: {age}")

print_person(Person("Tom", 37))  # Default person
print_person(Person("Tom", 22))  # Age: 22
print_person(Person("Sam", 37))  # Name: Sam
print_person(Person("Bob", 41))  # Name: Bob  Age: 41
```

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

def print_person(person):
    match person:
        case Person(name="Tom"):
            print("Default Person")
        case Person(name=person_name):         # получаем только атрибут name
            print(f"Name: {person_name}")
        case _:
            print("Not a Person")

print_person(Person("Tom", 37))  # Default person
print_person(Person("Sam", 37))  # Name: Sam
print_person("Tom")              # Not a Person
```

### Передача набора значений

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

def print_person(person):
    match person:
        case Person(name="Tom" | "Tomas" | "Tommy"):
            print("Default Person")
        case Person(name=person_name):         # получаем только атрибут name
            print(f"Name: {person_name}")
        case _:
            print("Not a Person")

print_person(Person("Tom", 37))     # Default person
print_person(Person("Tomas", 37))   # Default person
```

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

class Student:
    def __init__(self, name):
        self.name = name

def print_person(person):
    match person:
        case Person(name="Tom") | Student(name="Tomas"):
            print("Default Person/Student")
        case Person(name=name) | Student(name=name):    # получаем только атрибут name
            print(f"Name: {name}")
        case _:
            print("Not a Person or Student")

print_person(Person("Tom", 37))     # Default Person/Student
print_person(Student("Tomas"))      # Default Person/Student

print_person(Person("Bob", 41))     # Name: Bob
print_person(Student("Mike"))       # Name: Mike

print_person("Tom")                 # Not a Person or Student
```

### Позиционные параметры

```python
class Person:
    __match_args__ = ("name", "age")
    def __init__(self, name, age):
        self.name = name
        self.age = age

def print_person(person):
    match person:
        case Person("Tom", 37):
            print("Default Person")
        case Person(person_name, 37):
            print(f"Name: {person_name}")
        case Person("Tom", person_age):
            print(f"Age: {person_age}")
        case Person(person_name, person_age):
            print(f"Name: {person_name}  Age: {person_age}")

print_person(Person("Tom", 37))  # Default person
print_person(Person("Tom", 22))  # Age: 22
print_person(Person("Sam", 37))  # Name: Sam
print_person(Person("Bob", 41))  # Name: Bob  Age: 41
```

### Ограничения шаблонов или guards

**Guard** или ограничения шаблонов позволяют установить дополнительные условия, которым должно соответствовать
выражение.
Ограничение задается сразу после шаблона с помощью ключевого слова `if`, после которого идет условие ограничения:

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

def enter(person):
    match person:
        case Person(name=name, age=age) if age < 18:
            print(f"{name}, доступ запрещен")
        case Person(name=name, age=age) if age < 22:
            print(f"{name}, доступ  ограничен")
        case Person(name=name):
            print(f"{name}, у вас полноценный доступ!")

enter(Person("Tom", 37))        # Tom, у вас полноценный доступ!
enter(Person("Bob", 20))        # Bob, доступ  ограничен
enter(Person("Sam", 12))        # Sam, доступ запрещен
```

### Установка псевдонимов и паттерн as

```python
class Person:
    __match_args__ = ("name", "age")
    def __init__(self, name, age):
        self.name = name
        self.age = age

def print_family(family):
    match family:
        case (Person() as husband, Person() as wife):
            print(f"Husband. Name: {husband.name}  Age: {husband.age}")
            print(f"Wife. Name: {wife.name}  Age: {wife.age}")
        case _:
            print("Undefined")

print_family((Person("Tom", 37), Person("Alice", 33)))
# Husband. Name: Tom  Age: 37
# Wife. Name: Alice  Age: 33

print_family((Person("Sam", 28), Person("Kate", 25)))
# Husband. Name: Sam  Age: 28
# Wife. Name: Kate  Age: 25
```

Здесь функция `print_family` принимает кортеж, который должен состоять из двух элементов `Person`.
В первом шаблоне определяем для первого элемента псевдоним `husband`, а для второго - псевдоним `wife`.
Затем, используя эти псевдонимы, мы можем обращаться к их атрибутам.

← [Назад][back]

[back]: <.> "Назад к оглавлению"