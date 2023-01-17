# Metaclass

[Назад][back]

```python
class MyMeta(type):
    def __new__(cls, name, bases, namespace):
        # cls - MyMeta
        # name - имя определяемого класса (MyClass в этом примере)
        # bases - базовые классы для построенного класса
        # namespace - словарь определенных в класса методов и полей
        # в нашем случае - {'x': 3}         

        # super().__new__ просто возвращает новый класс
        return super().__new__(cls, name, bases, namespace)

class MyClass(metaclass=MyMeta):
    x = 3
```

### __init_subclass__

```python
class Philosopher:
    def __init_subclass__(cls, /, default_name, **kwargs):
        super().__init_subclass__(**kwargs)
        cls.default_name = default_name

class AustralianPhilosopher(Philosopher, default_name="Bruce"):
    pass
```

```python
class Strategy(abc.ABC):
    _registry: Dict[str, 'Strategy'] = {}
 
    def __init_subclass__(cls, **kwargs):
        """
        Это неявный метод класса.
        Он будет вызываться только для классов ниже по иерархии, а не для Strategy.
        """
        super().__init_subclass__(**kwargs)
        Strategy._registry[cls.name] = cls
 
    @property
    @abc.abstractmethod
    def name(self):
        pass
 
    @abc.abstractmethod
    def validate_credentials(self, login: str, password: str) -> bool:
        pass
 
    @classmethod
    def for_name(cls, name: str) -> 'Strategy':
        return StrategyMeta.registry[name]()
 
 
class AlwaysOk(Strategy):
    name = 'always_ok'
 
    def validate_credentials(self, login: str, password: str) -> bool:
        return True
 
# Использование
Strategy.for_name('always_ok').validate_credentials('john', 'x')
```

```python

```

```python

```

```python

```

```python

```

```python

```

[Назад][back]

[back]: <.> "Назад к оглавлению"