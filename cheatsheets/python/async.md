# async

← [Назад][back]

```python
import asyncio

async def waiter():
    task1 = asyncio.create_task(cook('Паста', 8))
    task2 = asyncio.create_task(cook('Салат', 4))
    task3 = asyncio.create_task(cook('Отбивные', 16))

    await task1
    await task2
    await task3

async def cook(order, time_to_prepare):
    print(f'Новый заказ: {order}')
    await asyncio.sleep(time_to_prepare)
    print(order, '- готово через', time_to_prepare)

asyncio.run(waiter())

# Новый заказ: Паста
# Новый заказ: Салат
# Новый заказ: Отбивные
# Салат - готово через 4
# Паста - готово через 8
# Отбивные - готово через 16
```

```python
import asyncio
import time

async def main():
    task1 = asyncio.create_task(fun1(4))
    task2 = asyncio.create_task(fun2(4))

    await task1
    await task2

async def fun1(x):
    print(x ** 2)
    await asyncio.sleep(3)
    print('fun1 завершена')

async def fun2(x):
    print(x ** 0.5)
    await asyncio.sleep(6)
    print('fun2 завершена')

print(time.strftime('%X'))
asyncio.run(main())
print(time.strftime('%X'))

# 14:35:09
# 16
# 2.0
# fun1 завершена
# fun2 завершена
# 14:35:15
```

```python

```

```python

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"