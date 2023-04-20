# fn

[Назад][back]

## Функция

```rust
fn main() {
    hello();
    welcome();
}

fn hello() {
    print!("Hello! ");
}

fn welcome() {
    println!("Welcome to Rust World!");
}
```

```rust
fn main() {
    show_user("Tom", 36);
}

fn show_user(name: &str, age: i32) {
    println!("Информация о пользователе");
    println!("Имя: {}", name);
    println!("Возраст: {}", age);
}
```

### Изменение значения параметра

```rust
fn main() {
    square(5);
    square(6);
}

fn square(mut n: i32) {
    n = n * n;
    println!("Квадрат числа равен {}", n);
}
```

### blank

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

### return

В этом случае возвращаемое значение указывается после оператора `return`, а затем идет точка с запятой:

```rust
fn main() {
    let num1 = sum(2, 3);       // 5
    println!("num1 = {}", num1);
}

fn sum(a: i32, b: i32) -> i32 {
    return a + b;   // возвращение значение
}
```

[Назад][back]

[back]: <.> "Назад к оглавлению"