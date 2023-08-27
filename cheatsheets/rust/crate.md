# crate

[Назад][back]

## Контейнеры

**Контейнер (crate)** — единица компиляции в языке Rust.

```shell
rustc --crate-type=lib rary.rs
ls lib*
# library.rlib
```

```rust
pub fn public_function() {
    println!("called rary's `public_function()`");
}

fn private_function() {
    println!("called rary's `private_function()`");
}

pub fn indirect_access() {
    print!("called rary's `indirect_access()`, that\n> ");

    private_function();
}
```

### extern

```shell
# Где library.rlib путь к скомпилированной библиотеке. Предположим, что
# она находится в той же директории:
rustc executable.rs --extern rary=library.rlib && ./executable
# вызвана `public_function()` библиотеки rary
# вызвана `indirect_access()` библиотеки rary, и в ней
# вызвана `private_function()` библиотеки rary
```

```rust
// Ссылка на `library`. Импортируем элементы, как модуль `rary`
extern crate rary;

fn main() {
    rary::public_function();

    // Ошибка! Функция `private_function` приватная
    //rary::private_function();

    rary::indirect_access();
}
```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"