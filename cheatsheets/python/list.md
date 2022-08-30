# list

[Назад][back]

```python
numbers1 = []
numbers2 = list()   # функция-конструктор
```

```python
numbers = [1, 2, 3, 4, 5]
peoples = ["Tom", "Sam", "Bob"]
objects = [1, 2.6, "Hello", True]

print(numbers)      # [1, 2, 3, 4, 5]
print(peoples)      # ["Tom", "Sam", "Bob"]
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

peoples = ["Tom"] * 3           # 3 раза повторяем "Tom"
print(peoples)                  # ["Tom", "Tom", "Tom"]

students = ["Bob", "Sam"] * 2   # 2 раза повторяем "Bob", "Sam"
print(students)                 # ["Bob", "Sam", "Bob", "Sam"]
```

### Обращение к элементам списка

```python
peoples = ["Tom", "Sam", "Bob"]

# получение элементов с начала списка
print(peoples[0])   # Tom
print(peoples[1])   # Sam
print(peoples[2])   # Bob

# получение элементов с конца списка
print(peoples[-2])  # Sam
print(peoples[-1])  # Bob
print(peoples[-3])  # Tom

peoples[1] = "Mike" # изменение второго элемента
print(peoples[1])   # Mike
print(peoples)      # ["Tom", "Mike", "Bob"]
```

### Разложение списка

```python
peoples = ["Tom", "Bob", "Sam"]

tom, bob, sam = peoples

print(tom)      # Tom
print(bob)      # Bob
print(sam)      # Sam
```

### Перебор элементов

```python
peoples = ["Tom", "Sam", "Bob"]

for person in peoples:
    print(person)
```

```python
peoples = ["Tom", "Sam", "Bob"]
i = 0

while i < len(peoples):
    print(peoples[i])    # применяем индекс для получения элемента
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

append(item): добавляет элемент item в конец списка

insert(index, item): добавляет элемент item в список по индексу index

extend(items): добавляет набор элементов items в конец списка

remove(item): удаляет элемент item. Удаляется только первое вхождение элемента. Если элемент не найден, генерирует
исключение ValueError

clear(): удаление всех элементов из списка

index(item): возвращает индекс элемента item. Если элемент не найден, генерирует исключение ValueError

pop([index]): удаляет и возвращает элемент по индексу index. Если индекс не передан, то просто удаляет последний
элемент.

count(item): возвращает количество вхождений элемента item в список

sort([key]): сортирует элементы. По умолчанию сортирует по возрастанию. Но с помощью параметра key мы можем передать
функцию сортировки.

reverse(): расставляет все элементы в списке в обратном порядке

copy(): копирует список

Кроме того, Python предоставляет ряд встроенных функций для работы со списками:

len(list): возвращает длину списка

sorted(list, [key]): возвращает отсортированный список

min(list): возвращает наименьший элемент списка

max(list): возвращает наибольший элемент списка

### Добавление и удаление элементов

```python
peoples = ["Tom", "Bob"]
 
# добавляем в конец списка
peoples.append("Alice")                  # ["Tom", "Bob", "Alice"]

# добавляем на вторую позицию
peoples.insert(1, "Bill")                # ["Tom", "Bill", "Bob", "Alice"]

# добавляем набор элементов ["Mike", "Sam"]
peoples.extend(["Mike", "Sam"])          # ["Tom", "Bill", "Bob", "Alice", "Mike", "Sam"]

# получаем индекс элемента
index_of_tom = peoples.index("Tom")

# удаляем по этому индексу
removed_item = peoples.pop(index_of_tom) # ["Bill", "Bob", "Alice", "Mike", "Sam"]

# удаляем последний элемент
last_item = peoples.pop()                # ["Bill", "Bob", "Alice", "Mike"]

# удаляем элемент "Alice"
peoples.remove("Alice")                  # ["Bill", "Bob", "Mike"]
print(peoples)                           # ["Bill", "Bob", "Mike"]

# удаляем все элементы
peoples.clear()
print(peoples)                           # []
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

```python

```

```python

```

```python

```

[Назад][back]

[back]: <.> "Назад к оглавлению"