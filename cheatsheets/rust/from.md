# From

← [Назад][back]

---

```rust
pub trait From<T>: Sized {
    fn from(value: T) -> Self;
}
```

```rust
impl<T, U> From<T> for U
where
   T: Into<U>,
```

```rust
use std::fs;
use std::io;
use std::num;

enum CliError {
    IoError(io::Error),
    ParseError(num::ParseIntError),
}

impl From<io::Error> for CliError {
    fn from(error: io::Error) -> Self {
        CliError::IoError(error)
    }
}

impl From<num::ParseIntError> for CliError {
    fn from(error: num::ParseIntError) -> Self {
        CliError::ParseError(error)
    }
}

fn open_and_parse_file(file_name: &str) -> Result<i32, CliError> {
    let mut contents = fs::read_to_string(&file_name)?;
    let num: i32 = contents.trim().parse()?;
    Ok(num)
}
```

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
            a: a,
            ..Self::default()
        }
    }
}

impl From<i32> for FooArgs {
    fn from(b: i32) -> Self {
        Self {
            b: b,
            ..Self::default()
        }
    }
}

impl From<(f64, i32)> for FooArgs {
    fn from((a, b): (f64, i32)) -> Self {
        Self { a: a, b: b }
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

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"