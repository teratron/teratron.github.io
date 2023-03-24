# Rust

[Назад к перечню шпаргалок][back]

| Keyword                      | Описание        |
|------------------------------|-----------------|
| **[impl](impl.md)**          | Методы          |
| **[trait](trait.md)**        | Интерфейс       |
| **[Generics ](generics.md)** | Обобщенные типы |

### Соглашения по именованию сущностей

| Тип                 | Общедоступный       | Внутренний          |
|---------------------|---------------------|---------------------|
| Пакеты (директории) | lower_with_under    | —                   |
| Модули (файлы)      | lower_with_under.py | —                   |
| Классы              | CapWords            | —                   |
| Функции и методы    | lower_with_under()  | _lower_with_under() |
| Константы           | ALL_CAPS_UNDER      | _ALL_CAPS_UNDER     |

## Переменные

```rust
fn main() {
    let age = 36;
    age = 25;       // ошибка!
    println!("Age = {}", age);
}
```

```rust
fn main() {
    let mut age = 36;
    println!("Начальное значение: {}", age);

    age = 25;
    println!("Конечное значение: {}", age);
}
```

### Затенение переменных (shadowing)

То есть мы можем определить переменную с одним, и тем же именем и она будет скрывать (затенять)
определение предыдущей переменной с тем же именем.

```rust
fn main() {
    let number = 10;
    println!("number = {}", number);

    let number = 15;
    println!("number = {}", number);

    let number = 254;
    println!("number = {}", number);
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

```rust

```

```rust

```

[https://metanit.com/rust/](https://metanit.com/rust/)

[Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"