# Into

[Назад][back]

```rust
pub trait Into<T>: Sized {
    fn into(self) -> T;
}
```

```rust
impl<T, U> Into<U> for T
where
    U: From<T>,
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

```rust
fn is_hello<T: Into<Vec<u8>>>(s: T) {
   let bytes = b"hello".to_vec();
   assert_eq!(bytes, s.into());
}

let s = "hello".to_string();
is_hello(s);
```

[Назад][back]

[back]: <.> "Назад к оглавлению"