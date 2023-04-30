# struct

[Назад][back]

## Структура

```rust
struct Point {
    x: f64,
    y: f64,
}
```

```rust
struct Point(f64, f64);
```

```rust
struct Node<T> {
    value: T,
    children: Vec<Node<T>>,
}
```

```rust
struct Foo {
    x: usize
}

impl Foo {
    pub fn new(x: usize) -> Self {
        Foo { x }
    }

    pub fn x<'a>(&'a self) -> &'a usize {
        &self.x
    }

    pub fn bar(&mut self) {
        self.x += 1;
    }
}
```

### Простое наследование

```rust
struct Rectangle {
    width: f64,
    length: f64,
}

impl Rectangle {
    pub fn new(width: f64, length: f64) -> Option<Rectangle> {
        if width > 0. && length > 0. {
            Some( Rectangle { length, width } )
        } else {
            None
        }
    }

    pub fn area(&self) -> f64 {
        self.width * self.length
    }
}

pub struct Square {
    rectangle: Rectangle,
}

impl Square {
    pub fn new(side: f64) -> Option<Square> {
        if side > 0. {
            Some( Square { rectangle: Rectangle { length: side, width: side } } )
        } else {
            None
        }
    }

    pub fn area(&self) -> f64 {
        self.rectangle.area()
    }
}
```

### Деструктуризация структуры

```rust
struct Point {
    x: i32,
    y: i32,
}

fn main() {
    let p = Point { x: 0, y: 7 };
    let Point { x: a, y: b } = p;
    // или
    let Point { x, y } = p;
    assert_eq!(0, a);
    assert_eq!(7, b);
}
```

```rust
let ((feet, inches), Point { x, y }) = ((3, 10), Point { x: 3, y: -10 });
```

```rust

```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"
