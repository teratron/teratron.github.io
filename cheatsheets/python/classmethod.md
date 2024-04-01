# @classmethod

← [Назад][back]

Декоратор `@classmethod` — это метод, который получает класс в качестве параметра, который принято обозначать как `cls`.
Он указывает на класс ToyClass, а не на объект этого класса.

`@classmethod `— это обычный метод класса, имеющий доступ ко всем атрибутам класса, через который он был вызван.

```python
from datetime import date

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    # classmethod создает объект человека
    # по дате рождения
    @classmethod
    def from_birth_year(cls, name, year):
        return cls(name, date.today().year)

person1 = Person('Artem', 21)
person2 = Person.from_birth_year('Artem', 1996)

print (person1.age) # 21
print (person2.age) # 22
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"