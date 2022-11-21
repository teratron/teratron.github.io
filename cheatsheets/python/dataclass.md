# @dataclass

[Назад][back]

**Дата классы** это особые классы, которые зачастую используются для хранения данных.
Интересной особенностью дата классов является то, что они лишены избыточного синтаксиса, присущего обычным классам, а
некоторые методы в них по умолчанию определены.

#### Обычный класс:

```python
class Number:
    def __init__(self, value):
        self.value = value

    def __repr__(self):
        return str(self.value)

    def __eq__(self, other):
        return self.value == other.value

a, b = Number(5), Number(10)
print(a)

if a == b:
    print(f'Значения полей value у объектов равны')
else:
    print(f'Значение полей value у объектов отличаются')

# 5
# Значение полей value у объектов отличаются
```

#### Дата класс:

```python
from dataclasses import dataclass

@dataclass
class Number:
    value: int

a, b = Number(5), Number(10)
print(a)

if a == b:
    print(f'Значения полей value у объектов равны')
else:
    print(f'Значение полей value у объектов отличаются')

# Number(value=5)
# Значение полей value у объектов отличаются
```

[Назад][back]

[back]: <.> "Назад к оглавлению"