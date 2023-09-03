# Видимость

[Назад][back]

| Keyword        | Explanation                                                                                           |
|----------------|-------------------------------------------------------------------------------------------------------|
| pub            | делает элемент публичным                                                                              |
| pub(in _path_) | будет виден только в пределах заданного пути, `path` должен быть родительским или наследуемым модулем |
| pub(self)      | будет виден только в текущем модуле                                                                   |
| pub(super)     | будет виден только в родительском модуле                                                              |
| pub(crate)     | будет виден для всего текущего контейнера                                                             |

```rust
// Модуль по имени `my_mod`
mod my_mod {
    // Все элементы модуля по умолчанию являются приватными.
    fn private_function() {
        println!("вызвана `my_mod::private_function()`");
    }

    // Используем модификатор `pub`, чтобы сделать элемент публичным.
    pub fn function() {
        println!("вызвана `my_mod::function()`");
    }

    // Приватные элементы модуля доступны другим элементам
    // данного модуля.
    pub fn indirect_access() {
        print!("вызвана `my_mod::indirect_access()`, которая\n> ");
        private_function();
    }

    // Модули так же могут быть вложенными
    pub mod nested {
        pub fn function() {
            println!("вызвана `my_mod::nested::function()`");
        }

        #[allow(dead_code)]
        fn private_function() {
            println!("вызвана `my_mod::nested::private_function()`");
        }

        // Функции объявленные с использованием синтаксиса `pub(in path)` будет видна
        // только в пределах заданного пути.
        // `path` должен быть родительским или наследуемым модулем
        pub(in my_mod) fn public_function_in_my_mod() {
            print!("вызвана `my_mod::nested::public_function_in_my_mod()`, которая\n > ");
            public_function_in_nested()
        }

        // Функции объявленные с использованием синтаксиса `pub(self)` будет видна
        // только в текущем модуле
        pub(self) fn public_function_in_nested() {
            println!("вызвана `my_mod::nested::public_function_in_nested");
        }

        // Функции объявленные с использованием синтаксиса `pub(super)` будет видна
        // только в родительском модуле
        pub(super) fn public_function_in_super_mod() {
            println!("вызвана my_mod::nested::public_function_in_super_mod");
        }
    }

    pub fn call_public_function_in_my_mod() {
        print!("вызвана `my_mod::call_public_funcion_in_my_mod()`, которая\n> ");
        nested::public_function_in_my_mod();
        print!("> ");
        nested::public_function_in_super_mod();
    }

    // pub(crate) сделает функцию видимой для всего текущего контейнера
    pub(crate) fn public_function_in_crate() {
        println!("called `my_mod::public_function_in_crate()");
    }

    // Вложенные модули подчиняются тем же правилам видимости
    mod private_nested {
        #[allow(dead_code)]
        pub fn function() {
            println!("вызвана `my_mod::private_nested::function()`");
        }
    }
}

fn function() {
    println!("вызвана `function()`");
}

fn main() {
    // Модули позволяют устранить противоречия между элементами,
    // которые имеют одинаковые названия.
    function();
    my_mod::function();

    // Публичные элементы, включая те, что находятся во вложенном модуле,
    // доступны извне родительского модуля
    my_mod::indirect_access();
    my_mod::nested::function();
    my_mod::call_public_function_in_my_mod();

    // pub(crate) элементы можно вызвать от везде в этом же пакете
    my_mod::public_function_in_crate();
    
    // pub(in path) элементы могут вызываться только для указанного модуля
    // Ошибка! функция `public_function_in_my_mod` приватная
    //my_mod::nested::public_function_in_my_mod();
    // TODO ^ Попробуйте раскомментировать эту строку

    // Приватные элементы модуля не доступны напрямую,
    // даже если вложенный модуль является публичным:

    // Ошибка! функция `private_function` приватная
    //my_mod::private_function();
    // ЗАДАНИЕ ^ Попробуйте раскомментировать эту строку

    // Ошибка! функция `private_function` приватная
    //my_modmy::nested::private_function();
    // ЗАДАНИЕ ^ Попробуйте раскомментировать эту строку

    // Ошибка! Модуль `private_nested` является приватным
    //my_mod::private_nested::function();
    // ЗАДАНИЕ ^ Попробуйте раскомментировать эту строку
}
```

### Видимость структуры

```rust
mod my {
   // Публичная структура с публичным полем обобщённого типа `T`
    pub struct OpenBox<T> {
        pub contents: T,
    }

    // Публичная структура с приватным полем обобщённого типа `T`
    #[allow(dead_code)]
    pub struct ClosedBox<T> {
        contents: T,
    }

    impl<T> ClosedBox<T> {
        // Публичный конструктор
        pub fn new(contents: T) -> ClosedBox<T> {
            ClosedBox {
                contents: contents,
            }
        }
    }
}

