# while

← [Назад][back]

## Условный цикл

```rust
let mut n = 1;
while n < 10 {
    println!("n = {}", n);
    n = n + 1;
}
println!("Конец программы");
```

```rust
let mut i = 1;
let mut j = 1;
while i < 10 {
    while j < 10 {
        print!("{}\t", i * j);
        j = j + 1;
    }
    println!();
    i = i + 1;
    j = 1;
}
```

```rust

```

```rust

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"