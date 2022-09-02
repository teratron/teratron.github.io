# class

[Назад][back]

```python
class Person:
    pass

tom = Person()      # определение объекта tom
bob = Person()      # определение объекта bob
```

### Методы классов, self

```python
class Person:                   # определение класса Person
    def say(self, message):     # метод 
        print(message)

    def say_hello(self):
        self.say("Hello work")  # обращаемся к выше определенному методу say

tom = Person()
tom.say("Hello METANIT.COM")    # Hello METANIT.COM
tom.say_hello()                 # Hello work
```

### Конструкторы &#95;&#95;init&#95;&#95;(self)

```python
class Person:
    # конструктор
    def __init__(self):
        print("Создание объекта Person")

    def say_hello(self):
        print("Hello")

tom = Person()      # Создание объекта Person
tom.say_hello()     # Hello
```

### Атрибуты объекта

```python
class Person:
    def __init__(self, name):
        self.name = name    # имя человека
        self.age = 1        # возраст человека

    def display_info(self):
        print(f"Name: {self.name}  Age: {self.age}")

tom = Person("Tom")

tom.display_info()   # Name: Tom  Age: 1

# динамическое определение атрибута
tom.company = "Microsoft"   
print(tom.company)   # Microsoft

# получение значений
print(tom.name)      # Tom
print(tom.age)       # 1

# изменение значения
tom.age = 37
print(tom.age)       # 37
```

### Инкапсуляция, атрибуты и свойства

```python
class Person:
    def __init__(self, name):
        self.__name = name  # устанавливаем имя
        self.__age = 1      # устанавливаем возраст

    def set_age(self, age):
        if 1 < age < 110:
            self.__age = age
        else:
            print("Недопустимый возраст")

    def get_age(self):
        return self.__age

    def get_name(self):
        return self.__name

    def display_info(self):
        print(f"Имя: {self.__name}\tВозраст: {self.__age}")

tom = Person("Tom")
tom.display_info()  # Имя: Tom  Возраст: 1
tom.set_age(-3486)  # Недопустимый возраст
tom.set_age(25)
tom.display_info()  # Имя: Tom  Возраст: 25
```

### Аннотации свойств @property (геттер-сеттер)

Для создания _свойства-геттера_ над свойством ставится аннотация `@property`.\
Для создания _свойства-сеттера_ над свойством устанавливается аннотация `имя_свойства_геттера.setter`.

```python
class Person:
    def __init__(self, name):
        self.__name = name  # устанавливаем имя
        self.__age = 1      # устанавливаем возраст

    @property
    def age(self):
        return self.__age

    @age.setter
    def age(self, age):
        if 1 < age < 110:
            self.__age = age
        else:
            print("Недопустимый возраст")

    @property
    def name(self):
        return self.__name

    def display_info(self):
        print(f"Имя: {self.__name}\tВозраст: {self.__age}")

tom = Person("Tom")

tom.display_info()  # Имя: Tom  Возраст: 1
tom.age = -3486     # Недопустимый возраст
print(tom.age)      # 1
tom.age = 36
tom.display_info()  # Имя: Tom  Возраст: 36
```

1. Стоит обратить внимание, что свойство-сеттер определяется после свойства-геттера.
2. И сеттер, и геттер называются одинаково - `age`. И поскольку геттер называется `age`, то над сеттером устанавливается
   аннотация `@age.setter`.

### Функция property()

```python
class Person:
   def __init__(self):
      self._name = None

   def get_name(self):
      print('get_name called')
      return self._name

   def set_name(self, i):
      print('set_name called')
      self._name = i

   def del_name(self):
      print('del_name called')
      del self._name

   name = property(get_name, set_name, del_name, "Person's Name Attribute")

d = Person()
d.name = 'Pankaj'
print(d.name)
del d.name

# set_name called
# get_name called
# Pankaj
# del_name called
```

### Наследование

```python
class Person:
    def __init__(self, name):
        self.__name = name   # имя человека

    @property
    def name(self):
        return self.__name

    def display_info(self):
        print(f"Name: {self.__name} ")

class Employee(Person):
    def work(self):
        print(f"{self.name} works")

tom = Employee("Tom")
print(tom.name)     # Tom
tom.display_info()  # Name: Tom 
tom.work()          # Tom works
```

