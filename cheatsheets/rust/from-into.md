# From / Into

[Назад][back]

```rust
// impl<T, U> From<T> for U
// where
//    T: Into<U>

impl<f32, f64> From<f32> for f64
where
    T: Into<f64>
{
    fn from() -> f64 {
        0.3
    }
}
```

```rust
struct Wrapper<T>(Vec<T>);
impl<T> From<Wrapper<T>> for Vec<T> {
    fn from(w: Wrapper<T>) -> Vec<T> {
        w.0
    }
}
```

```rust
struct Wrapper<T>(Vec<T>);
impl<T> Into<Vec<T>> for Wrapper<T> {
    fn into(self) -> Vec<T> {
        self.0
    }
}
```

## From

```rust
pub trait From<T>: Sized {
    fn from(value: T) -> Self;
}
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

## Into

```rust
pub trait Into<T>: Sized {
    fn into(self) -> T;
}
```

```rust
fn is_hello<T: Into<Vec<u8>>>(s: T) {
   let bytes = b"hello".to_vec();
   assert_eq!(bytes, s.into());
}

let s = "hello".to_string();
is_hello(s);
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

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"