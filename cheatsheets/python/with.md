# with

← [Назад][back]

### with … as — менеджеры контекста

```
"with" expression ["as" target] ("," expression ["as" target])* ":"
    suite
```

1. Выполняется выражение в конструкции `with` ... `as`.
2. Загружается специальный метод `__exit__` для дальнейшего использования.
3. Выполняется метод `__enter__`. Если конструкция with включает в себя слово `as`, то возвращаемое методом `__enter__`
   значение записывается в переменную.
4. Выполняется suite.
5. Вызывается метод `__exit__`, причём неважно, выполнилось ли suite или произошло исключение. В этот метод передаются
   параметры исключения, если оно произошло, или во всех аргументах значение `None`, если исключения не было.

```python
with A() as a, B() as b:
    suite
```

```python
with A() as a:
    with B() as b:
        suite
```

### Для чего применяется конструкция with ... as?

**Для гарантии того, что критические функции выполнятся в любом случае.**\
Самый распространённый пример использования этой конструкции - открытие файлов.
Конструкция with ... as, как правило, является более удобной и гарантирует закрытие файла в любом случае.

```python
with open('newfile.txt', 'w', encoding='utf-8') as g:
    d = int(input())
    print('1 / {} = {}'.format(d, 1 / d), file=g)
```

### ContextLib (менеджеры контекста)

```python
import time

class demo:
    def __init__(self, label):
        self.label = label

    def __enter__(self):
        self.start = time.time()

    def __exit__(self, exc_ty, exc_val, exc_tb):
        end = time.time()
        print('{}: {}'.format(self.label, end - self.start))

with demo('counting'):
    n = 10000000
    while n > 0:
        n -= 1

# counting: 1.36000013351
```

В функции `demo(label)` весь код до оператора `yield` исполняется как метод менеджера контекста `__enter__()`.
Весь код после оператора `yield` выполняется как метод `__exit__()`.
Если в блоке внутри `with` возникнет исключение, оно “объявится” на месте оператора `yield`.

```python
from contextlib import contextmanager
import time

@contextmanager
def demo(label):
    start = time.time()
    try:
        yield
    finally:
        end = time.time()
        print('{}: {}'.format(label, end - start))

with demo('counting'):
    n = 10000000
    while n > 0:
        n -= 1

# counting: 1.32399988174
```

```python

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"