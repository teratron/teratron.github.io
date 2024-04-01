# import

← [Назад][back]

### Определение и подключение модулей

```python
# message.py
#-----------

hello = "Hello all"

def print_message(text):
    print(f"Message: {text}")
```

```python
# main.py
#-----------

import message                       # подключаем модуль message

# выводим значение переменной hello
print(message.hello)                 # Hello all

# обращаемся к функии print_message
message.print_message("Hello work")  # Message: Hello work
```

### Подключение функциональности модуля в глобальное пространство имен

```python
from message import print_message

# обращаемся к функии print_message из модуля message
print_message("Hello work")  # Message: Hello work

# переменная hello из модуля message не доступна, так как она не импортирована
# print(message.hello)   
# print(hello) 
```

```python
from message import print_message
from message import hello

# обращаемся к функции print_message из модуля message
print_message("Hello work")  # Message: Hello work

# обращаемся к переменной hello из модуля message
print(hello)                 # Hello all
```

Если необходимо импортировать в глобальное пространство имен весь функционал, то вместо названий отдельных функций и
переменных можно использовать символ `*`:

```python
from message import *

# обращаемся к функции print_message из модуля message
print_message("Hello work")  # Message: Hello work

# обращаемся к переменной hello из модуля message
print(hello)                 # Hello all
```

### Установка псевдонимов

```python
import message as mes            # модуль message проецируется на псевдоним mes

# выводим значение переменной hello
print(mes.hello)                 # Hello all

# обращаемся к функии print_message
mes.print_message("Hello work")  # Message: Hello work
```

```python
from message import print_message as display
from message import hello as welcome

def print_message(some_text):
    print(f"Text: {some_text}")

print(welcome)               # Hello all - переменная hello из модуля message
display("Hello work")        # Message: Hello work - функция print_message из модуля message

# функция print_message из текущего файла
print_message("Hello work")  # Text: Hello work
```

### Имя модуля

```python
# message.py
#-----------

hello = "Hello all"

def print_message(text):
    print(f"Message: {text}")

def main():
    print_message(hello)

if __name__ == "__main__": 
    main()
```

```python
# main.py
#-----------

import message

def main(): 
    message.print_message("Hello work")  # Message: Hello work

if __name__ == "__main__":
    main()
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"