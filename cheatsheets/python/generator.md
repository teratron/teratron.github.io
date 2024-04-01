# Generator

← [Назад][back]

```python
num = [1, 4, -5, 10, -7, 2, 3, -1]
filtered_and_squared = []

for number in num:
    if number > 0:
        filtered_and_squared.append(number ** 2)
print filtered_and_squared

# [1, 16, 100, 4, 9]
```

или

```python
num = [1, 4, -5, 10, -7, 2, 3, -1]

filtered_and_squared = map(lambda x: x ** 2, filter(lambda x: x > 0, num))
print filtered_and_squared

# [1, 16, 100, 4, 9]
```

или

```python
num = [1, 4, -5, 10, -7, 2, 3, -1]

filtered_and_squared = [x**2 for x in num if x > 0]
print filtered_and_squared

# [1, 16, 100, 4, 9]
```

### Выражения-генераторы

```python
num = [1, 4, -5, 10, -7, 2, 3, -1]

filtered_and_squared = (x**2 for x in num if x > 0)
print filtered_and_squared

# <generator object <genexpr> at 0x00583E18>

for item in filtered_and_squared:
    print item

# 1, 16, 100, 4,9
```

```python
num = [1, 4, -5, 10, -7, 2, 3, -1]

def square_generator(optional_parameter):
    return (x ** 2 for x in num if x > optional_parameter)

print square_generator(0)

# <generator object <genexpr> at 0x004E6418>

# Option I
for k in square_generator(0):
    print k

# 1, 16, 100, 4, 9

# Option II
g = list(square_generator(0))
print g

# [1, 16, 100, 4, 9]
```

Так же, вы можете использовать функцию `zip` для работы с двумя и более элементами за раз:

```python
alist = ['a1', 'a2', 'a3']
blist = ['1', '2', '3']

for a, b in zip(alist, blist):
    print a, b

# a1 1
# a2 2
# a3 3
```

Пример двухуровневого генератора с использованием `os.walk()`:

```python
import os

def tree(top):
    for path, names, fnames in os.walk(top):
        for fname in fnames:
            yield os.path.join(path, fname)

for name in tree('C:\Users\XXX\Downloads\Test'):
    print name
```

```python

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"