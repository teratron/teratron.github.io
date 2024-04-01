# Decorator

← [Назад][back]

**Декоратор** это как обертка на конфете - есть некоторый код, который может выполниться до и/или после работы функции.

```python
def my_decorator(func):
    def wrapper():
        print('код, который выполняется до функции')
        func()
        print('код, который выполняется после работы функции')

    return wrapper

@my_decorator
def some_function():
    print('работает функция, которую мы задекорировали')

some_function()

# код, который выполняется до функции
# работает функция, которую мы задекорировали
# код, который выполняется после работы функции
```

#### Простой декоратор

```python
def simple_decorator(func):
    def inner():
        print('Начало работы декоратора...')
        func()
        print('Декоратор отработал!')
    return inner

def print_hi():
    print('Привет, я - функция, которую задекорировали!')

print_hi = simple_decorator(print_hi)
print_hi()

# Начало работы декоратора...
# Привет, я - функция, которую задекорировали!
# Декоратор отработал!
```

### Декорирование функции с аргументами

```python
def decorate_func_with_params(func):
    def inner(*args, **kwargs):
        print(f'Декорируем функцию с параметрами: {args}, {kwargs}')
        func(*args, **kwargs)
        print('Все прошло успешно!')
    return inner

@decorate_func_with_params
def adder(*nums):
    print(sum(nums))

adder(1)
adder(2, 7, 3)
adder(0, 33, 4, 10, 0)

# Декорируем функцию с параметрами: (1,), {}
# 1
# Все прошло успешно!
# Декорируем функцию с параметрами: (2, 7, 3), {}
# 12
# Все прошло успешно!
# Декорируем функцию с параметрами: (0, 33, 4, 10, 0), {}
# 47
# Все прошло успешно!
```

### Декораторы с параметрами

```python
def repeater(num_of_repeats=1):
    def outer_decorator(func):
        def inner_decorator(*args, **kwargs):
            if num_of_repeats > 0:
                for _ in range(num_of_repeats):
                    print(func(*args, **kwargs))
            else:
                print(func(*args, **kwargs))
        return inner_decorator
    return outer_decorator

@repeater(3)
def print_text(message):
    return f'Вам сообщение: {message}'

print_text('Просыпайся!')

# Вам сообщение: Просыпайся!
# Вам сообщение: Просыпайся!
# Вам сообщение: Просыпайся!
```

### Класс как декоратор

При помощи метода `__call__()` экземпляры классов можно делать вызываемыми, что позволяет декорировать функции.
`info_func()` является экземпляром класса `Numerator`, поэтому счетчик при каждом новом вызове будет увеличиваться.

```python
class Numerator:
    def __init__(self, func):
        self.func = func
        self.counts = 0

    def __call__(self, *args, **kwargs):
        self.counts += 1
        print(self.counts)
        return self.func(*args, **kwargs)

@Numerator
def info_func(*args, **kwargs):
    return args, kwargs

print(info_func(2, 3, p=100))
print(info_func(q=10))
print(info_func())

# 1
# ((2, 3), {'p': 100})
# 2
# ((), {'q': 10})
# 3
# ((), {})
```

```python
class decorator(object):
    def __init__(self, f):
        print("inside decorator.__init__()")
        f() # Prove that function definition has completed

    def __call__(self):
        print("inside decorator.__call__()")

@decorator
def function():
    print("inside function()")

print("Finished decorating function()")

function()

# inside decorator.__init__()
# inside function()
# Finished decorating function()
# inside decorator.__call__()
```

```python

```

```python

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"