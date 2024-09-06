# Rust

← [Назад к перечню шпаргалок][back]

| Keyword        | Пример                                              | Описание                                          |
|----------------|-----------------------------------------------------|---------------------------------------------------|
| **let**        | `let thing: i32 = 100;`                             |                                                   |
|                | `let (part1, part2) = ("first", "second");`         |                                                   |
|                | `let shadowing_example = 123.4;`                    |                                                   |
|                | `let shadowing_example = shadowing_example as u32;` |                                                   |
|                | `let (part1, part2) = ("first", "second");`         |                                                   |
| **let mut**    | `let mut changing_thing = true;`                    |                                                   |
|                | `changing_thing = false;`                           |                                                   |
| **static**     | `static LANGUAGE: &str = "Rust";`                   | Изменяемая переменная с временем жизни `'static`. |
| **static mut** |                                                     |                                                   |
| **const**      | `const THRESHOLD: i32 = 10;`                        | Неизменяемая переменная.                          |
|                | `const WORDS: &'static str = "hello rust!";`        |                                                   |

## Типы

| Data Type           | Example                                             |
|---------------------|-----------------------------------------------------|
| i8                  | `let data: i8 = -100;`                              |
| i16                 | `let data: i16 = -32_000;`                          |
| i32                 | `let data: i32 = -2_147_483_648;`                   |
| i64                 | `let data: i64 = -9_223_372_036_854_775_808;`       |
| i128                | `let data: i128 = -170_141_183_460_469_231...;`     |
| isize               | `let data: isize = {i32 or i64, OS dependent};`     |
| u8                  | `let data: u8 = 255;`                               |
| u16                 | `let data: u16 = 65535;`                            |
| u32                 | `let data: u32 = 4_294_967_295;`                    |
| u64                 | `let data: u64 = 18_446_744_073_709_551_615;`       |
| u128                | `let data: u128 = 340_282_366_920_938_463...;`      |
| usize               | `let data: usize = {u32 or u64, OS dependent};`     |
| f32                 | `let data: f32 = 3.14;`                             |
| f64                 | `let data: f64 = 3.141592653589793238;`             |
| bool                | `let data: bool = true;`                            |
| char                | `let data: char = 'z';`                             |
| str                 | `let data: &str = "Hello, world!";`                 |
| [array](array.md)   | `let data: [i32; 5] = [1, 2, 3, 4, 5];`             |
| [tuple](tuple.md)   | `let data: (i32, f64, &str) = (500, 6.4, "hello");` |
| [slice](slice.md)   | `let data: &[i32] = &[1, 2, 3][..];`                |
| unit                | `let data: () = ();`                                |
| [function](fn.md)   | `fn main() {}`                                      |
| [struct](struct.md) | `struct User {name: String, age: u32}`              |
| [enum](enum.md)     | `enum Color {Red, Green, Blue}`                     |
| [trait](trait.md)   | `trait Summary {fn summarize(&self) -> String;}`    |
| reference           | `let data: &i32 = &1;`                              |
| Vec                 | `let data: Vec<i32> = vec![1, 2, 3];`               |
| String              | `let data: String = String::from("hello");`         |

| Smart Pointer         | Example                                                      | Explanation                                                                         |
|-----------------------|--------------------------------------------------------------|-------------------------------------------------------------------------------------|
| [Box](box.md)         | `let data: Box<i32> = Box::new(5);`                          | позволяет хранить данные в куче, а не в стеке.                                      |
| [Rc](rc.md)           | `let rc_type: Rc<i32> = Rc::new(5);`                         | умный указатель с подсчётом ссылок.                                                 |
| [Weak]()              | `let data: Weak<i32> = Weak::downgrade(&rc_type);`           |                                                                                     |
| [Arc]()               | `let data: Arc<i32> = Arc::new(5);`                          | атомарный подсчет ссылок.                                                           |
| [RefCell](refcell.md) | `let data: RefCell<i32> = RefCell::new(5);`                  | предоставляет единоличное владение данными.                                         |
| [Cell]()              | `let data: RefCell<Cell<i32>> = RefCell::new(Cell::new(5));` |                                                                                     |
| [Deref]()             |                                                              | изменяет поведение оператора разыменования `*`.                                     |
| [Drop]()              |                                                              | позволяет регулировать, что происходит, когда значение выйдет из области видимости. |

