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
struct QuitMessage;                       // unit struct
struct MoveMessage { x: i32, y: i32 }
struct WriteMessage(String);              // tuple struct
struct ChangeColorMessage(i32, i32, i32); // tuple struct

// или

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

### Result

```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

### Option

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

### Обобщение через перечисление

```rust
struct Rectangle {
    width: f64,
    length: f64,
}

struct Square {
    side: f64,
}

impl Rectangle {
    pub fn new(width: f64, length: f64) -> Option<Rectangle> {
        if width > 0. && length > 0. {
            Some( Rectangle { length, width } )
        } else {
            None
        }
    }

    pub fn area(&self) -> f64 {
        self.width * self.length
    }
}

impl Square {
    pub fn new(side: f64) -> Option<Square> {
        if side > 0. {
            Some( Square { side } )
        } else {
            None
        }
    }

    pub fn area(&self) -> f64 {
        self.side * self.side
    }
}

pub enum Figure {
    Rect(Rectangle),
    Sq(Square),
}

impl Figure {
    pub fn area(&self) -> f64 {
        match self {
            &Figure::Rect(ref r) => r.area(),
            &Figure::Sq(ref s) => s.area(),
        }
    }
}

fn main() {
    let rect1 = Figure::Rect(Rectangle::new(3., 5.).unwrap());
    let rect2 = Figure::Rect(Rectangle::new(4., 6.).unwrap());

    let sq1 = Figure::Sq(Square::new(8.).unwrap());
    let sq2 = Figure::Sq(Square::new(4.).unwrap());

    let figures = [&rect1, &rect2, &sq1, &sq2];

    for f in figures.iter() {
        println!("Площадь равна {}", f.area());
    }
}
```

### Деструктуризация перечислений

```rust
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

fn main() {
    let msg = Message::ChangeColor(0, 160, 255);

    match msg {
        Message::Quit => {
            println!("The Quit variant has no data to destructure.");
        }
        Message::Move { x, y } => {
            println!("Move in the x direction {x} and in the y direction {y}");
        }
        Message::Write(text) => {
            println!("Text message: {text}");
        }
        Message::ChangeColor(r, g, b) => {
            println!("Change the color to red {r}, green {g}, and blue {b}",)
        }
    }
}

// Change the color to red 0, green 160, and blue 255
```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"
