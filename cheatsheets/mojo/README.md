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

| Объявления | Описание                     |
|------------|------------------------------|
| let        | неизменяемые `строгий режим` |
| var        | изменяемые                   |
| const      |                              |
| alias      |                              |
| borrowed   | заимствованные аргументы     |
| inout      | изменяемые аргументы         |
| owned      | полное владение аргументом   |

| Типы   | Описание |
|--------|----------|
| Int    |          |
| Bool   |          |
| String |          |
| Tuple  |          |

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

    fn dump(self):
        print(self.first, self.second)

fn main():
    let mine = MyPair(2, 4)
    mine.dump()  # 2 4
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

```mojo

```

```mojo

```

---

[https://docs.modular.com/mojo/](https://docs.modular.com/mojo/)

---

[Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"