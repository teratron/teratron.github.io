# while

← [Назад][back]

```python
number = 1

while number < 5:
    print(f"number = {number}")
    number += 1
else:
    print(f"number = {number}. Работа цикла завершена")

print("Работа программы завершена")
```

Блок `else` может быть полезен, если условие изначально равно `False`, и мы можем выполнить некоторые действия по этому
поводу:

```python
number = 10

while number < 5:
    print(f"number = {number}")
    number += 1
else:
    print(f"number = {number}. Работа цикла завершена")

print("Работа программы завершена")
```

### Вложенные циклы

```python
i = 1
j = 1

while i < 10:
    while j < 10:
        print(i * j, end="\t")
        j += 1
    print("\n")
    j = 1
    i += 1
```

### Break

```python
number = 0

while number < 5:
    number += 1
    if number == 3 :    # если number = 3, выходим из цикла
        break
    print(f"number = {number}")
```

### Continue

```python
number = 0

while number < 5:
    number += 1
    if number == 3 :    # если number = 3, переходим к новой итерации цикла
        continue
    print(f"number = {number}")
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"