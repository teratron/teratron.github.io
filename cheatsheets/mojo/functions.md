# Функции

[Назад][back]

## Аргументы

| Аргументы | Описание                             |
|-----------|--------------------------------------|
| borrowed  | неизменяемая ссылка (заимствованная) |
| inout     | изменяемые аргументы                 |
| owned     | полное владение аргументом           |

### borrowed

Функция не может изменять аргументы, потому что `fn` аргументы по умолчанию являются _неизменяемыми ссылками_ - это
называется **заимствованием**.

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

### Передача аргументов

```mojo
fn foo(a: Int, b: Int = 3) -> Int:
    return a * b

fn main():
    print(foo(6))         # 18
    print(foo(a=6))       # 18
    print(foo(6, b=7))    # 42
    print(foo(a=6, b=7))  # 42
    print(foo(b=7, a=6))  # 42
```

### Вывод из аргументов ключевого слова

```mojo
fn bar[A: AnyType, B: AnyType](a: A, b: B):
    print("Hello 🔥")

fn bar[B: AnyType](a: StringLiteral, b: B):
    print(a)

fn main():
    bar(1, 2)           # Hello 🔥
    bar(b=2, a="Yay!")  # Yay!
```

### Параметры по умолчанию

```mojo
fn foo[a: Int = 3, msg: StringLiteral = "woof"]():
    print(msg, a)

fn main():
    foo()             # woof 3
    foo[5]()          # woof 5
    foo[7, "meow"]()  # meow 7
```

Предполагаемые значения параметров имеют приоритет над значениями по умолчанию:

```mojo
@value
struct Bar[v: Int]:
    pass

fn foo[a: Int = 42, msg: StringLiteral = "quack"](bar: Bar[a]):
    print(msg, a)

fn main():
    foo(Bar[9]())  # quack 9
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