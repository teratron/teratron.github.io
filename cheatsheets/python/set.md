# set

← [Назад][back]

**Множество** (set) представляют еще один вид набора, который хранит только уникальные элементы.

```python
users = {}
users = set()
```

```python
users = {"Tom", "Bob", "Alice", "Tom"}

# функция print вывела один раз элемент "Tom",
# потому что множество содержит только уникальные значения
print(users)    # {"Alice", "Bob", "Tom"}
```

```python
people = ["Mike", "Bill", "Ted"]

users = set(people)
print(users)        # {"Mike", "Bill", "Ted"}
print(len(users))   # 3
```

### Добавление элементов add()

```python
users = set()
users.add("Sam")
print(users)    # {"Sam"}
```

### Удаление элементов

Для удаления одного элемента вызывается метод `remove()`:

```python
users = {"Tom", "Bob", "Alice"}
user = "Tom"

if user in users: 
    users.remove(user)

print(users)    # {"Bob", "Alice"}
```

Также для удаления можно использовать метод `discard()`, который не будет генерировать исключения при отсутствии
элемента:

```python
users = {"Tom", "Bob", "Alice"}

users.discard("Tim")  # элемент "Tim" отсутствует, и метод ничего не делает
print(users)          # {"Tom", "Bob", "Alice"}

users.discard("Tom")  # элемент "Tom" есть, и метод удаляет элемент
print(users)          # {"Bob", "Alice"}
```

Для удаления всех элементов вызывается метод `clear()`:

```python
users.clear()
```

### Перебор множества

```python
users = {"Tom", "Bob", "Alice"}

for user in users:
    print(user)
```

### Операции с множествами

С помощью метода `copy()` можно скопировать содержимое одного множества в другую переменную:

```python
users = {"Tom", "Bob", "Alice"}
students = users.copy()
print(students)     # {"Tom", "Bob", "Alice"}
```

Метод `union()` объединяет два множества и возвращает новое множество:

```python
users1 = {"Tom", "Bob", "Alice"}
users2 = {"Sam", "Kate", "Bob"}

users3 = users1.union(users2)
print(users3)   # {"Bob", "Alice", "Sam", "Kate", "Tom"}
```

Пересечение множеств позволяет получить только те элементы, которые есть одновременно в обоих множествах.
Метод `intersection()` производит операцию пересечения множеств и возвращает новое множество:

```python
users1 = {"Tom", "Bob", "Alice"}
users2 = {"Sam", "Kate", "Bob"}

users3 = users1.intersection(users2)
print(users3)           # {"Bob"}
# или
print(users1 & users2)  # {"Bob"}
```

Еще одна операция - разность множеств возвращает те элементы, которые есть в первом множестве, но отсутствуют во втором.
Для получения разности множеств можно использовать метод `difference()` или операцию вычитания:

```python
users1 = {"Tom", "Bob", "Alice"}
users2 = {"Sam", "Kate", "Bob"}

users3 = users1.difference(users2)
print(users3)           # {"Tom", "Alice"}
# или
print(users1 - users2)  # {"Tom", "Alice"}
```

Отдельная разновидность разности множеств - симметрическая разность производится с помощью
метода `symmetric_difference()`.
Она возвращает все элементы обоих множеств за исключением общих:

```python
users1 = {"Tom", "Bob", "Alice"}
users2 = {"Sam", "Kate", "Bob"}

users3 = users1.symmetric_difference(users2)
print(users3)   # {"Tom", "Alice", "Sam", "Kate"}
```

### Отношения между множествами

Метод `issubset()` позволяет выяснить, является ли текущее множество подмножеством (то есть частью) другого множества:

```python
users = {"Tom", "Bob", "Alice"}
superusers = {"Sam", "Tom", "Bob", "Alice", "Greg"}

print(users.issubset(superusers))   # True
print(superusers.issubset(users))   # False
```

Метод `issuperset()`, наоборот, возвращает `True`, если текущее множество является надмножеством (то есть содержит) для
другого множества:

```python
users = {"Tom", "Bob", "Alice"}
superusers = {"Sam", "Tom", "Bob", "Alice", "Greg"}

print(users.issuperset(superusers))   # False
print(superusers.issuperset(users))   # True
```

### frozenset()

Тип **frozenset** является видом множеств, которое не может быть изменено.
Для его создания используется функция `frozenset()`:

```python
users = frozenset({"Tom", "Bob", "Alice"})
```

В такое множество мы не можем добавить новые элементы, как и удалить из него уже имеющиеся.
Собственно поэтому **frozen set** поддерживает ограниченный набор операций:

| Методы            | Описание                                                   |
|-------------------|------------------------------------------------------------|
| len(s)            | возвращает длину множества                                 |
| x in s            | возвращает True, если элемент x присутствует в множестве s |
| x not in s        | возвращает True, если элемент x отсутствует в множестве s  |
| s.issubset(t)     | возвращает True, если t содержит множество s               |
| s.issuperset(t)   | возвращает True, если t содержится в множестве s           |
| s.union(t)        | возвращает объединение множеств s и t                      |
| s.intersection(t) | возвращает пересечение множеств s и t                      |
| s.difference(t)   | возвращает разность множеств s и t                         |
| s.copy()          | возвращает копию множества s                               |

← [Назад][back]

[back]: <.> "Назад к оглавлению"