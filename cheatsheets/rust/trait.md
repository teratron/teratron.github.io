# trait

[Назад][back]

## Интерфейс

```rust
struct Person {
    name: String,
    age: u8,
}

trait Printer {
    fn print_multiple_copies(&self, times: u8);
}

impl Printer for Person {
    fn print_multiple_copies(&self, mut number: u8) {
        while number > 0 {
            println!("Person {}; age: {}", self.name, self.age);
            number -= 1;
        }
    }
}

fn main() {
    let tom = Person {
        name: String::from("Tom"),
        age: 36,
    };
    tom.print_multiple_copies(3);
}
```

### Реализация по умолчанию

```rust
trait Printer {
    fn print(&self) {
        println!("Вывод данных на консоль...");
    }
}

struct Person {
    name: String,
    age: u8,
}

struct Message {
    text: String,
}

impl Printer for Person {
    // переопределяем реализацию метода
    fn print(&self) {
        println!("Person {}; age: {}", self.name, self.age);
    }
}

impl Printer for Message {
    // используем реализацию метода по умолчанию
}

fn main() {
    let tom = Person {
        name: String::from("Tom"),
        age: 36,
    };
    tom.print();

    let hello = Message {
        text: String::from("Hello Rust!"),
    };
    hello.print();
}
```

### Обращение к методам trait внутри trait

```rust
struct Person {
    name: String,
    age: u8,
}

trait Printer {
    fn preview(&self) -> String;
    fn print(&self) {
        println!("{}", self.preview());
    }
}

impl Printer for Person {
    fn preview(&self) -> String {
        format!("Person {}; age: {}", self.name, self.age)
    }
}

fn main() {
    let tom = Person {
        name: String::from("Tom"),
        age: 36,
    };
    tom.print();
}
```

### Trait как тип параметров

```rust
struct Person {
    name: String,
    age: u8,
}

struct Message {
    title: String,
}

trait Printer {
    fn print(&self);
}

impl Printer for Person {
    fn print(&self) {
        println!("Person {}; age: {}", self.name, self.age)
    }
}

impl Printer for Message {
    fn print(&self) {
        println!("Message: {}", self.title)
    }
}

fn display(printable: &impl Printer) {
    printable.print();
}

fn main() {
    let tom = Person {
        name: String::from("Tom"),
        age: 36,
    };
    let hello = Message {
        title: String::from("Hello Rust"),
    };

    display(&tom);
    display(&hello);
}
```

### Trait как тип результата

```rust
struct TextMessage {
    address: String,
    text: String,
}

trait Sender {
    fn send(&self);
}

impl Sender for TextMessage {
    fn send(&self) {
        println!(
            "Сообщение '{}' отправлено на адрес {}",
            self.text, self.address
        );
    }
}

fn create_message(addr: &str) -> impl Sender {
    TextMessage {
        address: String::from(addr),
        text: String::from("Привет, ты спишь?"),
    }
}

fn main() {
    let text_message = create_message("sam@gmail.com");
    text_message.send();
}
```

Однако, эта возможность имеет существенные ограничения.
Так, функция должна возвращать объекты только одного и того же типа.
Например, в следующем случае мы получим ошибку на этапе компиляции:

```rust
struct VoiceMessage {
    address: String,
}

struct TextMessage {
    address: String,
    text: String,
}

trait Sender {
    fn send(&self);
}

impl Sender for VoiceMessage {
    fn send(&self) {
        println!("Голосовое сообщение отправлено на адрес {}", self.address);
    }
}

impl Sender for TextMessage {
    fn send(&self) {
        println!(
            "Сообщение '{}' отправлено на адрес {}",
            self.text, self.address
        );
    }
}

fn create_message(addr: &str, text_message: bool) -> impl Sender {
    if text_message {
        TextMessage {
            address: String::from(addr),
            text: String::from("Привет, ты спишь?"),
        }
    } else {
        // Ошибка: if and else have incompatible types
        VoiceMessage {
            address: String::from(addr),
        }
    }
}

fn main() {
    let text_message = create_message("sam@gmail.com", true);
    text_message.send();

    let voice_message = create_message("bob@gmail.com", false);
    voice_message.send();
}
```

[Назад][back]

[back]: <.> "Назад к оглавлению"
