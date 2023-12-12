# Трейты

[Назад][back]

---

За сигнатурой каждого метода должны следовать три точки `...`, указывающие на то, что метод не реализован.

```mojo
trait Quackable:
    fn quack(self):
        ...

@value
struct Duck(Quackable):
    fn quack(self):
        print("Quack")

@value
struct StealthCow(Quackable):
    fn quack(self):
        print("Moo!")

fn make_it_quack[T: Quackable](maybe_a_duck: T):
    maybe_a_duck.quack()

fn main():
    make_it_quack(Duck())
    make_it_quack(StealthCow())
```

## Статические методы

```mojo
trait HasStaticMethod:
    @staticmethod
    fn do_stuff(): ...

fn fun_with_traits[T: HasStaticMethod]():
    T.do_stuff()
```

## Наследование признаков

```mojo
trait Animal:
    fn make_sound(self): ...

trait Bird(Animal):
    fn fly(self): ...

trait Named:
    fn get_name(self) -> String: ...

trait Pet(Animal, Named):
    pass
```

## Признаки и методы жизненного цикла

Обратите внимание, что `@register_passable` и `@register_passable("trivial")`типы имеют ограничения на свои методы жизненного цикла: они по-разному определяют свои конструкторы, а тривиальные типы не могут определять конструкторы копирования или перемещения.

```mojo
trait DefaultConstructible:
    fn __init__(inout self): ...

trait Movable:
    fn __moveinit__(inout self, owned existing: Self): ...

trait MassProducible(DefaultConstructible, Movable):
    pass

fn factory[T: MassProducible]() -> T:
    return T()

struct Thing(MassProducible):
    var id: Int

    fn __init__(inout self):
        self.id = 0

    fn __moveinit__(inout self, owned existing: Self):
        self.id = existing.id

@register_passable
struct RegisterPassableType(DefaultConstructible):
    # Это нормально: трейты понимают разные соглашения о типах.
    fn __init__() -> Self:
        return Self {}

fn main():
    let thing = factory[Thing]()
```

## Встроенные характеристики

- CollectionElement
- Copyable
- Destructable
- Intable
- Movable
- Sized
- Stringable

### Sized

Признак определяет типы, которые имеют измеримую длину, такие как строки и массивы.

```mojo
struct MyVector(Sized):
    var size: Int
    # ...

    fn __init__(inout self):
        self.size = 0

    fn __len__(self) -> Int:
        return self.size

fn main():
    print(len(MyVector()))
```

### Intable и Stringable

Определяют типы, которые могут быть неявно преобразованы в `Int` и `String` соответственно.

```mojo
@value
struct Pet(Stringable):
    var name: String
    var type: String

    fn __str__(self) -> String:
        return "This is a " + self.type + " named " + self.name

fn main():
    let spot = Pet("Spot", "dog")
    print(spot)
```

```mojo
@value
struct Foo(Intable):
    var i: Int

    fn __int__(self) -> Int:
        return self.i
```

### Destructable

Любой тип, который динамически выделяет память, должен предоставлять деструктор `__del__() ` метод, который должен вызываться для освобождения выделенной памяти.

```mojo
@value
struct Foo(Destructable):
    var p: Pointer[Int]
    var size: Int

    fn __init__(inout self, size: Int):
        self.p = Pointer[Int].alloc(size)
        self.size = size

    fn __del__(owned self):
        print("--freeing allocated memory--")
        self.p.free()
```

## Generic structs с трейтами

```mojo
from utils.vector import DynamicVector

var vector = DynamicVector[Int]()
vector.append(3)
vector.append(6)
vector.append(9)
for i in range(len(vector)):
    print_no_newline(vector[i], " ")
```

```mojo

```

---

[Назад][back]

[back]: <.> "Назад к оглавлению"