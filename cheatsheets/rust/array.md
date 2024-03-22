# Array

[Назад][back]

```rust
let one = [1, 2, 3];
let two: [u8; 3] = [1, 2, 3];
let blank_1 = [0; 3];
let blank_2: [u8; 3] = [0; 3];
let arrays = [one, two, blank_1, blank_2];
```

## Деструктуризация

```rust
#[rustfmt::skip]
fn main() {
    let triple = [0, -2, 3];
    println!("расскажи мне о {triple:?}");
    match triple {
        [0, y, z] => println!("первый элемент - это 0, y = {y} и z = {z}"),
        [1, ..]   => println!("первый элемент - это 1, остальные элементы игнорируются"),
        _         => println!("все элементы игнорируются"),
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