# Exception

[Назад][back]

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

### Иерархия встроенных (built-in) исключений

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

[Назад][back]

[back]: <.> "Назад к оглавлению"