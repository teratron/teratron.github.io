# list

← [Назад][back]

**Список** (list) представляет тип данных, который хранит набор или последовательность элементов.

```python
numbers1 = []
numbers2 = list()   # функция-конструктор
```

```python
numbers = [1, 2, 3, 4, 5]
people  = ["Tom", "Sam", "Bob"]
objects = [1, 2.6, "Hello", True]

print(numbers)      # [1, 2, 3, 4, 5]
print(people)       # ["Tom", "Sam", "Bob"]
print(objects)      # [1, 2.6, "Hello", True]
```

```python
numbers1 = [1, 2, 3, 4, 5]
numbers2 = list(numbers1)
print(numbers2)     # [1, 2, 3, 4, 5]
```

```python
letters = list("Hello")
print(letters)      # ['H', 'e', 'l', 'l', 'o']
```

Если необходимо создать список, в котором повторяется одно и то же значение несколько раз, то можно использовать символ
звездочки `*`:

```python
numbers = [5] * 6               # 6 раз повторяем 5
print(numbers)                  # [5, 5, 5, 5, 5, 5]

people = ["Tom"] * 3            # 3 раза повторяем "Tom"
print(people)                   # ["Tom", "Tom", "Tom"]

students = ["Bob", "Sam"] * 2   # 2 раза повторяем "Bob", "Sam"
print(students)                 # ["Bob", "Sam", "Bob", "Sam"]
```

### Обращение к элементам списка

```python
people = ["Tom", "Sam", "Bob"]

# получение элементов с начала списка
print(people[0])   # Tom
print(people[1])   # Sam
print(people[2])   # Bob

# получение элементов с конца списка
print(people[-2])  # Sam
print(people[-1])  # Bob
print(people[-3])  # Tom

people[1] = "Mike" # изменение второго элемента
print(people[1])   # Mike
print(people)      # ["Tom", "Mike", "Bob"]
```

### Разложение списка

```python
people = ["Tom", "Bob", "Sam"]

tom, bob, sam = people

print(tom)      # Tom
print(bob)      # Bob
print(sam)      # Sam
```

### Перебор элементов

```python
people = ["Tom", "Sam", "Bob"]

for person in people:
    print(person)
```

```python
people = ["Tom", "Sam", "Bob"]
i = 0

while i < len(people):
    print(people[i])    # применяем индекс для получения элемента
    i += 1
```

### Сравнение списков

```python
numbers1 = [1, 2, 3, 4, 5]
numbers2 = list([1, 2, 3, 4, 5])

if numbers1 == numbers2:
    print("numbers1 equal to numbers2")  # оба списка будут равны
else:
    print("numbers1 is not equal to numbers2")
```

### Методы и функции по работе со списками

| Методы              | Описание                                                                                                                   |
|---------------------|----------------------------------------------------------------------------------------------------------------------------|
| append(item)        | добавляет элемент item в конец списка                                                                                      |
| insert(index, item) | добавляет элемент item в список по индексу index                                                                           |
| extend(items)       | добавляет набор элементов items в конец списка                                                                             |
| remove(item)        | удаляет элемент item. Удаляется только первое вхождение элемента. Если элемент не найден, генерирует исключение ValueError |
| clear()             | удаление всех элементов из списка                                                                                          |
| index(item)         | возвращает индекс элемента item. Если элемент не найден, генерирует исключение ValueError                                  |
| pop([index])        | удаляет и возвращает элемент по индексу index. Если индекс не передан, то просто удаляет последний элемент                 |
| count(item)         | возвращает количество вхождений элемента item в список                                                                     |
| sort([key])         | сортирует элементы. По умолчанию сортирует по возрастанию. Но с помощью параметра key мы можем передать функцию сортировки |
| reverse()           | расставляет все элементы в списке в обратном порядке                                                                       |
| copy()              | копирует список                                                                                                            |

Кроме того, Python предоставляет ряд встроенных функций для работы со списками:

| Методы              | Описание                             |
|---------------------|--------------------------------------|
| len(list)           | возвращает длину списка              |
| sorted(list, [key]) | возвращает отсортированный список    |
| min(list)           | возвращает наименьший элемент списка |
| max(list)           | возвращает наибольший элемент списка |

### Добавление и удаление элементов

```python
people = ["Tom", "Bob"]
 
# добавляем в конец списка
people.append("Alice")                  # ["Tom", "Bob", "Alice"]

# добавляем на вторую позицию
people.insert(1, "Bill")                # ["Tom", "Bill", "Bob", "Alice"]

# добавляем набор элементов ["Mike", "Sam"]
people.extend(["Mike", "Sam"])          # ["Tom", "Bill", "Bob", "Alice", "Mike", "Sam"]

# получаем индекс элемента
index_of_tom = people.index("Tom")

# удаляем по этому индексу
removed_item = people.pop(index_of_tom) # ["Bill", "Bob", "Alice", "Mike", "Sam"]

# удаляем последний элемент
last_item = people.pop()                # ["Bill", "Bob", "Alice", "Mike"]

# удаляем элемент "Alice"
people.remove("Alice")                  # ["Bill", "Bob", "Mike"]
print(people)                           # ["Bill", "Bob", "Mike"]

# удаляем все элементы
people.clear()
print(people)                           # []
```

### Проверка наличия элемента

```python
people = ["Tom", "Bob", "Alice", "Sam"]

if "Alice" in people:
    people.remove("Alice")

print(people)       # ["Tom", "Bob", "Sam"]
```

