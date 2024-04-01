# Bitwise

← [Назад][back]

### Побитовые операторы(bitwise)

Пример перегрузки побитового оператора для нашего настраиваемого объекта:

```python
class Data:
    id = 0

    def __init__(self, i):
        self.id = i

    def __and__(self, other):
        print('Bitwise AND operator overloaded')
        if isinstance(other, Data):
            return Data(self.id & other.id)
        else:
            raise ValueError('Argument must be object of Data')

    def __or__(self, other):
        print('Bitwise OR operator overloaded')
        if isinstance(other, Data):
            return Data(self.id | other.id)
        else:
            raise ValueError('Argument must be object of Data')

    def __xor__(self, other):
        print('Bitwise XOR operator overloaded')
        if isinstance(other, Data):
            return Data(self.id ^ other.id)
        else:
            raise ValueError('Argument must be object of Data')

    def __lshift__(self, other):
        print('Bitwise Left Shift operator overloaded')
        if isinstance(other, int):
            return Data(self.id << other)
        else:
            raise ValueError('Argument must be integer')

    def __rshift__(self, other):
        print('Bitwise Right Shift operator overloaded')
        if isinstance(other, int):
            return Data(self.id >> other)
        else:
            raise ValueError('Argument must be integer')

    def __invert__(self):
        print('Bitwise Ones Complement operator overloaded')
        return Data(~self.id)

    def __str__(self):
        return f'Data[{self.id}]'

d1 = Data(10)
d2 = Data(7)

print(f'd1d2 = {d1d2}')
print(f'd1|d2 = {d1|d2}')
print(f'd1^d2 = {d1^d2}')
print(f'd1<<2 = {d1<<2}')
print(f'd1>>2 = {d1>>2}')
print(f'~d1 = {~d1}')

# Bitwise AND operator overloaded
# d1d2 = Data[2]
# Bitwise OR operator overloaded
# d1|d2 = Data[15]
# Bitwise XOR operator overloaded
# d1^d2 = Data[13]
# Bitwise Left Shift operator overloaded
# d1<<2 = Data[40]
# Bitwise Right Shift operator overloaded
# d1>>2 = Data[2]
# Bitwise Ones Complement operator overloaded
# ~d1 = Data[-11]
```

```python

```

```python

```

```python

```

### blank

```python

```

```python

```

```python

```

```python

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"