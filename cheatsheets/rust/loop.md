# loop

[Назад][back]

## Безусловный (бесконечный) цикл

```rust
let mut n = 1;
loop {
    println!("n = {}", n);
    n = n + 1;
    if n == 10 {
        break;
    }
}
println!("Конец программы");
```

### Возвращение значения из цикла loop

```rust
let mut num = 1;
let result = loop {
    if num == 4 {
        break num * 2;
    }
    num = num + 1;
};
println!("result = {}", result);    // result = 8   
```

```rust

```

```rust

```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"