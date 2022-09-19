# Types and Variables

[Назад][back]

## Типы данных

Базовые типы: **bool**, **int**, **float**, **complex** и **str**.

### Логические значения bool

```python
isMarried = False
print(isMarried)    # False

isAlive = True
print(isAlive)      # True
```

### Целые числа int

```python
age = 21
print("Возраст:", age)    # Возраст: 21

count = 15
print("Количество:", count) # Количество: 15
```

Для указания, что число представляет **двоичную систему**, перед числом ставится префикс `0b`:

```python
a = 0b11
b = 0b1011
c = 0b100001

print(a)    # 3 в десятичной системе
print(b)    # 11 в десятичной системе
print(c)    # 33 в десятичной системе
```

Для указания, что число представляет **восьмеричную систему**, перед числом ставится префикс `0o`:

```python
a = 0o7
b = 0o11
c = 0o17

print(a)    # 7 в десятичной системе
print(b)    # 9 в десятичной системе
print(c)    # 15 в десятичной системе
```

Для указания, что число представляет **шестнадцатеричную систему**, перед числом ставится префикс `0x`:

```python
a = 0x0A
b = 0xFF
c = 0xA1

print(a)    # 10 в десятичной системе
print(b)    # 255 в десятичной системе
print(c)    # 161 в десятичной системе
```

### Дробные числа float

```python
height = 1.68
pi = 3.14
weight = 68.

print(height)   # 1.68
print(pi)       # 3.14
print(weight)   # 68.0
```

Число с плавающей точкой можно определять в экспоненциальной записи:

```python
x = 3.9e3
print(x)  # 3900.0

x = 3.9e-3
print(x)  # 0.0039
```

Число **float** может иметь только 18 значимых символов.
Так, в данном случае используются только два символа - 3.9.

### Комплексные числа complex

Тип **complex** представляет комплексные числа в формате `вещественная_часть+мнимая_частьj` - после мнимой части
указывается суффикс `j`:

```python
complexNumber = 1+2j
print(complexNumber)   # (1+2j)
```

### Строки str

```python
message = "Hello World!"
print(message)  # Hello World!

name = 'Tom'
print(name)     # Tom

text = ("Laudate omnes gentes laudate "
        "Magnificat in secula ")
print(text)
```

```python
'''
Это комментарий
'''

# многострочный текст
text = '''Laudate omnes gentes laudate
Magnificat in secula
Et anima mea laudate
Magnificat in secula 
'''
print(text)
```

#### Управляющие последовательности в строке:

| Символы | Описание                                           |
|---------|----------------------------------------------------|
| \       | позволяет добавить внутрь строки слеш              |
| \'      | позволяет добавить внутрь строки одинарную кавычку |
| \"      | позволяет добавить внутрь строки двойную кавычку   |
| \n      | осуществляет переход на новую строку               |
| \t      | добавляет табуляцию (4 отступа)                    |

```python
text = "Message:\n\"Hello World\""
print(text)
```

```python
# path = "C:\python\name.txt" - внутри строки встречаются символы "\n" переход на новую строку

path = r"C:\python\name.txt"
print(path)
```

Вставка значений в строку `f`:

```python
userName = "Tom"
userAge = 37
user = f"name: {userName}  age: {userAge}"
print(user)   # name: Tom  age: 37
```

### Динамическая типизация

```python
userId = "abc"  # тип str
print(userId)

userId = 234    # тип int
print(userId)
```

С помощью встроенной функции `type()` динамически можно узнать текущий тип переменной:

```python
userId = "abc"      # тип str
print(type(userId)) # <class 'str'>
 
userId = 234        # тип int
print(type(userId)) # <class 'int'>
```

## Преобразование типов

### int

```python
a = "2"
b = 3
c = int(a) + b
print(c)        # 5
```

```python
a = int(15)     # a = 15
b = int(3.7)    # b = 3
c = int("4")    # c = 4
e = int(False)  # e = 0
f = int(True)   # f = 1
```

```python
b = int("a1c")  # Ошибка
c = int("4.7")  # Ошибка
```

### float

```python
a = "2.7"
b = 3
c = float(a) + b
print(c)        # 5.7
```

```python
a = float(15)       # a = 15.0
b = float(3.7)      # b = 3.7
c = float("4.7")    # c = 4.7
d = float("5")      # d = 5.0
e = float(False)    # e = 0.0
f = float(True)     # f = 1.0
```

```python
d = float("abc")    # Ошибка
```

### str

```python
a = str(False)      # a = "False"
b = str(True)       # b = "True"
c = str(5)          # c = "5"
d = str(5.7)        # d = "5.7"
```

```python
age = 22
message = "Age: " + age       # Ошибка
message = "Age: " + str(age)  # Age: 22
print(message)
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