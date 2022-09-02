# yield

[Назад][back]

```python
def yieldStatement():
    yield 'Statement 1'
    yield 'Statement 2'
    yield 'Statement 3'

statements = yieldStatement()

for s in statements:
    print(s)

# Statement 1
# Statement 2
# Statement 3
```

### Генератор

**Генератор** используется, когда нам нужно прочитать огромное количество значений и это помогает сэкономить память.

```python
def multiplyByFive(*kwargs):
    for i in kwargs:
        yield i * 5

a = multiplyByFive(4, 5, 6, 8)
print(a)   # <generator object multiplyByFive at 0x02CF7090>

for i in a:
    print(i)

# 20
# 25
# 30
# 40
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

[Назад][back]

[back]: <.> "Назад к оглавлению"