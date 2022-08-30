# try...except...finally

[Назад][back]

```python
try:
    number = int(input("Введите число: "))
    print("Введенное число:", number)
except:
    print("Преобразование прошло неудачно")
finally:
    print("Блок try завершил выполнение")

print("Завершение программы")
```

### else

```python
try:
    print(a/b)
except ZeroDivisionError:
    print("Ошибка: произошло деление на 0")
else:
    print("Ошибок не найдено")
```

### Встроенные типы исключений

Базовые типы исключений:

| Исключения      | Описание                                                                                                                                     |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| BaseException   | базовый тип для всех встроенных исключений                                                                                                   |
| Exception       | базовый тип, который обычно применяется для создания своих типов исключений                                                                  |
| ArithmeticError | базовый тип для исключений, связанных с арифметическими операциями (OverflowError, ZeroDivisionError, FloatingPointError)                    |
| BufferError     | тип исключения, которое возникает при невозможности выполнить операцию с буфером                                                             |
| LookupError     | базовый тип для исключений, которое возникают при обращении в коллекциях по некорректному ключу или индексу (например: IndexError, KeyError) |

От выше указанных классов наследуются все конкретные типы исключений:

| Исключения          | Описание                                                                                                                               |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| IndexError          | исключение возникает, если индекс при обращении к элементу коллекции находится вне допустимого диапазона                               |
| KeyError            | возникает, если в словаре отсутствует ключ, по которому происходит обращение к элементу словаря                                        |
| OverflowError       | возникает, если результат арифметической операции не может быть представлен текущим числовым типом (обычно типом float)                |
| RecursionError      | возникает, если превышена допустимая глубина рекурсии                                                                                  |
| TypeError           | возникает, если операция или функция применяется к значению недопустимого типа                                                         |
| ValueError          | возникает, если операция или функция получают объект корректного типа с некорректным значением                                         |
| ZeroDivisionError   | возникает при делении на ноль.                                                                                                         |
| NotImplementedError | тип исключения для указания, что какие-то методы класса не реализованы                                                                 |
| ModuleNotFoundError | возникает при при невозможности найти модуль при его импорте директивой import                                                         |
| OSError:            | тип исключений, которые генерируются при возникновении ошибок системы (например, невозможно найти файл, память диска заполнена и т.д.) |

Все исключения [ниже](#exception-id).

```python
try:
    number1 = int(input("Введите первое число: "))
    number2 = int(input("Введите второе число: "))
    print("Результат деления:", number1/number2)
except ValueError:
    print("Преобразование прошло неудачно")
except ZeroDivisionError:
    print("Попытка деления числа на ноль")
except BaseException:
    print("Общее исключение")
```

```python
try:
    number1 = int(input("Введите первое число: "))
    number2 = int(input("Введите второе число: "))
    print("Результат деления:", number1/number2)
except (ZeroDivisionError, ValueError):    #  обработка двух типов исключений - ZeroDivisionError и ValueError
    print("Попытка деления числа на ноль или некорректный ввод")
```

### Получение информации об исключении

С помощью оператора `as` мы можем передать всю информацию об исключении в переменную:

```python
try:
    number = int(input("Введите число: "))  # Введите число: 'fdsf'
    print("Введенное число:", number)
except ValueError as e:
    print("Сведения об исключении", e)      # invalid literal for int() with base 10: 'fdsf'
```

### Генерация исключений и оператор raise {#raise-id}

Оператору `raise` передается объект `BaseException` - в данном случае объект `Exception`.
В конструктор этого типа можно ему передать сообщение, которое затем можно вывести пользователю.
В итоге, если number2 будет равно 0, то сработает оператор `raise`, который сгенерирует исключение.
В итоге управление программой перейдет к блоку `except`, который обрабатывает исключения типа `Exception`:

```python
try:
    number1 = int(input("Введите первое число: "))
    number2 = int(input("Введите второе число: "))
    if number2 == 0:
        raise Exception("Второе число не должно быть равно 0")
    print("Результат деления двух чисел:", number1/number2)
except ValueError:
    print("Введены некорректные данные")
except Exception as e:
    print(e)
```

### Создание своих типов исключений

```python
class PersonAgeException(Exception):
    def __init__(self, age, minage, maxage):
        self.age = age
        self.minage = minage
        self.maxage = maxage

    def __str__(self):
        return f"Недопустимое значение: {self.age}. " \
               f"Возраст должен быть в диапазоне от {self.minage} до {self.maxage}"

class Person:
    def __init__(self, name, age):
        self.__name = name          # устанавливаем имя
        minage, maxage = 1, 110
        if minage < age < maxage:   # устанавливаем возраст, если передано корректное значение
            self.__age = age
        else:                       # иначе генерируем исключение
            raise PersonAgeException(age, minage, maxage)

    def display_info(self):
        print(f"Имя: {self.__name}  Возраст: {self.__age}")

try:
    tom = Person("Tom", 37)
    tom.display_info()  # Имя: Tom  Возраст: 37

    bob = Person("Bob", -23)
    bob.display_info()
except PersonAgeException as e:
    print(e)            # Недопустимое значение: -23. Возраст должен быть в диапазоне от 1 до 110
```

### Иерархия исключений {#exception-id}

```
BaseException
    +-- SystemExit
    +-- KeyboardInterrupt
    +-- GeneratorExit
    +-- Exception
        +-- StopIteration
        +-- StopAsyncIteration
        +-- ArithmeticError
        |    +-- FloatingPointError
        |    +-- OverflowError
        |    +-- ZeroDivisionError
        +-- AssertionError
        +-- AttributeError
        +-- BufferError
        +-- EOFError
        +-- ImportError
        |    +-- ModuleNotFoundError
        +-- LookupError
        |    +-- IndexError
        |    +-- KeyError
        +-- MemoryError
        +-- NameError
        |    +-- UnboundLocalError
        +-- OSError
        |    +-- BlockingIOError
        |    +-- ChildProcessError
        |    +-- ConnectionError
        |    |    +-- BrokenPipeError
        |    |    +-- ConnectionAbortedError
        |    |    +-- ConnectionRefusedError
        |    |    +-- ConnectionResetError
        |    +-- FileExistsError
        |    +-- FileNotFoundError
        |    +-- InterruptedError
        |    +-- IsADirectoryError
        |    +-- NotADirectoryError
        |    +-- PermissionError
        |    +-- ProcessLookupError
        |    +-- TimeoutError
        +-- ReferenceError
        +-- RuntimeError
        |    +-- NotImplementedError
        |    +-- RecursionError
        +-- SyntaxError
        |    +-- IndentationError
        |         +-- TabError
        +-- SystemError
        +-- TypeError
        +-- ValueError
        |    +-- UnicodeError
        |         +-- UnicodeDecodeError
        |         +-- UnicodeEncodeError
        |         +-- UnicodeTranslateError
        +-- Warning
            +-- DeprecationWarning
            +-- PendingDeprecationWarning
            +-- RuntimeWarning
            +-- SyntaxWarning
            +-- UserWarning
            +-- FutureWarning
            +-- ImportWarning
            +-- UnicodeWarning
            +-- BytesWarning
            +-- EncodingWarning
            +-- ResourceWarning
```

[Назад][back]

[back]: <.> "Назад к оглавлению"