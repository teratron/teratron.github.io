# Округление

[Назад][back]

При операциях с числами типа float надо учитывать, что результат операций с ними может быть не совсем точным:

```python
first_number = 2.0001
second_number = 5
third_number = first_number / second_number
print(third_number) # 0.40002000000000004
```

### round()

```python
first_number = 2.0001
second_number = 0.1
third_number = first_number + second_number
print(round(third_number))  # 2
```

Функция `round()` также может принимать второе число, которое указывает, сколько знаков после запятой должно содержать
получаемое число:

```python
first_number = 2.0001
second_number = 0.1
third_number = first_number + second_number
print(round(third_number, 4))  # 2.1001
```

#### Округление до целого числа

```python
print(round(2.49))  # 2 - округление до ближайшего целого 2
print(round(2.51))  # 3 - округление до ближайшего целого 3
print(round(2.5))   # 2 - ближайшее четное
print(round(3.5))   # 4 - ближайшее четное
```

#### Округление до двух знаков после запятой

```python
print(round(2.554, 2))      # 2.55
print(round(2.5551, 2))     # 2.56
print(round(2.554999, 2))   # 2.55
print(round(2.499, 2))      # 2.5
```

Если округляемая часть одинаково удалена от двух значений, то округление производится до ближайшего четного значения:

```python
print(round(2.545, 2))   # 2.54
print(round(2.555, 2))   # 2.56 - округление до четного
print(round(2.565, 2))   # 2.56
print(round(2.575, 2))   # 2.58

print(round(2.655, 2))   # 2.65 - округление не до четного
print(round(2.665, 2))   # 2.67
print(round(2.675, 2))   # 2.67
```

[Назад][back]

[back]: <.> "Назад к оглавлению"