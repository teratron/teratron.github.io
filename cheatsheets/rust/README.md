# Rust

[Назад к перечню шпаргалок][back]

**[Generics](generics.md)** - обобщенные типы

**[Lifetime](lifetime.md)** - время жизни ссылки

**[Test](test.md)** - функции, которые проверяют, что не тестовый код работает ожидаемым образом

| Keyword             | Описание                                                                                                                                     |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| as                  | выполнить примитивное преобразование, уточнить конкретную характеристику, которую содержит объект, или переименовать элемент в выражении use |
| async               | вернуть Future вместо блокирования текущего потока                                                                                           |
| await               | приостановить выполнение до тех пор, пока не будет готов результат Future                                                                    |
| break               | немедленно выйти из цикла                                                                                                                    |
| const               | определить константу или неизменяемый сырой указатель                                                                                        |
| continue            | досрочно перейти к следующей итерации цикла                                                                                                  |
| crate               | в пути модуля ссылается на корень пакета                                                                                                     |
| dyn                 | динамическая отсылка к объекту характеристики                                                                                                |
| else                | ветвь для конструкций потока управления if и if let в случае, если никакая другая ветвь не была исполнена                                    |
| [enum](enum.md)     | определить перечисление                                                                                                                      |
| extern              | подключить внешнюю функцию или переменную                                                                                                    |
| false               | логический литерал «ложь»                                                                                                                    |
| [fn](fn.md)         | определить функцию или тип указателя на функцию                                                                                              |
| [for](for.md)       | перебор элементов итератора, реализация типажа или указание срока жизни более продолжительного периода                                       |
| [if](if.md)         | ветвление на основе результата условного выражения                                                                                           |
| [impl](impl.md)     | реализовать функциональность непосредственно или через типаж, методы                                                                         |
| in                  | часть синтаксиса определения цикла for                                                                                                       |
| let                 | объявить переменную                                                                                                                          |
| [loop](loop.md)     | безусловный (бесконечный) цикл                                                                                                               |
| [match](match.md)   | сопоставить значение с образцами                                                                                                             |
| mod                 | определить модуль                                                                                                                            |
| move                | заставить замыкание принять на себя владение всеми своими захватами                                                                          |
| mut                 | обозначить изменяемость для ссылок, сырых указателей или привязок к шаблонам                                                                 |
| pub                 | обозначить публичную доступность полей структур, блоков impl или модулей                                                                     |
| ref                 | привязка по ссылке                                                                                                                           |
| return              | возврат из функции                                                                                                                           |
| Self                | псевдоним для типа, который мы определяем или реализуем                                                                                      |
| self                | объект, содержащий этот метод, или текущий модуль                                                                                            |
| static              | глобальная переменная или время жизни на протяжении всего выполнения программы                                                               |
| [struct](struct.md) | определить структуру                                                                                                                         |
| super               | родительский модуль текущего модуля                                                                                                          |
| [trait](trait.md)   | определить типаж, интерфейс                                                                                                                  |
| true                | логический литерал «истина»                                                                                                                  |
| type                | определить псевдоним типа или ассоциированный тип                                                                                            |
| union               | определить union; является только ключевым словом при использовании в объявлении объединения                                                 |
| unsafe              | обозначить небезопасный код, функции, типажи или реализации                                                                                  |
| use                 | ввести объекты в область видимости                                                                                                           |
| where               | обозначить утверждения, которые ограничивают тип                                                                                             |
| [while](while.md)   | условный цикл, основанный на результате условного выражения                                                                                  |

### Ключевые слова, зарезервированные для будущего использования

- abstract
- become
- box
- do
- final
- macro
- override
- priv
- try
- typeof
- unsized
- virtual
- yield

### Соглашения по именованию сущностей

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

[https://doc.rust-lang.ru/book](https://doc.rust-lang.ru/book/title-page.html)
[https://metanit.com/rust](https://metanit.com/rust/)
[https://refactoring.guru/ru/design-patterns/rust](https://refactoring.guru/ru/design-patterns/rust)

[https://cheats.rs](https://cheats.rs/)
[https://lib.rs](https://lib.rs/)
[https://docs.rs](https://docs.rs/)

[Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"
