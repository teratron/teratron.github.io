# Generics

← [Назад][back]

## Обобщенные типы

```rust
struct Person<T> {
    id: T,        // идентификатор
    name: String, // имя
}

fn main() {
    // поле id представляет число
    let tom = Person {
        id: 245,
        name: "Tom".to_string(),
    };
    println!("id: {}  name: {}", tom.id, tom.name);

    // поле id представляет строку
    let bob = Person {
        id: String::from("fhe34u847"),
        name: "Bob".to_string(),
    };
    println!("id: {}  name: {}", bob.id, bob.name);
}
```

### Установка нескольких параметров типа

```rust
struct Point<T, S> {
    x: T,
    y: S,
}

fn main() {
    let some_point = Point { x: 3, y: 2.6 };
    println!("x={}  y={}", some_point.x, some_point.y);
}
```

### Обобщенные перечисления

```rust
enum DayTime<T> {
    Morning(T),
    Evening(T),
}

fn main() {
    let morning = DayTime::Morning("Доброе утро".to_string()); // параметр T представляет тип String
    if let DayTime::Morning(morning_value) = morning {
        println!("Morning: {}", morning_value);
    }

    let evening = DayTime::Evening(16); // параметр T представляет тип i32
    if let DayTime::Evening(evening_value) = evening {
        println!("Evening: {}", evening_value);
    }
}
```

### Обобщенные функции

```rust
fn receive<T>(item: T) -> T {
    item
}

fn main() {
    let result1 = receive(3);
    println!("{}", result1); // 3

    let result2 = receive("hello");
    println!("{}", result2); // hello
}
```

### Обобщенные методы

```rust
struct Person<T> {
    id: T,
    name: String,
}

impl<T> Person<T> {
    fn get_id(&self) -> &T {
        &self.id
    }
}

fn main() {
    let tom = Person {
        id: 1,
        name: String::from("Tom"),
    };
    let tom_id = tom.get_id();
    println!("{}", tom_id); // 1

    let bob = Person {
        id: String::from("subadmin3"),
        name: String::from("Bob"),
    };
    let bob_id = bob.get_id();
    println!("{}", bob_id); // subadmin3
}
```

### Реализация методов для конкретного типа

```rust
impl Person<u32> {
    fn compare_id(&self, user_id: u32) -> bool {
        self.id == user_id
    }
}

fn main() {
    let tom = Person {
        id: 1,
        name: String::from("Tom"),
    };
    let result1 = tom.compare_id(1);
    println!("result1: {}", result1); // result1: true

    let bob = Person {
        id: 4,
        name: String::from("Bob"),
    };
    let result2 = bob.compare_id(1);
    println!("result2: {}", result2); // result2: false
}
```

### Trait bound

```rust
trait Printer {
    fn print(&self);
}

struct Person {
    name: String,
    age: u8,
}

impl Printer for Person {
    fn print(&self) {
        println!("Person {}; age: {}", self.name, self.age);
    }
}

// fn display(printable: &impl Printer) {
//     printable.print();
// }

fn display<T: Printer>(printable: &T) {
    printable.print();
}

fn main() {
    let tom = Person {
        name: String::from("Tom"),
        age: 36,
    };
    display(&tom);
}
```

```rust
// Некопируемые типы.
struct Empty;
struct Null;

// Обобщённый типаж от `T`.
trait DoubleDrop<T> {
    // Определим метод для типа вызывающего объекта,
    // который принимает один дополнительный параметр `T` и ничего с ним не делает.
    fn double_drop(self, _: T);
}

// Реализация `DoubleDrop<T>` для любого общего параметра `T` и
// вызывающего объекта `U`.
impl<T, U> DoubleDrop<T> for U {
    // Этот метод получает право владения на оба переданных аргумента и
    // освобождает их.
    fn double_drop(self, _: T) {}
}

fn main() {
    let empty = Empty;
    let null  = Null;

    // Освободить `empty` и `null`.
    empty.double_drop(null);

    //empty;
    //null;
    // ^ TODO: Попробуйте раскомментировать эти строки.
}
```

### Выражение where

```rust
fn display<T>(printable: &T) where T: Printer {
    printable.print();
}
```

### Привязка нескольких trait

```rust
trait Printer {
    fn print(&self);
}

trait Sender {
    fn send(&self);
}

struct Message {
    text: String,
}

impl Printer for Message {
    fn print(&self) {
        println!("Сообщение: {}", self.text);
    }
}

impl Sender for Message {
    fn send(&self) {
        println!("Сообщение отправлено");
    }
}

fn process(obj: &(impl Printer + Sender)) {
    obj.print();
    obj.send();
}

fn main() {
    let mes = Message {
        text: String::from("Hello Rust"),
    };
    process(&mes);
}
```

### Применение нескольких параметров разных trait

```rust
fn process(obj1: &(impl Printer + Editor), obj2: &(impl Printer + Sender)) {
    // ...
}

// Вариант с оператором where
fn process<T, S>(obj1: &T, obj2: &S) where T: Printer + Editor, S: Printer + Sender {
    // ...
}
```

### Ограничения trait в обобщенных типах

```rust
struct Person<T: Sender + Printer> {
    device: T,
}

// или
struct Person<T> where T: Sender + Printer {
    device: T,
}

trait Printer {
    fn print(&self, message: &str);
}

trait Sender {
    fn send(&self, message: &str);
}

struct Smartphone {}

impl Printer for Smartphone {
    fn print(&self, message: &str) {
        println!("{}", message);
    }
}

impl Sender for Smartphone {
    fn send(&self, message: &str) {
        println!("Сообщение {} отправлено", message);
    }
}

fn main() {
    let iphone = Smartphone {};
    let tom = Person { device: iphone };

    tom.device.print("Hello Rust!");
    tom.device.send("Hello Rust!");
}
```

### Привязка trait в реализациях методов

```rust
struct Person<T> {
    device: T,
}

impl<T: Sender + Printer> Person<T> {
    fn send_message(&self, message: &str) {
        self.device.print(message);
        self.device.send(message);
    }
}

trait Printer {
    fn print(&self, message: &str);
}

trait Sender {
    fn send(&self, message: &str);
}

struct Smartphone {}

impl Printer for Smartphone {
    fn print(&self, message: &str) {
        println!("{}", message);
    }
}

impl Sender for Smartphone {
    fn send(&self, message: &str) {
        println!("Сообщение {} отправлено", message);
    }
}

fn main() {
    let iphone = Smartphone {};
    let tom = Person { device: iphone };
    tom.send_message("Hello Rust!");
}
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"
