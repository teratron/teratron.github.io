# Closure

[Назад][back]

**Замыкание** (**closure**) - объект, который включает в себя блок кода (например, функцию) и дополнительные переменные
за его пределами.

Зачем нужны замыкания:

- позволяют избегать глобальных переменных,
- прячут данные (чтобы их не меняли по неаккуратности).

```python
def closure_example():
    x = 11
    def inner():
        print(f'Переменная из замыкания: {x}')
    return inner

closure_example()()

# Переменная из замыкания: 11
```

```python

```

[Назад][back]

[back]: <.> "Назад к оглавлению"