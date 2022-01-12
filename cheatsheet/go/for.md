# for

[Назад][back]

```go
    for i := 1; i < 10; i++ {
        fmt.Println(i)
    }
```

```go
    var i = 1
    for ; i < 10; i++ {
        fmt.Println(i)
    }
```

```go
    // Аналог "while"
    var i = 1
    for i < 10 {
        fmt.Println(i)
        i++
    }
```

```go
    // Бесконечный цикл
    for {
    }
```

```go
    i := 0
    for fmt.Println("start"); i < 5; i++ {
        fmt.Println(i)
    }
```

```go
    for i := 0; i < 5; fmt.Println("after") {
        i++
        continue
    }
```

```go
    var v int = 39
    for v != 0 {
         fmt.Println(v)
         if v > 16 {
             v /= 4
         } else {
             v /= 2
         }
    }
```

```go
    ch := make(chan int, 1)
    i := 0
    for ch <- 1; i < 5; i++ {
        fmt.Println(i)
    }
```

### Range

```go
    for range "ticks" {
        fmt.Println("tick") // Print 5 time "tick"
    }
```

```go
    var users = [3]string{"Tom", "Alice", "Kate"}

    for index, value := range users {
        fmt.Println(index, value)
    }

    for index := range users {
        fmt.Println(index)
    }

    for _, value := range users{
        fmt.Println(value)
    }
```

```go
    a := [...]string{"one", "two", "three", "four", "five"}

    for i := range a {
        a[4] = "six"
        fmt.Printf("%d: %s\n", i, a[i])
    }
```

```go
    nums := &[...]string{"one", "two", "three"}

    for idx, num := range *nums {
        fmt.Printf("%d: %s\n", idx, num)
    }
    // 0: one
    // 1: two
    // 2: three

    for idx, num := range nums {
        fmt.Printf("%d: %s\n", idx, num)
    }
    // 0: one
    // 1: two
    // 2: three
```

### Map

```go
    m := map[string]int{"one": 1, "two": 2, "three": 3}

    for range m {
         fmt.Println("loop")
    }

    for key, value := range m {
         fmt.Printf("key: %q, value: %d\n", key, value)
    }

    for key, _ := range m {
        fmt.Printf("key: %q\n", key)
    }

    for key := range m {
         fmt.Printf("key: %q\n", key)
    }

    for _ = range m {
        fmt.Println("b")
    }

    for _, _ = range m {
        fmt.Println("c")
    }
```

```go

```

```go

```
[Назад][back]

[back]: <https://teratron.github.io/cheatsheet/go/> "Назад к оглавлению"