| Async Type | Example                                                   | Explanation |
|------------|-----------------------------------------------------------|-------------|
| Future     | `let future: Future = async { 5 };`                       |             |
| Stream     | `let stream: Stream = (0..5).into_stream();`              |             |
| Pin        | `let pin: Pin = Pin::new(future);`                        |             |
| JoinHandle | `let handle: JoinHandle = tokio::spawn(async {});`        |             |
| Poll       | `let poll: Poll = future.poll();`                         |             |
| Ready      | `let ready: Ready = Poll::Ready(5);`                      |             |
| Pending    | `let pending: Pending = Poll::Pending;`                   |             |
| Task       | `let task: Task = tokio::spawn(async {});`                |             |
| Context    | `let context: Context = &mut Context::from_waker(waker);` |             |
| Waker      | `let waker: Waker = noop_waker();`                        |             |

| Concurrency + Async     | Example                                                                                                                       |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| std::thread             | `thread::spawn(move ll {});`                                                                                                  |
| std::sync::mpsc         | `let (tx, rx) = mpsc::channel();`                                                                                             |
| std::thread::JoinHandle | `let handle = std::thread::spawn(move ll {}); handle.join();`                                                                 |
| tokio::task::JoinHandle | `let handle = tokio::spawn(async {}); handle.await.unwrap(); `                                                                |
| std::sync::Arc          | `let arc = Arc::new(vec![1, 2, 3]); let arc_clone = arc.clone();`                                                             |
| std::sync::Mutex        | `let mutex = Mutex::new(0); let mut guard = mutex.lock().unwrap(); *guard = 1;`                                               |
| tokio::sync::Mutex      | `let mutex = Mutex::new(0); let mut guard = mutex.lock().await; *guard = 1;`                                                  |
| std::sync::RwLock       | `let rwlock = RwLock::new(0); let mut guard = rwlock.write().unwrap(); *guard = 1;`                                           |
| std::sync::Barrier      | `let barrier = Arc::new(Barrier::new(3)); let b = barrier.clone(); spawn(move ll b.wait();)`                                  |
| std::sync::Condvar      | `let pair = Mutex::new((0, Condvar::new())); let pair = pair.clone(); spawn(move ll let &(ref lock, ref cvar) = &*pair;) ...` |
| std::sync::Once         | `static START: Once = Once::new(); START.call_once(ll initialize()); START.call_once(ll println!("This will not run"));`      |

## Документация

| Example  | Explanation                                                                                           |
|----------|-------------------------------------------------------------------------------------------------------|
| ///      | Комментарий документа внешней строки, используйте его для типов, признаков, функций.                  |
| //!      | Комментарий внутренней строки документа, в основном используемый в начале файла для модуля документа. |
| //       | Комментарий к строке. Используйте их для документирования потока кода или внутреннего устройства.     |
| /* … */  | Блочный комментарий.                                                                                  |
| /** … */ | Комментарий документа внешнего блока.                                                                 |
| /*! … */ | Комментарий документа внутреннего блока.                                                              |

- **[Видимость](visibility.md)**
- **[Контейнеры](crate.md)**
- **[Tests](tests.md)**
- **[Generics](generics.md)** - обобщенные типы.
- **[Closures](closures.md)** - замыкания - это анонимные функции.
- **[Lifetime](lifetime.md)**
- **[Макросы](macros.md)**
- **[Result](result.md)** - обработка потенциального сбоя.
- **[Option](option.md)**
- **[From](from.md)**
- **[Into](into.md)**
- **[Default](default.md)**
- **[Overload](overload.md)**

