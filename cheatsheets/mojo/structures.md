# Структуры

[Назад][back]

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

## Перегруженные функции и методы

```mojo
struct Complex:
    var re: Float32
    var im: Float32

    fn __init__(inout self, x: Float32):
        """Постройте комплексное число по действительному числу."""
        self.re = x
        self.im = 0.0

    fn __init__(inout self, r: Float32, i: Float32):
        """Постройте комплексное число, зная его действительную и мнимую составляющие."""
        self.re = r
        self.im = i
```

## Специальные методы `__copyinit__` и `__moveinit__`

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

### Параметры по умолчанию

```mojo
@value
struct DefaultParams[msg: StringLiteral = "woof"]:
    alias message = msg

fn main():
    print(DefaultParams[]().message)        # woof
    print(DefaultParams["meow"]().message)  # meow
```

```mojo
@value
struct Thing[param: Int]:
    pass

fn foo[value: Int]():
    print(value)

fn main():
    print(Thing[2].param) # 2
    let x = Thing[9]()
    print(x.param)        # 9
    
    let y = Thing[12]()
    alias constant = y.param + 4
    foo[constant]()       # 16
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

[Назад][back]

[back]: <.> "Назад к оглавлению"