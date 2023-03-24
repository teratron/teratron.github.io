# Generics

[Назад][back]

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

[Назад][back]

[back]: <.> "Назад к оглавлению"