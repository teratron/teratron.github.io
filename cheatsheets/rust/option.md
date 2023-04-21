# Option

[Назад][back]

Тип `Option` кодирует очень распространённый сценарий, в котором значение может быть чем-то, а может быть ничем.

```rust
enum Option<T> {
    Some(T),
    None,
}
```

```rust
let some_number = Some(5);  // let some_number: Option<i32> = Some(5);
let some_char: Option<char> = Some('e');
let absent_number: Option<i32> = None;
```

```rust

```

### blank

```rust

```

```rust

```

### Оператор ?

```rust
fn last_char_of_first_line(text: &str) -> Option<char> {
    text.lines().next()?.chars().last()
}
```

[Назад][back]

[back]: <.> "Назад к оглавлению"