## Ключевые слова

| Keyword                | Описание                                                                                                                                       |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| as                     | выполнить примитивное преобразование, уточнить конкретную характеристику, которую содержит объект, или переименовать элемент в выражении `use` |
| async                  | вернуть `Future` вместо блокирования текущего потока                                                                                           |
| await                  | приостановить выполнение до тех пор, пока не будет готов результат `Future`                                                                    |
| break                  | немедленно выйти из цикла                                                                                                                      |
| const                  | определить константу или неизменяемый сырой указатель                                                                                          |
| continue               | досрочно перейти к следующей итерации цикла                                                                                                    |
| [crate](crate.md)      | в пути модуля ссылается на корень пакета                                                                                                       |
| dyn                    | динамическая отсылка к объекту характеристики                                                                                                  |
| else                   | ветвь для конструкций потока управления `if` и `if let` в случае, если никакая другая ветвь не была исполнена                                  |
| [enum](enum.md)        | определить перечисление                                                                                                                        |
| [extern](crate.md)     | подключить внешнюю функцию или переменную                                                                                                      |
| false                  | логический литерал «ложь»                                                                                                                      |
| [fn](fn.md)            | определить функцию или тип указателя на функцию                                                                                                |
| [for](for.md)          | перебор элементов итератора, реализация типажа или указание срока жизни более продолжительного периода                                         |
| [if](if.md)            | ветвление на основе результата условного выражения                                                                                             |
| [impl](impl.md)        | реализовать функциональность непосредственно или через типаж, методы                                                                           |
| in                     | часть синтаксиса определения цикла `for`                                                                                                       |
| let                    | объявить переменную                                                                                                                            |
| [loop](loop.md)        | безусловный (бесконечный) цикл                                                                                                                 |
| [match](match.md)      | сопоставить значение с образцами                                                                                                               |
| [mod](visibility.md)   | определить модуль                                                                                                                              |
| move                   | заставить замыкание принять на себя владение всеми своими захватами                                                                            |
| mut                    | обозначить изменяемость для ссылок, сырых указателей или привязок к шаблонам                                                                   |
| [pub](visibility.md)   | обозначить публичную доступность полей структур, блоков `impl` или модулей                                                                     |
| ref                    | привязка по ссылке                                                                                                                             |
| return                 | возврат из функции                                                                                                                             |
| Self                   | псевдоним для типа, который мы определяем или реализуем                                                                                        |
| self                   | объект, содержащий этот метод, или текущий модуль                                                                                              |
| static                 | глобальная переменная или время жизни на протяжении всего выполнения программы                                                                 |
| [struct](struct.md)    | определить структуру                                                                                                                           |
| [super](visibility.md) | родительский модуль текущего модуля                                                                                                            |
| [trait](trait.md)      | определить типаж, интерфейс                                                                                                                    |
| true                   | логический литерал «истина»                                                                                                                    |
| type                   | определить псевдоним типа или ассоциированный тип                                                                                              |
| union                  | определить `union`, является только ключевым словом при использовании в объявлении объединения                                                 |
| [unsafe](unsafe.md)    | обозначить небезопасный код, функции, типажи или реализации                                                                                    |
| [use](visibility.md)   | ввести объекты в область видимости                                                                                                             |
| where                  | обозначить утверждения, которые ограничивают тип                                                                                               |
| [while](while.md)      | условный цикл, основанный на результате условного выражения                                                                                    |

## Соглашения по именованию сущностей

| Item                    | Convention                                                 |
|-------------------------|------------------------------------------------------------|
| Crates                  | unclear                                                    |
| Modules                 | snake_case                                                 |
| Types                   | UpperCamelCase                                             |
| Traits                  | UpperCamelCase                                             |
| Enum variants           | UpperCamelCase                                             |
| Functions               | snake_case                                                 |
| Methods                 | snake_case                                                 |
| General constructors    | new or with_more_details                                   |
| Conversion constructors | from_some_other_type                                       |
| Macros                  | snake_case!                                                |
| Local variables         | snake_case                                                 |
| Statics                 | SCREAMING_SNAKE_CASE                                       |
| Constants               | SCREAMING_SNAKE_CASE                                       |
| Type parameters         | concise UpperCamelCase, usually single uppercase letter: T |
| Lifetimes               | short lowercase, usually a single letter: 'a, 'de, 'src    |
| Features                | unclear but see C-FEATURE                                  |

