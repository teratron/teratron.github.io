# From

← [Назад][back]

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

← [Назад][back]

[back]: <.> "Назад к оглавлению"