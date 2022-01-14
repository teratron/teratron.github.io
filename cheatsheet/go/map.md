# map

[Назад][back]

### Карты - ассоциативный массив или хэш

```go
    var people map[string]int
```

```go
    var people = map[string]int{
        "Tom": 1,
        "Bob": 2,
        "Sam": 4,
        "Alice": 8
    }
    fmt.Println(people)           // map[Tom:1 Bob:2 Sam:4 Alice:8]
    fmt.Println(people["Alice"])  // 8
    fmt.Println(people["Bob"])    // 2
    people["Bob"] = 32
    fmt.Println(people["Bob"])    // 32
```

### Проверка наличия элемента

```go
    if val, ok := people["Tom"]; ok {
        fmt.Println(val)
    }
```

### Перебор элементов

```go
    for key, value := range people {
        fmt.Println(key, value)
    }
```

### Создание

```go
    // создаёт пустую хеш-таблицу
    people := make(map[string]int)
```

### Добавление элементов

```go
    var people = map[string]int{"Tom": 1, "Bob": 2}
    people["Kate"] = 128
    fmt.Println(people)     // map[Tom:1  Bob:2  Kate:128]
```

### Удаление элементов

```go
    var people = map[string]int{"Tom": 1, "Bob": 2, "Sam": 8}
    delete(people, "Bob")
    fmt.Println(people)     // map[Tom:1  Sam:8]
```

### Ёмкость хеш-таблиц

Можно устанавливать ёмкость при создании хеш-таблиц, но нельзя применять к ним функцию `cap()`.

```go
    m := make(map[string]int, 99)
    cap(m) // ошибка
```

[Назад][back]

[back]: <../.> "Назад к оглавлению"