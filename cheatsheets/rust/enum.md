# enum

[Назад][back]

## Перечисления

```rust
enum IpAddrKind {
    V4,
    V6,
}

// Значения перечислений
let four = IpAddrKind::V4;
let six = IpAddrKind::V6;

struct IpAddr {
    kind: IpAddrKind,
    address: String,
}

let home = IpAddr {
    kind: IpAddrKind::V4,
    address: String::from("127.0.0.1"),
};

let loopback = IpAddr {
    kind: IpAddrKind::V6,
    address: String::from("::1"),
};

fn route(ip_kind: IpAddrKind) {}

route(IpAddrKind::V4);
route(IpAddrKind::V6);
```

```rust
enum IpAddr {
    V4(u8, u8, u8, u8),
    V6(String),
}

let home = IpAddr::V4(127, 0, 0, 1);
let loopback = IpAddr::V6(String::from("::1"));
```

```rust
struct Ipv4Addr {
    // --snip--
}

struct Ipv6Addr {
    // --snip--
}

enum IpAddr {
    V4(Ipv4Addr),
    V6(Ipv6Addr),
}
```

```rust
// struct QuitMessage;                       // unit struct
// struct MoveMessage { x: i32, y: i32 }
// struct WriteMessage(String);              // tuple struct
// struct ChangeColorMessage(i32, i32, i32); // tuple struct

enum Message {
    Quit,  // пустой элемент без ассоциированных данных
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

impl Message {
    fn call(&self) {
        // method body would be defined here
    }
}

let m = Message::Write(String::from("hello"));
m.call();
```

### Перечисление Option и его преимущества перед Null-значениями

Тип `Option` кодирует очень распространённый сценарий, в котором значение может быть чем-то, а может быть ничем.

```rust
enum Option<T> {
    None,
    Some(T),
}
```

```rust
let some_number = Some(5);  // let some_number: Option<i32> = Some(5);
let some_char: Option<char> = Some('e');
let absent_number: Option<i32> = None;
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