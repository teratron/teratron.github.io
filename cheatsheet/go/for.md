# for

[Назад][back]

```go
    for i := 1; i < 5; i++ {
        fmt.Println(i)
    }
```

```go
    var i = 1
    for ; i < 5; i++ {
        fmt.Println(i)
    }
```

```go
    ch := make(chan int, 1)
    i := 0
    for ch <- 1; i < 3; i++ {
        fmt.Println(i)
    }
```

```go
    i := 0
    for fmt.Println("start"); i < 3; i++ {
        fmt.Println(i)
    }
    // start
    // 0
    // 1
    // 2
```

```go
    for i := 0; i < 3; fmt.Println("after") {
        i++
        continue
    }
    // 0
    // after
    // 1
    // after
    // 2
    // after
```

### While

```go
    var i = 1
    for i < 10 {
        fmt.Println(i)
        i++
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
    // 39
    // 9
    // 4
    // 2
    // 1
```

### Бесконечный цикл

```go
    for {
    }
```

### Range

```go
    for range "ticks" {
        fmt.Println("tick") // Print 5 time "tick"
    }
```

```go
    for i, c := range "ticks" {
        fmt.Printf("%d: %q\n", i, c)
    }
    // 0: 't'
    // 1: 'i'
    // 2: 'c'
    // 3: 'k'
    // 4: 's'
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
    // nil map
    var m map[string]int
    for range m {
        fmt.Println("foo")
    }
```

### Channel

```go
    ch := make(chan int)
    go func() {
        time.Sleep(3 * time.Second)
        ch <- 1
        time.Sleep(2 * time.Second)
        ch <- 2
        time.Sleep(time.Second)
        close(ch)
    }()
    fmt.Printf("before:\t\t%s\n", time.Now())

    for v := range ch {
        fmt.Printf("tick #%d:\t%s\n", v, time.Now())
    }
    fmt.Printf("after:\t\t%s\n", time.Now())

    // before:       2009-11-10 23:00:00 +0000 UTC m=+0.000000001
    // tick #1:      2009-11-10 23:00:03 +0000 UTC m=+3.000000001
    // tick #2:      2009-11-10 23:00:05 +0000 UTC m=+5.000000001
    // after:        2009-11-10 23:00:06 +0000 UTC m=+6.000000001
```

```go
    ch := make(chan int)
    close(ch)
    for range ch {
        fmt.Println("tick")
    }
    fmt.Println("done!")

    // It prints done! to stdout.
```

```go
    // nil channel
    ch := make(chan int)
    for range ch {
    }
    
    var ch chan int
    for range ch {
    }
    
    // fatal error: all goroutines are asleep - deadlock!
```

```go

```

```go

```

```go

```

```go

```

[Назад][back]

[back]: <https://teratron.github.io/cheatsheet/go/> "Назад к оглавлению"
