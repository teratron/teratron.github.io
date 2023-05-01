# unsafe

[Назад][back]

- Разыменование сырого указателя
- Вызов небезопасной функции или небезопасного метода
- Доступ или изменение изменяемой статической переменной
- Реализация небезопасного типажа
- Доступ к полям в `union`

### Разыменование сырых указателей

В отличие от ссылок и умных указателей, сырые указатели:

- могут игнорировать правила заимствования и иметь неизменяемые и изменяемые указатели, или множество изменяемых указателей на одну и ту же область памяти
- не гарантируют что ссылаются на действительную память
- могут быть `null`
- не реализуют автоматическую очистку памяти

```rust
let mut num = 5;
// неизменяемый и изменяемый сырой указатель из ссылок.
let r1 = &num as *const i32;
let r2 = &mut num as *mut i32;

unsafe {
    println!("r1 is: {}", *r1);
    println!("r2 is: {}", *r2);
}
```

С помощью сырых указателей мы можем создать изменяемый указатель и неизменяемый указатель на одну и ту же область памяти и изменять данные с помощью изменяемого указателя, потенциально создавая эффект гонки данных.
Будьте осторожны!

### Вызов небезопасной функции или метода

Вызывая небезопасную функцию внутри блока `unsafe`, мы говорим, что прочитали документацию к этой функции и берём на себя ответственность за соблюдение её условий.

```rust
unsafe fn dangerous() {}

unsafe {
    dangerous(); // call to unsafe function
}
```

### Создание безопасных абстракций вокруг небезопасного кода

```rust
fn main() {
    let mut v = vec![1, 2, 3, 4, 5, 6];
    let r = &mut v[..];
    let (a, b) = r.split_at_mut(3);

    assert_eq!(a, &mut [1, 2, 3]);
    assert_eq!(b, &mut [4, 5, 6]);
}

use std::slice;

fn split_at_mut(values: &mut [i32], mid: usize) -> (&mut [i32], &mut [i32]) {
    let len = values.len();
    let ptr = values.as_mut_ptr();

    assert!(mid <= len);

    unsafe {(
        slice::from_raw_parts_mut(ptr, mid),
        slice::from_raw_parts_mut(ptr.add(mid), len - mid),
    )}
}
```

```rust
use std::slice;

let address = 0x01234usize;
let r = address as *mut i32;
let values: &[i32] = unsafe { slice::from_raw_parts_mut(r, 10000) };
```

### Использование extern функций для вызова внешнего кода

```rust
extern "C" {
    fn abs(input: i32) -> i32;
}

fn main() {
    unsafe {
        println!("Absolute value of -3 according to C: {}", abs(-3));
    }
}
```

### Получение доступа и внесение изменений в изменяемую статическую переменную

```rust
static mut COUNTER: u32 = 0;

fn add_to_count(inc: u32) {
    unsafe {
        COUNTER += inc;
    }
}

fn main() {
    add_to_count(3);

    unsafe {
        println!("COUNTER: {}", COUNTER);
    }
}
```

### Реализация небезопасных типажей

Используя `unsafe impl`, мы даём обещание поддерживать инварианты, которые компилятор не может проверить.

```rust
unsafe trait Foo {
    // methods go here
}

unsafe impl Foo for i32 {
    // method implementations go here
}

fn main() {}
```

```rust

```

```rust

```

```rust

```

[Назад][back]

[back]: <.> "Назад к оглавлению"
