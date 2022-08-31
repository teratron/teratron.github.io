# tuple

[Назад][back]

**Кортеж** (tuple) является неизменяемым (immutable) типом.

```python
tom = ("Tom", 23)
print(tom)     # ("Tom", 23)

bob = "Bob", 25
print(bob)     # ("Bob", 25)

sam = ("Sam",)
```

```python
data = ["Tom", 37, "Google"]  # list

tom = tuple(data)
print(tom)          # ("Tom", 37, "Google")
print(len(tom))     # 3

tom[1] = "Tim"      # работать не будет
```

### Обращение к элементам кортежа

```python
tom = ("Tom", 37, "Google", "software developer")

print(tom[0])       # Tom
print(tom[1])       # 37
print(tom[-1])      # software developer
```

Можем разложить кортеж на отдельные переменные:

```python
name, age, company, position = ("Tom", 37, "Google", "software developer")

print(name)         # Tom
print(age)          # 37
print(position)     # software developer
print(company)      # Google
```

### Получение подкортежей

```python
tom = ("Tom", 37, "Google", "software developer")

# получем подкортеж с 1 по 3 элемента (не включая)
print(tom[1:3])     # (37, "Google")

# получем подкортеж с 0 по 3 элемента (не включая)
print(tom[:3])      # ("Tom", 37, "Google")

# получем подкортеж с 1 по послдений элемент
print(tom[1:])      # (37, "Google", "software developer")
```

### Кортеж как параметр и результат функций

```python
def get_user():
    name = "Tom"
    age = 22
    company = "Google"
    return name, age, company

user = get_user()
print(user)     # ("Tom", 37, "Google")
```

```python
def print_person(name, age, company):
    print(f"Name: {name}  Age: {age}  Company: {company}")

tom = ("Tom", 22)
print_person(*tom, "Microsoft")  # Name: Tom  Age: 22  Company: Microsoft

bob = ("Bob", 41, "Apple")
print_person(*bob)               # Name: Bob  Age: 41  Company: Apple
```

### Перебор кортежей

```python
tom = ("Tom", 22, "Google")

for item in tom:
    print(item)
```

```python
tom = ("Tom", 22, "Google")

i = 0
while i < len(tom):
    print(tom[i])
    i += 1
```

### Проверка наличия значения

```python
user = ("Tom", 22, "Google")
name = "Tom"

if name in user:
    print("Пользователя зовут Tom")
else:
    print("Пользователь имеет другое имя")
```

[Назад][back]

[back]: <.> "Назад к оглавлению"