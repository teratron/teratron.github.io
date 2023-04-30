# if

[Назад][back]

## Управления потоком

```rust
let number = 5;

if number == 3 {
    println!("number равно 3");
} else if number == 4 {
    println!("number равно 4");
} else if number == 5 {
    println!("number равно 5");
} else {
    println!("значение number не известно");
}
```

### Компактное управление потоком выполнения с if let

```rust
let condition = true;
let number = if condition { 4 } else { 5 };
println!("number = {}", number);    // number = 4
```

```rust
let a = 5;
let b = 2;
let operation = 2;

let number = if operation == 1 { a + b }
else if operation == 2 { a - b }
else {  a * b };
println!("number = {}", number);    // number = 3
```

```rust
let config_max = Some(3u8);
if let Some(max) = config_max {
    println!("The maximum is configured to be {}", max);
}

// тоже самое

let config_max = Some(3u8);
match config_max {
    Some(max) => println!("The maximum is configured to be {}", max),
    _ => (),
}
```

```rust
let mut count = 0;
if let Coin::Quarter(state) = coin {
    println!("State quarter from {:?}!", state);
} else {
    count += 1;
}

// тоже самое

let mut count = 0;
match coin {
    Coin::Quarter(state) => println!("State quarter from {:?}!", state),
    _ => count += 1,
}
```

```rust
fn foo(_: i32, y: i32) {
    println!("This code only uses the y parameter: {}", y);
}

fn main() {
    foo(3, 4);
}
```

```rust
let s = Some(String::from("Hello!"));

if let Some(_s) = s {
    println!("found a string");
}

println!("{:?}", s);
```

```rust

```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"
