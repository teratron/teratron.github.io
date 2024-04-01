# Slice

← [Назад][back]

---

| Срез           | Эквивалент               |
|----------------|--------------------------|
| numbers[..]    | [1, 2, 3, 4, 5, 6, 7, 8] |
| numbers[..3]   | [1, 2, 3 ]               |
| numbers[..=3]  | [1, 2, 3, 4]             |
| numbers[1..]   | [2, 3, 4, 5, 6, 7, 8]    |
| numbers[1..3]  | [2, 3]                   |
| numbers[1..=3] | [2, 3, 4]                |

```rust
fn main(){
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8];
    let slice = &numbers[1..5];         // получим слайс

    println!("slice[0]={}", slice[0]);  // выведем первый элемент слайса

    // перебор слайса
    for num in slice{
        print!("{} ", num)              // 2 3 4 5
    }

    println!("slice[0]={}", slice[0]);  // выведем первый элемент слайса
}
```

## &mut

```rust
fn main(){
    let mut numbers = [1, 2, 3, 4, 5, 6, 7, 8];
    let slice = &mut numbers[1..5];     // получим слайс

    // изменим первый элемент слайса
    slice[0] = 81;
    println!("slice[0]={}", slice[0]);  // slice[0]=81

    // перебор измененного слайса
    for num in slice{
        print!("{} ", num)              // 81 3 4 5
    }

    // перебор начального массива
    for num in numbers{
        print!("{} ", num)              // 1 81 3 4 5 6 7 8
    }
}
```

## String slice

```rust
fn main(){
    // Фактически здесь переменная `message`
    // представляла строковый слайс или тип `&str`.
    let message = "hello world!";
    let slice: &str = &message[..5];    // часть строки с начала до 6 символа
     
    println!("slice={}", slice);        // hello
    println!("message={}", message);    // hello world!
}
```

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"