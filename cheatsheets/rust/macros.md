# Macros

[Назад][back]

```rust
macro_rules! five_times {
    ($x:expr) => (5 * $x);
}

fn main() {
    assert_eq!(25, five_times!(2 + 3));
}
```

```rust
trait Sqr {
    fn sqr(self) -> Self;
}

macro_rules! impl_sqr {
    ($t:ty) => (
        impl Sqr for $t {
            fn sqr(self) -> Self {
                self * self
            }
        }
    );
}

impl_sqr!(f32);
impl_sqr!(f64);

fn main() {
    let x: f32 = 3.0;
    let y: f64 = 4.0;
    println!("{}, {}", x.sqr(), y.sqr());
}
```

```rust

```

### blank

```rust

```

```rust

```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"