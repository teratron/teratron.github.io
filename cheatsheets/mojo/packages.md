# Пакеты

[Назад][back]

---

**Пакет** - это просто набор модулей Mojo в каталоге, который включает `__init__.mojo` файл.

```
main.mojo
mypack.mojopkg  # появляется после компиляции
mypackage/
    __init__.mojo
    mymodule.mojo
```

```mojo
### __init__.mojo ###

# Файл пустой
```

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

from mypackage.mymodule import MyPair

fn main():
    let mine = MyPair(2, 4)
    mine.dump()  # 2 4
```

```shell
mojo package mypackage -o mypack.mojopkg
```

```mojo
### main.mojo ###

from mypack.mymodule import MyPair
# ...
```

`__init__.mojo` файл необходим для указания того, что каталог следует рассматривать как пакет Mojo,
и он может быть пустым.

```mojo
### __init__.mojo ###

from .mymodule import MyPair
```

```mojo
### main.mojo ###

from mypackage import MyPair
# ...
```

---

[Назад][back]

[back]: <.> "Назад к оглавлению"