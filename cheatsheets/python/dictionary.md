# dictionary

← [Назад][back]

**Словарь** (dictionary) хранит коллекцию элементов, где каждый элемент имеет уникальный ключ и
ассоциированное с ним некоторое значение.

```python
objects = {}
objects = dict()   # функция-конструктор
```

```python
users = {1: "Tom", 2: "Bob", 3: "Bill"}
emails = {"tom@gmail.com": "Tom", "bob@gmai.com": "Bob", "sam@gmail.com": "Sam"}
objects = {1: "Tom", "2": True, 3: 100.6}
```

### Преобразование списков и кортежей в словарь

```python
users_list = [
    ["+111123455", "Tom"],
    ["+384767557", "Bob"],
    ["+958758767", "Alice"]
]

users_dict = dict(users_list)
print(users_dict)      # {"+111123455": "Tom", "+384767557": "Bob", "+958758767": "Alice"}
```

```python
users_tuple = (
    ("+111123455", "Tom"),
    ("+384767557", "Bob"),
    ("+958758767", "Alice")
)

users_dict = dict(users_tuple)
print(users_dict)      # {"+111123455": "Tom", "+384767557": "Bob", "+958758767": "Alice"}
```

### Получение и изменение элементов

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

# получаем элемент с ключом "+11111111"
print(users["+11111111"])   # Tom

# установка значения элемента с ключом "+33333333"
users["+33333333"] = "Bob Smith"
print(users["+33333333"])   # Bob Smith
```

### Проверка наличия значения с ключом

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

key = "+4444444"

if key in users:
    user = users[key]
    print(user)
else:
    print("Элемент не найден")
```

| Метод             | Описание                                                                                                                  |
|-------------------|---------------------------------------------------------------------------------------------------------------------------|
| get(key)          | возвращает из словаря элемент с ключом key. Если элемента с таким ключом нет, то возвращает значение None                 |
| get(key, default) | возвращает из словаря элемент с ключом key. Если элемента с таким ключом нет, то возвращает значение по умолчанию default |

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

user1 = users.get("+55555555")
print(user1)    # Alice

user2 = users.get("+33333333", "Unknown user")
print(user2)    # Bob

user3 = users.get("+44444444", "Unknown user")
print(user3)    # Unknown user
```

### Удаление

Для удаления элемента по ключу применяется оператор `del`:

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

key = "+55555555"

if key in users:
    del users[key]
    print(f"Элемент с ключом {key} удален")
else:
    print("Элемент не найден")
```

Другой способ удаления представляет метод `pop()`:

| Метод             | Описание                                                                                                                                   |
|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| pop(key)          | удаляет элемент по ключу key и возвращает удаленный элемент. Если элемент с данным ключом отсутствует, то генерируется исключение KeyError |
| pop(key, default) | удаляет элемент по ключу key и возвращает удаленный элемент. Если элемент с данным ключом отсутствует, то возвращается значение default    |

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

key = "+55555555"
user = users.pop(key)
print(user)     # Alice

user = users.pop("+4444444", "Unknown user")
print(user)     # Unknown user
```

Если необходимо удалить все элементы, то в этом случае можно воспользоваться методом `clear()`:

```python
users.clear()
```

### Копирование словарей copy()

```python
users = {"+1111111": "Tom", "+3333333": "Bob", "+5555555": "Alice"}
students = users.copy()
print(students)     # {"+1111111": "Tom", "+3333333": "Bob", "+5555555": "Alice"}
```

### Объединение словарей update()

```python
users1 = {"+1111111": "Tom", "+3333333": "Bob"}
users2 = {"+2222222": "Sam", "+6666666": "Kate"}

users1.update(users2)
print(users1)   # {"+1111111": "Tom", "+3333333": "Bob", "+2222222": "Sam", "+6666666": "Kate"}
print(users2)   # {"+2222222": "Sam", "+6666666": "Kate"}
```

### Перебор словаря

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

for key in users:
    print(f"Phone: {key}  User: {users[key]} ")
```

Другой способ перебора элементов представляет использование метода `items()`:

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

for key, value in users.items():
    print(f"Phone: {key}  User: {value} ")
```

Для перебора ключей мы можем вызвать у словаря метод `keys()`:

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

for key in users.keys():
    print(key)
```

Для перебора только значений мы можем вызвать у словаря метод `values()`:

```python
users = {
    "+11111111": "Tom",
    "+33333333": "Bob",
    "+55555555": "Alice"
}

for value in users.values():
    print(value)
```

### Комплексные словари

```python
users = {
    "Tom": {
        "phone": "+971478745",
        "email": "tom12@gmail.com"
    },
    "Bob": {
        "phone": "+876390444",
        "email": "bob@gmail.com",
        "skype": "bob123"
    }
}

old_email = users["Tom"]["email"]
tom_skype = users["Tom"]["skype"]   # KeyError
users["Tom"]["email"] = "supertom@gmail.com"
print(users["Tom"])                 # { phone": "+971478745", "email": "supertom@gmail.com }

# проверяем наличие ключа в словаре
key = "skype"
if key in users["Tom"]:
    print(users["Tom"][key])
else:
    print(key, "is not found")
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"