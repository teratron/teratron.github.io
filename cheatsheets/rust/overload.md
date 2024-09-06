# Overload

← [Назад][back]

---

```rust
pub struct FooArgs {
    a: f64,
    b: i32,
}

impl Default for FooArgs {
    fn default() -> Self {
        FooArgs { a: 1.0, b: 1 }
    }
}

impl From<()> for FooArgs {
    fn from(_: ()) -> Self {
        Self::default()
    }
}

impl From<f64> for FooArgs {
    fn from(a: f64) -> Self {
        Self {
            a,
            ..Self::default()
        }
    }
}

impl From<i32> for FooArgs {
    fn from(b: i32) -> Self {
        Self {
            b,
            ..Self::default()
        }
    }
}

impl From<(f64, i32)> for FooArgs {
    fn from((a, b): (f64, i32)) -> Self {
        Self { a, b }
    }
}

pub fn foo<A>(arg_like: A) -> f64
where
    A: Into<FooArgs>,
{
    let args = arg_like.into();
    args.a * (args.b as f64)
}

fn main() {
    println!("{}", foo(()));
    println!("{}", foo(5.0));
    println!("{}", foo(-3));
    println!("{}", foo((2.0, 6)));
}
```

```rust
enum MixedInts {
    SmallInt(i32),
    TwoSmallInts(i32, i32),
}

trait IntoMixedInts {
    fn into(self) -> MixedInts;
}

impl MixedInts {
    fn new<A>(args: A) -> MixedInts
        where A: IntoMixedInts
    {
        args.into()
    }
}

impl IntoMixedInts for i32 {
    fn into(self) -> MixedInts {
        MixedInts::SmallInt(self)
    }
}

impl IntoMixedInts for (i32, i32) {
    fn into(self) -> MixedInts {
        MixedInts::TwoSmallInts(self.0, self.1)
    }
}

fn main() {
    let x = MixedInts::new(2i32);
    let y = MixedInts::new((2i32, 2i32));
}
```

```rust
enum MixedInts {
    SmallInt(i32),
    TwoSmallInts(i32, i32),
}

impl MixedInts {
    fn new<A>(args: A) -> MixedInts
        where A: Into<MixedInts>
    {
        args.into()
    }
}

impl From<i32> for MixedInts {
    fn from(a: i32) -> MixedInts {
        MixedInts::SmallInt(a)
    }
}

impl From<(i32, i32)> for MixedInts {
    fn from((a, b): (i32, i32)) -> MixedInts {
        MixedInts::TwoSmallInts(a, b)
    }
}

fn main() {
    let x = MixedInts::new(2i32);
    let y = MixedInts::new((2i32, 2i32));
}
```

```rust
#[derive(PartialEq, Eq, Debug)]
enum MixedInts {
    SmallInt(i32),
    TwoSmallInts(i32, i32),
}

impl From<i32> for MixedInts {
    fn from(n: i32) -> Self {
        MixedInts::SmallInt(n)
    }
}

impl From<(i32, i32)> for MixedInts {
    fn from((a, b): (i32, i32)) -> Self {
        MixedInts::TwoSmallInts(a, b)
    }
}

fn main() {
    let x: MixedInts = 2_i32.into();
    assert_eq!(x, MixedInts::SmallInt(2));

    let y: MixedInts = (2_i32, 2_i32).into();
    assert_eq!(y, MixedInts::TwoSmallInts(2, 2));
}
```

```rust

```

```rust

```

```rust

```

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"