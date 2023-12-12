# Модули

[Назад][back]

---

**Модуль** - это единый исходный файл Mojo, содержащий код,
пригодный для использования другими файлами, которые его импортируют.

```
main.mojo
mymodule.mojo
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

---

[Назад][back]

[back]: <.> "Назад к оглавлению"