### as_, to_, into_

Преобразования должны предоставляться в виде методов со следующими префиксами имен:

| Префикс | Стоимость              | Владение                                                                                                                                     |
|---------|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| as_     | бесплатный, свободный  | заимствованный -> заимствованный (borrowed -> borrowed)                                                                                      |
| to_     | дорогой, ценный        | заимствованный -> заимствованный; заимствованный -> принадлежащий (типы, не являющиеся копиями); принадлежащий -> принадлежащий (типы копий) |
| into_   | изменяемый, переменная | принадлежащий -> принадлежащий (типы, не являющиеся копиями) (owned -> owned)                                                                |

Например:

- **str::as_bytes()** предоставляет `str` в виде фрагмента байтов UTF-8, который является бесплатным. Входные данные
  являются заимствованными `&str`, а выходные данные являются заимствованными `&[u8]`.
- **Path::to_str** выполняет дорогостоящую проверку UTF-8 на байты пути к операционной системе. Входные и выходные
  данные заимствованы. Было бы неправильно вызывать это `as_str` потому что этот метод имеет нетривиальные затраты во
  время выполнения.
- **str::to_lowercase()** выдает корректный в юникоде эквивалент в нижнем регистре `str`, который включает перебор
  символов строки и может потребовать выделения памяти. Входные данные являются заимствованными `&str`, а выходные -
  принадлежащими `String`.
- **f64::to_radians()** преобразует величину с плавающей запятой из градусов в радианы. Входные данные являются `f64`.
  Передача ссылки `&f64` не гарантируется, поскольку `f64` копирование обходится дешево. Вызов функции `into_radians`
  может ввести в заблуждение, поскольку входные данные не используются.
- **String::into_bytes()** извлекает базовую `Vec<u8>` часть `String`, которая является бесплатной. Он принимает права
  собственности на `String` и возвращает принадлежащий `Vec<u8>`.
- **BufReader::into_inner()** становится владельцем буферизованного считывателя и извлекает базовый считыватель, который
  является бесплатным. Данные в буфере удаляются.
- **BufWriter::into_inner()** получает право собственности на буферизованное средство записи и извлекает базовое
  средство записи, что требует потенциально дорогостоящей очистки любых буферизованных данных.

## Переменные

```rust
let age = 36;
age = 25;       // ошибка!
println!("Age = {}", age);
```

```rust
let mut age = 36;
println!("Начальное значение: {}", age);

age = 25;
println!("Конечное значение: {}", age);
```

```rust
let (a, b) = (b, a);

// или

std::mem::swap(&mut a, &mut b);
```

### Затенение переменных (shadowing)

То есть мы можем определить переменную с одним, и тем же именем и она будет скрывать (затенять)
определение предыдущей переменной с тем же именем.

```rust
let number = 10;
println!("number = {}", number);

let number = 15;
println!("number = {}", number);

let number = 254;
println!("number = {}", number);
```

Здесь мы получаем предупреждение о том, что не используем переменную `y`, но мы не получаем предупреждения о
неиспользовании переменной `_x`.

```rust
let _x = 5;
let y = 10;
```

## Format

```rust
let x = 42.1337;
let s = format!("{:.2}", x);
println!("{}", s); // 42.13
```

```rust
// Сырая строка
println!(r#"<a href="link.html">ссылка</a>"#); // "<a href="link.html">ссылка</a>"

// Экранирование
println!("<a href=\"link.html\">ссылка</a>"); // <a href="link.html">ссылка</a>
```