### Множественное наследование

```python
# класс работника
class Employee:
    def __init__(self, name):
        self.__name = name

    @property
    def name(self):
        return self.__name

    def work(self):
        print(f"{self.name} works")

# класс студента
class Student:
    def __init__(self, name):
        self.__name = name

    @property
    def name(self):
        return self.__name

    def study(self):
        print(f"{self.name} studies")

# Наследование от классов Employee и Student
class WorkingStudent(Employee, Student):
    pass

tom = WorkingStudent("Tom")
tom.work()      # Tom works
tom.study()     # Tom studies
```

### Переопределение функционала базового класса super()

```python
class Person:
    def __init__(self, name):
        self.__name = name   # имя человека

    @property
    def name(self):
        return self.__name

    def display_info(self):
        print(f"Name: {self.__name}")

class Employee(Person):
    def __init__(self, name, company):
        super().__init__(name)
        self.company = company

    def display_info(self):
        super().display_info()
        print(f"Company: {self.company}")

    def work(self):
        print(f"{self.name} works")

tom = Employee("Tom", "Microsoft")
tom.display_info()  # Name: Tom
                    # Company: Microsoft
```

### Проверка типа объекта isinstance()

```
isinstance(object, type)
```

```python
class Person:
    def __init__(self, name):
        self.__name = name   # имя человека

    @property
    def name(self):
        return self.__name

    def do_nothing(self):
        print(f"{self.name} does nothing")

# класс работника
class Employee(Person):
    def work(self):
        print(f"{self.name} works")

# класс студента
class Student(Person):
    def study(self):
        print(f"{self.name} studies")

def act(person):
    if isinstance(person, Student):
        person.study()
    elif isinstance(person, Employee):
        person.work()
    elif isinstance(person, Person):
        person.do_nothing()

tom = Employee("Tom")
bob = Student("Bob")
sam = Person("Sam")

act(tom)    # Tom works
act(bob)    # Bob studies
act(sam)    # Sam does nothing
```

### Атрибуты класса

```python
class Person:
     type = "Person"
     description = "Describes a person"

print(Person.type)          # Person
print(Person.description)   # Describes a person

tom = Person()
bob = Person()
print(tom.type)     # Person
print(bob.type)     # Person
 
# изменим атрибут класса
Person.type = "Class Person"
print(Person.type)  # Class Person
print(tom.type)     # Class Person
print(bob.type)     # Class Person
```

```python
class Person:
    default_name = "Undefined"

    def __init__(self, name):
        if name:
            self.name = name
        else:
            self.name = Person.default_name

tom = Person("Tom")
bob = Person("")
print(tom.name)  # Tom
print(bob.name)  # Undefined
```

### Атрибут класса

```python
class Person:
    name = "Undefined"

    def print_name(self):
        print(self.name)

tom = Person()
bob = Person()
tom.print_name()    # Undefined
bob.print_name()    # Undefined

Person.name = "Some Person"  # меняем значение атрибута класса
bob.name = "Bob"             # устанавливаем атрибут объекта
bob.print_name()             # Bob
tom.print_name()             # Some Person
```

### Статические методы @staticmethod

```python
class Person:
    __type = "Person"

    @staticmethod
    def print_type():
        print(Person.__type)

Person.print_type()     # Person - обращение к статическому методу через имя класса

tom = Person()
tom.print_type()        # Person - обращение к статическому методу через имя объекта
```

### Строковое представление объекта &#95;&#95;str&#95;&#95;()

```python
class Person:
    def __init__(self, name, age):
        self.name = name  # устанавливаем имя
        self.age = age    # устанавливаем возраст

    def display_info(self):
        print(self)
        # print(self.__str__())     # или так

    def __str__(self):
        return f"Name: {self.name}  Age: {self.age}"

tom = Person("Tom", 23)
print(tom)          # Name: Tom  Age: 23
                    # вывод без __str__(): <__main__.Person object at 0x10a63dc00>
tom.display_info()  # Name: Tom  Age: 23
```

[Назад][back]

[back]: <.> "Назад к оглавлению"