### Удаление с помощью del

```python
people = ["Tom", "Bob", "Alice", "Sam", "Bill", "Kate", "Mike"]

del people[1]    # удаляем второй элемент
print(people)    # ["Tom", "Alice", "Sam", "Bill", "Kate", "Mike"]

del people[:3]   # удаляем  по четвертый элемент не включая
print(people)    # ["Bill", "Kate", "Mike"]

del people[1:]   # удаляем  со второго элемента
print(people)    # ["Bill"]
```

### Подсчет вхождений count()

```python
people = ["Tom", "Bob", "Alice", "Tom", "Bill", "Tom"]

people_count = people.count("Tom")
print(people_count)      # 3
```

### Сортировка sort(), reverse(), sorted()

```python
people = ["Tom", "Bob", "Alice", "Sam", "Bill"]

people.sort()
print(people)      # ["Alice", "Bill", "Bob", "Sam", "Tom"]

people.reverse()   # если необходимо отсортировать данные в обратном порядке
print(people)      # ["Tom", "Sam", "Bob", "Bill", "Alice"]
```

```python
people = ["Tom", "bob", "alice", "Sam", "Bill"]

people.sort()      # стандартная сортировка
print(people)      # ["Bill", "Sam", "Tom", "alice", "bob"]

people.sort(key=str.lower)  # сортировка без учета регистра
print(people)      # ["alice", "Bill", "bob", "Sam", "Tom"]
```

```python
people = ["Tom", "bob", "alice", "Sam", "Bill"]

sorted_people = sorted(people, key=str.lower)
print(sorted_people)      # ["alice", "Bill", "bob", "Sam", "Tom"]
```

### Минимальное и максимальное значения

```python
numbers = [9, 21, 12, 1, 3, 15, 18]

print(min(numbers))     # 1
print(max(numbers))     # 21
```

### Копирование списков copy

Списки представляют изменяемый (mutable) тип, поэтому если обе переменных будут указывать на один и тот же список, то
изменение одной переменной, затронет и другую переменную.
Это так называемое "поверхностное копирование" (shallow copy):

```python
people1 = ["Tom", "Bob", "Alice"]

people2 = people1
people2.append("Sam")   # добавляем элемент во второй список

# people1 и people2 указывают на один и тот же список
print(people1)   # ["Tom", "Bob", "Alice", "Sam"]
print(people2)   # ["Tom", "Bob", "Alice", "Sam"]
```

И чтобы происходило копирование элементов, но при этом переменные указывали на разные списки, необходимо выполнить
глубокое копирование (deep copy).

```python
people1 = ["Tom", "Bob", "Alice"]

people2 = people1.copy()    # копируем элементы из people1 в people2
people2.append("Sam")       # добавляем элемент ТОЛЬКО во второй список

# people1 и people2 указывают на разные списки
print(people1)   # ["Tom", "Bob", "Alice"]
print(people2)   # ["Tom", "Bob", "Alice", "Sam"]
```

### Копирование части списка

| Метод                | Описание                                                                                                                |
|----------------------|-------------------------------------------------------------------------------------------------------------------------|
| list[:end]           | через параметр end передается индекс элемента, до которого нужно копировать список                                      |
| list[start:end]      | параметр start указывает на индекс элемента, начиная с которого надо скопировать элементы                               |
| list[start:end:step] | параметр step указывает на шаг, через который будут копироваться элементы из списка. По умолчанию этот параметр равен 1 |

```python
people = ["Tom", "Bob", "Alice", "Sam", "Tim", "Bill"]

slice_people1 = people[:3]   # с 0 по 3
print(slice_people1)   # ["Tom", "Bob", "Alice"]

slice_people2 = people[1:3]   # с 1 по 3
print(slice_people2)   # ["Bob", "Alice"]

slice_people3 = people[1:6:2]   # с 1 по 6 с шагом 2
print(slice_people3)   # ["Bob", "Sam", "Bill"]
```

### Соединение списков

```python
people1 = ["Tom", "Bob", "Alice"]
people2 = ["Tom", "Sam", "Tim", "Bill"]
people3 = people1 + people2

print(people3)   # ["Tom", "Bob", "Alice", "Tom", "Sam", "Tim", "Bill"]
```

### Списки списков

```python
people = [
    ["Tom", 29],
    ["Alice", 33],
    ["Bob", 27]
]

print(people[0])         # ["Tom", 29]
print(people[0][0])      # Tom
print(people[0][1])      # 29
```

```python
people = [
    ["Tom", 29],
    ["Alice", 33],
    ["Bob", 27]
]

# создание вложенного списка
person = list()
person.append("Bill")
person.append(41)

# добавление вложенного списка
people.append(person)

print(people[-1])         # ["Bill", 41]

# добавление во вложенный список
people[-1].append("+79876543210")

print(people[-1])         # ["Bill", 41, "+79876543210"]

# удаление последнего элемента из вложенного списка
people[-1].pop()
print(people[-1])         # ["Bill", 41]

# удаление всего последнего вложенного списка
people.pop(-1)

# изменение первого элемента
people[0] = ["Sam", 18]
print(people)             # [ ["Sam", 18], ["Alice", 33], ["Bob", 27]]
```

Перебор вложенных списков:

```python
people = [
    ["Tom", 29],
    ["Alice", 33],
    ["Bob", 27]
]

for person in people:
    for item in person:
        print(item, end=" | ")  # Tom | 29 | Alice | 33 | Bob | 27 |
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"