```rust
fn takes_u32(x: u32) {
    println!("u32: {x}");
}

fn takes_i8(y: i8) {
    println!("i8: {y}");
}
```

---

## CLI

- rust-src
- cargo
    * cargo new
    * cargo new name_project --lib
    * cargo init
    * cargo build (--> _target/debug_)
    * cargo build --release (--> _target/release_)
    * cargo run
    * cargo check
    * cargo update
    * cargo doc --open
- clippy
- rust-docs
- rust-std
- rustc
- rustfmt

**Cargo:**

- Мы можем создать проект с помощью `cargo new`.
- можно собирать проект, используя команду `cargo build`,
- можно одновременно собирать и запускать проект одной командой `cargo run`,
- можно собрать проект для проверки ошибок с помощью `cargo check`, не тратя время на кодогенерацию исполняемого файла,
- `cargo build` сохраняет результаты сборки не в директорию с исходным кодом, а в отдельный каталог _target/debug_.
- `cargo build --release` для его компиляции с оптимизацией. Данная команда создаёт исполняемый файл в папке
  _target/release_ в отличие от папки _target/debug_.

### Владение (Ownership) и его передача присваиванием (Move)

**Правила владения**

- Каждое значение в языке Rust имеет переменную, которая называется его владельцем.
- В каждый момент времени может существовать только один владелец.
- Если владелец выйдет из области видимости, значение будет отброшено.

**Ключевое правило:** Каждое значение имеет одного и только одного владельца-переменную:

- После операции присваивания переменная типа `String` перестает владеть своим бывшим значением, и ее нельзя больше
  использовать (Тип `String` не реализует `Copy`).
- Для простых типов (primitive types), значение копируется, а не передается, и для них многократное присваивание
  выглядит обычным образом (`Copy` реализован для простых скалярных типов, а также для неких кортежей `tuples`).

**Ссылки и заимствование** (References and Borrowing):

- Занять можно как для чтения `&`, так и для записи `&mut`.
- Занять для чтения (immutable borrow) можно сколько угодно раз в "области видимости переменной" (variable scope).
- Занять для записи (mutable borrow) — только один раз.
- Нельзя занимать одновременно для чтения и записи (все это похоже на read/write locks).
- Результат заимствования называется ссылкой (reference).

---

## Ссылки

- [https://doc.rust-lang.org/book](https://doc.rust-lang.org/book/)
- [https://doc.rust-lang.org/stable/rust-by-example](https://doc.rust-lang.org/stable/rust-by-example/)
- [https://doc.rust-lang.org/reference](https://doc.rust-lang.org/reference/)
- [https://doc.rust-lang.org/rustdoc](https://doc.rust-lang.org/rustdoc/)
- [https://doc.rust-lang.org/std](https://doc.rust-lang.org/std/)
- [https://doc.rust-lang.org/cargo](https://doc.rust-lang.org/cargo/)
- [https://rust-lang.github.io/api-guidelines](https://rust-lang.github.io/api-guidelines/)
- [https://rust-cli.github.io/book/tutorial](https://rust-cli.github.io/book/tutorial/)

---

- [https://doc.rust-lang.ru/book](https://doc.rust-lang.ru/book/title-page.html)
- [https://metanit.com/rust](https://metanit.com/rust/)
- [https://refactoring.guru/ru/design-patterns/rust](https://refactoring.guru/ru/design-patterns/rust)

---

- [https://cheats.rs](https://cheats.rs/)
- [https://lib.rs](https://lib.rs/)
- [https://docs.rs](https://docs.rs/)
- [https://programming-idioms.org/cheatsheet/Rust](https://programming-idioms.org/cheatsheet/Rust)
- []()
- []()
- []()

---

- [https://github.com/rust-unofficial/awesome-rust](https://github.com/rust-unofficial/awesome-rust)
- [https://github.com/Eddort/learn-rust-ru](https://github.com/Eddort/learn-rust-ru)

← [Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"
