# Exception

[Назад][back]

### Иерархия встроенных (built-in) исключений {#exception-id}

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
           +-- ResourceWarning
```

| Исключение            | Причина                                                                                                                         |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------|
| AssertionError        | Возникает, когда оператор `assert` не срабатывает.                                                                              |
| AttributeError        | Возникает при ошибке присваивания атрибута или ссылки.                                                                          |
| EOFError              | Возникает, когда функция `input()` достигает состояния конца файла.                                                             |
| FloatingPointError    | Возникает при сбое операции с данными типа с плавающей точкой.                                                                  |
| ImportError           | Возникает, если импортируемый модуль не найден.                                                                                 |
| IndexError            | Возникает, когда указанный индекс в последовательности выходит за пределы допустимого диапазона.                                |
| KeyError              | Возникает, когда ключ не найден в словаре.                                                                                      |
| KeyboardInterrupt     | Возникает, когда пользователь нажимает клавишу прерывания (Ctrl+C или Delete).                                                  |
| MemoryError           | Возникает, когда заканчивается память для выполнения операции.                                                                  |
| NameError             | Возникает, когда переменная не найдена в локальной или глобальной области видимости.                                            |
| NotImplementedError   | Возникает при использовании абстрактных методов.                                                                                |
| OSError               | Возникает, когда работа системы вызывает ошибку, связанную с системой.                                                          |
| OverflowError         | Возникает, когда результат арифметической операции слишком велик для представления.                                             |
| RuntimeError          | Возникает, когда ошибка не подпадает ни под одну другую категорию.                                                              |
| StopIteration         | Вызывается функцией `next()`, чтобы указать, что нет следующего элемента, который должен быть возвращен итератором.             |
| SyntaxError           | Вызывается синтаксическим парсером при обнаружении синтаксической ошибки.                                                       |
| IndentationError      | Возникает при неправильном отступе.                                                                                             |
| TabError              | Возникает, когда отступ состоит из непоследовательных табуляций и пробелов.                                                     |
| SystemError           | Возникает, когда интерпретатор обнаруживает внутреннюю ошибку.                                                                  |
| SystemExit            | Вызывается функцией `sys.exit()`.                                                                                               |
| TypeError             | Возникает, когда функция или операция применяется к объекту неправильного типа.                                                 |
| UnboundLocalError     | Возникает, когда в функции или методе делается ссылка на локальную переменную, но значение не было привязано к этой переменной. |
| UnicodeError          | Возникает при возникновении ошибки кодирования или декодирования, связанной с Unicode.                                          |
| UnicodeEncodeError    | Возникает, когда во время кодирования происходит ошибка, связанная с Unicode.                                                   |
| UnicodeDecodeError    | Возникает, когда во время декодирования происходит ошибка, связанная с Unicode.                                                 |
| UnicodeTranslateError | Возникает при ошибке, связанной с Unicode, во время перевода.                                                                   |
| ValueError            | Возникает, когда функция получает аргумент правильного типа, но некорректное значение (для этого типа).                         |
| ZeroDivisionError     | Возникает, когда второй операнд операции деления или модуляции равен нулю.                                                      |

### Базовый синтаксис исключений

```python
try:
   # Действия, которые необходимо выполнить
   pass
except  (Exception1[, Exception2[,...ExceptionN]]]) as exc_obj:
   # Обработка указанных исключений
   # exc_obj содержит экземпляр исключения
   pass
else:
   # Блок вызывается в случае если в процессе выполнения не возбуждалось исключений. 
   pass
finally:
   # Блок выполняется всегда.
   pass
```

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

### Несколько обработчиков исключений

```python
try:
   # Действия, которые необходимо выполнить
   pass
except ValueError:
   # обработка исключения ValueError
   pass
except (TypeError, ZeroDivisionError):
   # Обработка нескольких исключений:
   # TypeError and ZeroDivisionError
   pass
except:
   # Обработка всех остальных типов исключений
   pass
```

### Примеры использования встроенных исключений

```python
# Использование блока try-except, исключение возбуждается.

try:
    a = 1/0
except ZeroDivisionError:
    print("Было обработано исключение")
else:
    print("Исключений в процессе выполнения возбуждено не было")
finally:
    print("Должно выполниться в любом случае")
```

```python
# Использование блока try-except, исключений возбуждено не было.

try:
    a = 1/5
except ZeroDivisionError:
    print("Было обработано исключение")
else:
    print("Исключений в процессе выполнения возбуждено не было")
finally:
    print("Должно выполниться в любом случае")
```

### Создание собственных исключений

Исключение в Python — класс, унаследованный от `BaseException`.

Для создания собственного исключения достаточно унаследовать его от любого built-in исключения в том месте иерархии,
которая необходима.

```python
#Создание класса исключения.
class NetworkError(RuntimeError):
    pass

try:
    # Для возбуждения исключения необходимого типа используется инструкция raise.
    raise NetworkError("Exception text") 
except RuntimeError as e:
    print("Обработана RuntimeError:", e)
except NetworkError as e:
    print("Обработана NetworkError:", e)

