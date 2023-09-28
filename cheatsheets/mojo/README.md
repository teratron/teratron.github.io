# Mojo

[Назад к перечню шпаргалок][back]

## Cli

```
mojo <command>
mojo [run-options] <path>
mojo [options]
mojo
```

### Примеры:

```shell
mojo package --help
```

| Команды  | Описание                                |
|----------|-----------------------------------------|
| run      | Создает и выполняет файл.               |
| build    | Создает исполняемый файл из файла.      |
| repl     | Запускает репозиторий.                  |
| package  | Компилирует пакет.                      |
| format   | Форматирует исходные файлы.             |
| doc      | Компилирует строки документов из файла. |
| demangle | Изменяет заданное имя.                  |

| Опции         | Описание                                      |
|---------------|-----------------------------------------------|
|               | **Варианты диагностики:**                     |
| --version, -v | Распечатывает версию Mojo и завершает работу. |
|               | **Общие параметры:**                          |
| --help, -h    | Отображает справочную информацию.             |

---

| Keyword | Описание |
|---------|----------|
| True    |          |
| False   |          |

| Объявления | Описание                         |
|------------|----------------------------------|
| const      |                                  |
| let        | неизменяемые `строгий режим`     |
| var        | изменяемые                       |
| alias      | выражения именованных параметров |

| Аргументы | Описание                             |
|-----------|--------------------------------------|
| borrowed  | неизменяемая ссылка (заимствованная) |
| inout     | изменяемые аргументы                 |
| owned     | полное владение аргументом           |

| Типы    | Описание |
|---------|----------|
| Int     |          |
| Int8    |          |
| Int16   |          |
| Int32   |          |
| Int64   |          |
| UInt8   |          |
| UInt16  |          |
| UInt32  |          |
| UInt64  |          |
| Float16 |          |
| Float32 |          |
| Float64 |          |
| Bool    |          |
| String  |          |
| Tuple   |          |

| Абстракции | Описание                           |
|------------|------------------------------------|
| struct     | статичные атрибуты `строгий режим` |
| class      | динамичные атрибуты                |

| Функции | Описание        |
|---------|-----------------|
| fn      | `строгий режим` |
| def     |                 |

## Функции

### borrowed

Функция не может изменять их, потому что `fn` аргументы по умолчанию являются _неизменяемыми ссылками_.\
С точки зрения соглашений об аргументах это называется “заимствованием”.

```mojo
fn add(x: Int, y: Int) -> Int:
    return x + y

fn main():
    let z = add(1, 2)
    print(z)  # 3
```

или

```mojo
fn add(borrowed x: Int, borrowed y: Int) -> Int:
    return x + y
# ...
```

### inout

Изменяемые аргументы

```mojo
fn add_inout(inout x: Int, inout y: Int) -> Int:
    x += 1
    y += 1
    return x + y

fn main():
    var a = 1
    var b = 2
    let c = add_inout(a, b)
    print(a)  # 2
    print(b)  # 3
    print(c)  # 5
```

### owned

```mojo
fn set_fire(owned text: String) -> String:
    text += "🔥"
    return text

fn main():
    let a: String = "mojo"
    let b = set_fire(a)
    print(a)  # mojo
    print(b)  # mojo🔥
```

### transfer `^`

Однако, если вы хотите предоставить функции право собственности на значение и не хотите создавать копию,
то вы можете добавить оператор `^` _**transfer**_ при передаче a в функцию.\
_**transfer**_ уничтожает имя локальной переменной — любая попытка вызвать его позже вызывает ошибку компилятора.

```mojo
fn set_fire(owned text: String) -> String:
    text += "🔥"
    return text

fn main():
    let a: String = "mojo"
    let b = set_fire(a ^)
    print(a)  # error: use of uninitialized value 'a'
    print(b)
```

## Структуры

```mojo
struct MyPair:
    var first: Int
    var second: Int

    fn __init__(inout self, first: Int, second: Int):
        self.first = first
        self.second = second

    fn __lt__(self, rhs: MyPair) -> Bool:
        return self.first < rhs.first or
              (self.first == rhs.first and
               self.second < rhs.second)

    fn dump(self):
        print(self.first, self.second)

fn main():
    let mine = MyPair(2, 4)
    mine.dump()  # 2 4
```

### Перегруженные функции и методы

```mojo
struct Complex:
    var re: Float32
    var im: Float32

    fn __init__(inout self, x: Float32):
        """Construct a complex number given a real number."""
        self.re = x
        self.im = 0.0

    fn __init__(inout self, r: Float32, i: Float32):
        """Construct a complex number given its real and imaginary components."""
        self.re = r
        self.im = i
```

