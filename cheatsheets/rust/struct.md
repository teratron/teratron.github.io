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

```rust

```

```rust

```

```rust

```

```rust

```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"