# Обработана RuntimeError: Exception text
```

```python
# Здесь отработает хэндлер NetworkError.
class NetworkError(RuntimeError):
    pass

try:
    raise NetworkError("Exception text")
except NetworkError as e:
    print("Обработана NetworkError:", e)
except RuntimeError as e:
    print("Обработана RuntimeError:", e)

# Обработана NetworkError: Exception text
```

### Каскадная обработка исключений

```python
class NetworkError(RuntimeError):
    pass

try:
    try:
        # Для возбуждения исключения без передачи каких-либо параметров скобки.
        # не обязательны. Экземпляр будет создан в любом случае.
        raise NetworkError 
    except NetworkError as e:
        print('Первый обработчик, id исключения:', id(e))
        raise
except Exception as exc:
    print('Второй обработчик, id исключения:', id(exc))
```

```python
# Вложенные блоки работают одинаково везде
class NetworkError(RuntimeError):
   pass

def func():
    try:
        raise NetworkError
    except NetworkError as e:
        print('Первый обработчик, id исключения:', id(e))
        raise

try:
    func()
except NetworkError as e:
    print('Второй обработчик, id исключения:', id(e))
```

### Определение пользовательских исключений

```python
# Определяем пользовательское исключение
class InvalidAgeException(Exception):
    "Raised when the input value is less than 18"
    pass
 
# Нужно угадать это число
number = 18
 
try:
    input_num = int(input("Enter a number: "))
    if input_num < number:
        raise InvalidAgeException
    else:
        print("Eligible to Vote")
        
except InvalidAgeException:
    print("Exception occurred: Invalid Age")

# Результат:

# Enter a number: 45
# Eligible to Vote

# Enter a number: 14
# Exception occurred: Invalid Age
```

```python
# определение пользовательских исключений
class Error(Exception):
    """Базовый класс для других исключений"""
    pass

class ValueTooSmallError(Error):
    """Вызывается, когда входное значение мало"""
    pass

class ValueTooLargeError(Error):
    """Вызывается, когда входное значение велико"""
    pass

# число, которое нужно угадать
number = 10

# игра продолжается до тех пор, 
# пока пользователь его не угадает
while True:
    try:
        i_num = int(input("Ввести число: "))
        if i_num < number:
            raise ValueTooSmallError
        elif i_num > number:
            raise ValueTooLargeError
        break
    except ValueTooSmallError:
        print("Это число меньше загаданного, попробуйте еще раз!\n")
    except ValueTooLargeError:
        print("Это число больше загаданного, попробуйте еще раз!\n")

print("Поздравляю! Вы правильно угадали.")

# Результат:

# Ввести число: 12
# Это число больше загаданного, попробуйте еще раз!

# Ввести число: 0
# Это число меньше загаданного, попробуйте еще раз!

# Ввести число: 8
# Это число меньше загаданного, попробуйте еще раз!

# Ввести число: 10
# Поздравляю! Вы правильно угадали.
```

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

### Кастомизация классов исключений

```python
class SalaryNotInRangeError(Exception):
    """Исключение, вызванное ошибками во входном значении salary
 
    Атрибуты:
        salary -- значение salary, которое вызвало ошибку
        message -- объяснение ошибки
    """
 
    def __init__(self, salary, message="Salary is not in (5000, 15000) range"):
        self.salary = salary
        self.message = message
        super().__init__(self.message)

    # переопределяем метод '__str__'
    def __str__(self):
        return f'{self.salary} -> {self.message}'

salary = int(input("Enter salary amount: "))
if not 5000 < salary < 15000:
    raise SalaryNotInRangeError(salary)

# Результат:
# Enter salary amount: 2000
# Traceback (most recent call last):
# File "<string>", line 17, in <module>
# raise SalaryNotInRangeError(salary)
# __main__.SalaryNotInRangeError: Salary is not in (5000, 15000) range
```

```python
class Error(Exception):
    """Базовый класс для исключений в этом модуле."""
    pass

class InputError(Error):
    """Исключение для ошибок во входных данных.
    Attributes:
        expression -- выражение, в котором произошла ошибка
        message -- объяснение ошибки
    """
    def __init__(self, expression, message):
        self.expression = expression
        self.message = message


x = input("Ведите положительное целое число: ")
try:
    x = int(x)
    if x < 0:
        raise InputError(f'!!! x = input({x})', 
                         '-> Допустимы только положительные числа.')
except ValueError:
    print("Error type of value!")
except InputError as e:
    print(e.args[0])
    print(e.args[1])
else:
    print(x)

# Результат:

# Ведите положительное целое число: 3
# 3

# Ведите положительное целое число: 7.9
# Error type of value!

# Ведите положительное целое число: -5
# !!! x = input(-5)
# -> Допустимы только положительные числа.
```

### Перехват пользовательского исключения

```python
import sqlite3 

class MyError(Exception):
     """Could not connect to db"""
     pass

try:         
    conn = sqlite3.connect('database.sqlite')
except sqlite3.Error as e:
    raise MyError(f'Could not connect to db: {e.value}')
```

[Назад][back]

[back]: <.> "Назад к оглавлению"
