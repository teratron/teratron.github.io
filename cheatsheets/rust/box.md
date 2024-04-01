# Box

← [Назад][back]

Наиболее простой умный указатель - это `box`, чей тип записывается как `Box<T>`.
Такие переменные позволяют хранить данные в куче, а не в стеке.
То, что остаётся в стеке, является указателем на данные в куче.

## Использование Box<T> для хранения данных в куче

```rust
fn main() {
    // Мы объявляем переменную b со значением Box, указывающим на число 5, размещённое в куче.
    let b = Box::new(5);
    println!("b = {}", b); // b = 5
}
```

### Включение рекурсивных типов с помощью Boxes

```rust
enum List {
    Cons(i32, List),
    Nil,
}

use crate::List::{Cons, Nil};

fn main() {
    // Ошибка говорит о том, что этот тип "имеет бесконечный размер".
    let list = Cons(1, Cons(2, Cons(3, Nil)));
}
```

```rust
enum List {
    Cons(i32, Box<List>),
    Nil,
}

use crate::List::{Cons, Nil};

fn main() {
    let list = Cons(1, Box::new(Cons(2, Box::new(Cons(3, Box::new(Nil))))));
}
```

### Использование Box<T> как ссылку

```rust
fn main() {
    let x = 5;
    let y = Box::new(x); // let y = &x;

    assert_eq!(5, x);
    assert_eq!(5, *y);
}
```

### Определение собственного умного указателя. Deref

```rust
use std::ops::Deref;

struct MyBox<T>(T);

impl<T> MyBox<T> {
    fn new(x: T) -> MyBox<T> {
        MyBox(x)
    }
}

impl<T> Deref for MyBox<T> {
    type Target = T; // определяет связанный тип для использования у типажа Deref.

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

fn main() {*(y.deref())
    let x = 5;
    let y = MyBox::new(x);

    assert_eq!(5, x);
    // Наш тип MyBox<T> не может быть разыменован, потому что мы не реализовали эту возможность.
    // Чтобы включить разыменование с помощью оператора *, мы реализуем типаж Deref.
    assert_eq!(5, *y);

    // Rust фактически выполнил за кулисами такой код:
    // *(y.deref())
}
```

### Неявные разыменованные

```rust
fn hello(name: &str) {
    println!("Hello, {name}!");
}

fn main() {
    let m = MyBox::new(String::from("Rust"));
    hello(&m);
    // hello(&(*m)[..]);
}
```

Rust выполняет разыменованное приведение, когда находит типы и реализации типажей в трёх случаях:

- Из типа `&T` в тип `&U` когда верно `T: Deref<Target=U>`
- Из типа `&mut T` в тип `&mut U` когда верно `T: DerefMut<Target=U>`
- Из типа `&mut T` в тип `&U` когда верно `T: Deref<Target=U>`

### Drop

```rust
struct CustomSmartPointer {
    data: String,
}

impl Drop for CustomSmartPointer {
    fn drop(&mut self) {
        println!("Dropping CustomSmartPointer with data `{}`!", self.data);
    }
}

fn main() {
    let c = CustomSmartPointer {
        data: String::from("my stuff"),
    };
    let d = CustomSmartPointer {
        data: String::from("other stuff"),
    };
    println!("CustomSmartPointers created.");
}

// CustomSmartPointers created.
// Dropping CustomSmartPointer with data `other stuff`!
// Dropping CustomSmartPointer with data `my stuff`!
```

```rust

```

```rust

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"
