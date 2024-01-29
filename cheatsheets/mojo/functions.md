# Функции

[Назад][back]

---

## Аргументы

| Аргументы | Описание                             |
|-----------|--------------------------------------|
| borrowed  | неизменяемая ссылка (заимствованная) |
| inout     | изменяемая ссылка                    |
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

### Transfer `^`

Однако, если вы хотите предоставить функции право собственности на значение и не хотите создавать копию, то вы можете добавить оператор `^`
_**transfer**_ при передаче `a` в функцию.\
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

## Параметры

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
struct Bar[v: Int]: pass

fn foo[a: Int = 42, msg: StringLiteral = "quack"](bar: Bar[a]):
    print(msg, a)

fn main():
    foo(Bar[9]())  # quack 9
```

### Параметры ключевых слов

```mojo
fn foo[a: Int, b: Int = 42]():
    print(a, "+", b)

fn main():
    foo[a=5]()        # 5 + 42
    foo[a=7, b=13]()  # 7 + 13
    foo[b=20, a=6]()  # 6 + 20
```

### Вывод из параметров ключевого слова

```mojo
fn bar[A: AnyType, B: AnyType](a: A, b: B):
    print("Hello 🔥")

fn bar[B: AnyType](a: StringLiteral, b: B):
    print(a)

fn main():
    bar(1, 2)           # Hello 🔥
    bar(b=2, a="Yay!")  # Yay!
```

### Автоматическая параметризация

```mojo
@value
struct Thing[x: Int, y: Int]: pass

fn foo(v: Thing):
    print(v.x, v.y)

fn baz(v: Thing[y=7]): pass

fn main():
    let v = Thing[2, 3]()
    foo(v)  # 2 3
```

На входные параметры аргумента функции можно ссылаться в сигнатуре функции:

```mojo
fn foo(x: SIMD, y: SIMD[x.type, x.size]): pass
```

```mojo

```

```mojo

```

```mojo

```

---

[Назад][back]

[back]: <.> "Назад к оглавлению"