### Специальные методы `__copyinit__` и `__moveinit__`

```mojo
from memory.unsafe import Pointer

struct HeapArray:
    var data: Pointer[Int]
    var size: Int
    var cap: Int

    fn __init__(inout self):
        self.cap = 16
        self.size = 0
        self.data = Pointer[Int].alloc(self.cap)

    fn __init__(inout self, size: Int, val: Int):
        self.cap = size * 2
        self.size = size
        self.data = Pointer[Int].alloc(self.cap)
        for i in range(self.size):
            self.data.store(i, val)
     
    fn __del__(owned self):
        self.data.free()

    fn dump(self):
        print_no_newline("[")
        for i in range(self.size):
            if i > 0:
                print_no_newline(", ")
            print_no_newline(self.data.load(i))
        print("]")

fn main():
    let a = HeapArray(3, 1)
    a.dump()   # [1, 1, 1]
    # Если бы не __copyinit__, то 'ERROR: Vector doesn't implement __copyinit__':
    let b = a

    b.dump()   # [1, 1, 1]
    a.dump()   # [1, 1, 1]
```

```mojo
struct UniquePointer:
    var ptr: Int
    
    fn __init__(inout self, ptr: Int):
        self.ptr = ptr
    
    fn __moveinit__(inout self, owned existing: Self):
        self.ptr = existing.ptr
        
    fn __del__(owned self):
        self.ptr = 0

fn take_ptr(owned p: UniquePointer):
    print("take_ptr")
    print(p.ptr)

fn use_ptr(borrowed p: UniquePointer):
    print("use_ptr")
    print(p.ptr)
    
fn main():
    let p = UniquePointer(100)
    use_ptr(p)    # Переход к функции заимствования.
    take_ptr(p^)  # Передаёт право собственности на значение `p` другой функции.

    # Uncomment to see an error:
    # use_ptr(p) # ERROR: `p` здесь больше недействителен!
```

## Modules

Модуль - это единый исходный файл Mojo, содержащий код,
пригодный для использования другими файлами, которые его импортируют.

```mojo
### mymodule.mojo ###

struct MyPair:
    var first: Int
    var second: Int

    fn __init__(inout self, first: Int, second: Int):
        self.first = first
        self.second = second

    fn dump(self):
        print(self.first, self.second)
```

```mojo
### main.mojo ###

from mymodule import MyPair

fn main():
    let mine = MyPair(2, 4)
    mine.dump()  # 2 4
```

или

```mojo
### main.mojo ###

import mymodule as my

fn main():
    let mine = my.MyPair(2, 4)
    mine.dump()  # 2 4
```

## Packages

Пакет - это просто набор модулей Mojo в каталоге, который включает `__init__.mojo` файл.

```
main.mojo
mypackage/
    __init__.mojo
    mymodule.mojo
```

```mojo
### main.mojo ###

from mypackage.mymodule import MyPair

fn main():
    let mine = MyPair(2, 4)
    mine.dump()  # 2 4
```

```shell
mojo package mypackage -o mypack.mojopkg
```

```
main.mojo
mypack.mojopkg
```

```mojo
### main.mojo ###

from mypack.mymodule import MyPair
# ...
```

`__init__.mojo` файл необходим для указания того, что каталог следует рассматривать как пакет Mojo, и он может быть
пустым.

```mojo
### __init__.mojo ###

from .mymodule import MyPair
```

```mojo
### main.mojo ###

from mypackage import MyPair
# ...
```

## Generics

```mojo
struct Array[T: AnyType]:
    var data: Pointer[T]
    var size: Int
    var cap: Int

    fn __init__(inout self, size: Int, value: T):
        self.cap = size * 2
        self.size = size
        self.data = Pointer[T].alloc(self.cap)
        for i in range(self.size):
            self.data.store(i, value)
              
    fn __getitem__(self, i: Int) -> T:
        return self.data.load(i)

    fn __del__(owned self):
        self.data.free()

fn main():
    let v = Array[Float32](4, 3.14)
    print(v[0], v[1], v[2], v[3])  # 3.14 3.14 3.14 3.14
```

## Выражения именованных параметров `alias`

```mojo
struct DType:
    var value: UI8
    alias invalid = DType(0)
    alias bool = DType(1)
    alias int8 = DType(2)
    alias uint8 = DType(3)
    alias int16 = DType(4)
    alias int16 = DType(5)
    # ...
    alias float32 = DType(15)
    
alias Float16 = SIMD[DType.float16, 1]
alias UInt8 = SIMD[DType.uint8, 1]

var x : Float16   # F16 works like a "typedef"
```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

---

[https://docs.modular.com/mojo/](https://docs.modular.com/mojo/)

---

[Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"