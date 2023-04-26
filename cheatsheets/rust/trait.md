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

### Наследование trait

```rust
use std::f32::consts::PI;

trait Shape {
    // У любой формы можно посчитать площадь.
    fn area(&self) -> f32;
}

trait HasAngles: Shape {
    // У любой фигуры с углами можно посчитать количество углов.
    fn angles_count(&self) -> i32;
}

struct Rectangle {
    x: f32,
    y: f32,
}

// Прямоугольник является формой.
impl Shape for Rectangle {
    fn area(&self) -> f32 {
        self.x * self.y
    }
}

// Прямоугольник является фигурой с углами.
impl HasAngles for Rectangle {
    fn angles_count(&self) -> i32 {
        4
    }
}
```

### Полиморфизм

- **Статический полиморфизм** требует, чтобы при компиляции программы было известно, какие конкретные типы используются
  в каждом обобщённом контексте. Имея эту информацию компилятор проводит, так называемую, мономорфизацию. Когда одна
  обобщённая сущность превращается в несколько сущностей с конкретными типами, используемыми в них. При этом размер
  исполняемого файла раздувается и мы теряем возможность подменять наследника в процессе выполнения программы. Взамен
  получаем более высокую скорость выполнения, так как компилятору известны конкретные типы и адреса функций для каждой
  ситуации, а следовательно, он может применять больше оптимизаций.

- **Динамический полиморфизм** работает посредством динамической диспетчеризации. При этом мы не знаем конкретного типа
  объекта и для получения адреса его методов в памяти используем дополнительную информацию — таблицу функций. Её
  содержимое зависит от того, какой конкретный тип скрывается за абстрактным указателем. Такой подход не раздувает
  исполняемый файл и позволяет подменять реализацию в процессе выполнения программы. Но при этом мы жертвуем частью
  производительности — для вызова метода нам придётся сначала прочитать его адрес из памяти, что значительно затрудняет
  оптимизацию программы на этапе компиляции.

Пример статического полиморфизма:

```rust
// Принимаем что угодно, реализующее трейт Shape.
fn areas_sum(shape1: impl Shape, shape2: impl Shape) -> f32 {
    shape1.area() + shape2.area()
}

fn foo(rectangle: Rectangle, circle: Circle) {
    // Можем передать две разные фигуры.
    let sum = areas_sum(rectangle, circle);
}
```

Пример динамического полиморфизма:

```rust
// Принимаем что угодно, реализующее трейт Shape.
// В этот раз принимаем не сами объекты, а ссылки на них,
// так как не зная конкретный тип объекта, мы не знаем и его размер,
// а следовательно, не сможем выделить для него место на стеке.
fn areas_sum(shape1: &dyn Shape, shape2: &dyn Shape) -> f32 {
    shape1.area() + shape2.area()
}

fn foo(rectangle: Rectangle, circle: Circle) {
    // Можем передать ссылки на две разные фигуры.
    let sum = areas_sum(&rectangle, &circle);
}
```

[Назад][back]

[back]: <.> "Назад к оглавлению"
