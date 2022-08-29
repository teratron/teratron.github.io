# lambda

[Назад][back]

```python
message = lambda: print("hello")

message()   # hello
```

Аналог:

```python
def message(): print("hello")

message()   # hello
```

```python
sum = lambda a, b: a + b

print(sum(4, 5))    # 9
print(sum(5, 6))    # 11
```

Передача лямбда-выражения в качестве параметра:

```python
def do_operation(a, b, operation):
    result = operation(a, b)
    print(f"result = {result}")

do_operation(5, 4, lambda a, b: a + b)  # result = 9
do_operation(5, 4, lambda a, b: a * b)  # result = 20
```

Возвращение лямбда-выражений из функций:

```python
def select_operation(choice):
    if choice == 1:
        return lambda a, b: a + b
    elif choice == 2:
        return lambda a, b: a - b
    else:
        return lambda a, b: a * b

operation = select_operation(1)  # operation = sum
print(operation(10, 6))  # 16

operation = select_operation(2)  # operation = subtract
print(operation(10, 6))  # 4

operation = select_operation(3)  # operation = multiply
print(operation(10, 6))  # 60
```

### Замыкания

```python
def multiply(n): return lambda m: n * m

fn = multiply(5)
print(fn(5))        # 25
print(fn(6))        # 30
print(fn(7))        # 35
```

[Назад][back]

[back]: <.> "Назад к оглавлению"