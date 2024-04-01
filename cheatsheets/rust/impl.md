# impl

← [Назад][back]

## Методы

```rust
struct Person {
    name: String,
    age: u8,
}

impl Person {
    fn display(&self) {
        println!("Name: {}  Age: {}", &self.name, &self.age);
    }
}

fn main() {
    let tom = Person {
        name: "Tom".to_string(),
        age: 36,
    };
    tom.display();

    let bob = Person { name: "Bob".to_string(), age: 41 };
    bob.display();
}
```

### Передача параметров в метод

```rust
struct Person {
    name: String,
    age: u8,
}

impl Person {
    fn say_hello(&self, other: &Person, hour: u8) {
        if hour < 16 {
            println!("Добрый день, {}!", other.name);
        } else {
            println!("Добрый вечер, {}!", other.name);
        }
    }
    
    fn display(&self) {
        println!("Name: {}  Age: {}", self.name, self.age);
    }
}

fn main() {
    let tom = Person { name: "Tom".to_string(), age: 36 };
    let bob = Person { name: "Bob".to_string(), age: 41 };

    tom.say_hello(&bob, 12);
    bob.say_hello(&tom, 19);
}
```

### Возвращение результата из метода

```rust
struct Person {
    name: String,
    age: u8,
}

impl Person {
    fn is_older(&self, other: &Person) -> bool {
        self.age > other.age
    }
}

fn main() {
    let tom = Person {
        name: "Tom".to_string(),
        age: 36,
    };
    let bob = Person {
        name: "Bob".to_string(),
        age: 41,
    };
    let is_older = tom.is_older(&bob);

    if is_older {
        println!("{} старше чем {}", tom.name, bob.name);
    } else {
        println!(
            "{} младше чем {} или одного возраста с ним",
            tom.name, bob.name
        );
    }
}
```

### Изменение текущего объекта в методе

```rust
struct Person {
    name: String,
    age: u8,
}

impl Person {
    fn change_age(&mut self, age: u8) {
        self.age = age;
    }
}

fn main() {
    let mut tom = Person {
        name: "Tom".to_string(),
        age: 36,
    };

    println!("До изменения: {}", tom.age); // 36
    tom.change_age(22);
    println!("После изменения: {}", tom.age); // 22
}
```

### Ассоциированные функции

**Ассоциированные функции** в отличие от методов относятся не к конкретному объекту структуры, а ко всей структуре в
целом.
В некоторых языках программирования есть похожая концепция - **статические методы**.

```rust
struct Person {
    name: String,
    age: u8,
}

impl Person {
    fn create(user_name: &str, user_age: u8) -> Person {
        Person {
            name: String::from(user_name),
            age: user_age,
        }
    }
}

fn main() {
    let tom = Person::create("Tom", 36);
    println!("Name: {}  Age: {}", tom.name, tom.age);

    let bob = Person::create("Bob", 41);
    println!("Name: {}  Age: {}", bob.name, bob.age);
}
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"