fn main() {
    // Публичные структуры с публичными полеми могут быть созданы как обычно,
    let open_box = my::OpenBox { contents: "публичную информацию" };

    // а их поля доступны всем.
    println!("Открытая упаковка хранит: {}", open_box.contents);

    // Публичные структуры с приватными полями не могут быть созданы с использованием имён полей
    // Ошибка! `ClosedBox` имеет приватные поля
    //let closed_box = my::ClosedBox { contents: "классифицированную информацию" };
    // ЗАДАНИЕ ^ Попробуйте раскомментировать эту строку

    // Однако, структуры с приватными полями могут быть созданы с помощью
    // публичного конструктора
    let _closed_box = my::ClosedBox::new("классифицированную информацию");

    // нельзя получить доступ к приватным полям публичных структур.
    // Ошибка! Поле `contents` приватное
    //println!("Закрытая упаковка хранит: {}", _closed_box.contents);
    // ЗАДАНИЕ ^ Попробуйте раскомментировать эту строку
}
```

### use

Декларация `use` используется, чтобы связать полный путь с новым именем, что упрощает доступ.

```rust
use crate::deeply::nested::{
    my_first_function,
    my_second_function,
    AndATraitType
};

fn main() {
    my_first_function();
}
```

```rust
// Привязать путь `deeply::nested::function` к `other_function`.
use deeply::nested::function as other_function;

fn function() {
    println!("вызвана `function()`");
}

mod deeply {
    pub mod nested {
        pub fn function() {
            println!("вызвана `deeply::nested::function()`")
        }
    }
}

fn main() {
    // Упрощённый доступ к `deeply::nested::function`
    other_function();

    println!("Entering block");
    {
        // Эквивалентно `use deeply::nested::function as function`.
        // `function()` затенение собой внешнюю функцию.
        use deeply::nested::function;
        function();

        // у привязок `use` локальная область видимости. В данном случае
        // внешняя `function()` затенена только в этом блоке.
        println!("Leaving block");
    }

    function();
}
```

### super и self

```rust
fn function() {
    println!("вызвана `function()`");
}

mod cool {
    pub fn function() {
        println!("called `cool::function()`");
    }
}

mod my {
    fn function() {
        println!("вызвана `my::function()`");
    }
    
    mod cool {
        pub fn function() {
            println!("вызвана `my::cool::function()`");
        }
    }
    
    pub fn indirect_call() {
        // Давайте вызовем  все функции под названием `function` в этой области видимости!
        print!("вызвана `my::indirect_call()`, с помощью которой\n> ");
        
        // Ключевое слово `self` ссылается на область видимости текущего модуля. 
        // В нашем случае - модуль `my`.
        // Вызов `self::function()`, так же как и вызов `function()` дают одинаковый результат,
        // т.к они ссылаются на одну и ту же функцию.
        self::function();
        function();
        
        // Мы так же можем использовать ключевое слово `self`,
        // чтобы получить доступ к другим модулям внутри модуля `my`:
        self::cool::function();
        
        // Ключевое слово `super` ссылается на родительскую область видимости (вне модуля `my`).
        super::function();
        
        // Этим действием мы свяжем `cool::function` в области видимости *контейнера*.
        // В данном случае область видимости контейнера является самой дальней областью видимости.
        {
            use cool::function as root_function;
            root_function();
        }
    }
}

fn main() {
    my::indirect_call();
}
```

```rust
// in src/lib.rs
#[path = "sub"]
pub mod f32 {
    type F = f32;
    mod implementation;
    pub use implementation::*;
}

#[path = "sub"]
pub mod f64 {
    type F = f64;
    mod implementation;
    pub use implementation::*;
}

// in src/sub/implementation.rs
use super::F;

pub fn f(x: F) -> F {
    x + 1.0
}

// usage
library::f32::f(123.f32);
library::f64::f(123.f64);
```

### Иерархия файлов

```
.
├── my
│   ├── inaccessible.rs
│   └── nested.rs
├── my.rs
└── split.rs
```

#### split.rs

```rust
// Это объявление запустит поиск файла с именем `my.rs` и
// вставит его содержимое в модуль с именем `my` под текущей областью видимости
mod my;

fn function() {
    println!("вызвали `function()`");
}

fn main() {
    my::function();

    function();

    my::indirect_access();

    my::nested::function();
}
```

#### my.rs

```rust
// Точно так же, `mod inaccessible` и `mod nested` обнаружат файлы `nested.rs`
// и `inaccessible.rs`, и затем вставят их здесь в соответствующие модули

mod inaccessible;
pub mod nested;

pub fn function() {
    println!("вызвана `my::function()`");
}

fn private_function() {
    println!("вызывает `my::private_function()`");
}

pub fn indirect_access() {
    print!("вызвана `my::indirect_access()`, которая\n> ");

    private_function();
}
```

#### my/nested.rs

```rust
pub fn function() {
    println!("вызвана `my::nested::function()`");
}

#[allow(dead_code)]
fn private_function() {
    println!("вызвана `my::nested::private_function()`");
}
```

#### my/inaccessible.rs

```rust
#[allow(dead_code)]
pub fn public_function() {
    println!("вызвана `my::inaccessible::public_function()`");
}
```

[Назад][back]

[back]: <.> "Назад к оглавлению"
