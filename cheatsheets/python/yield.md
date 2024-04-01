# yield

← [Назад][back]

Инструкция возврата результата из функции-генератора с сохранением состояния ее локальных переменных.
При повторном вызове такой функции выполнение, в отличие от инструкции `return`, продолжается с ключевого слова `yield`,
на котором ее работа была прервана ранее.

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

← [Назад][back]

[back]: <.> "Назад к оглавлению"