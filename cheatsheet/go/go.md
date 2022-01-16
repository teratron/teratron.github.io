# go / goroutines

### Параллельное программирование

```go
package main

import "fmt"

func factorial(n int) {
    if n < 1 {
        fmt.Println("Invalid input number")
        return
    }
    result := 1
    for i := 1; i <= n; i++ {
        result *= i
    }
    fmt.Println(n, "-", result)
}

func main() { for i := 1; i < 7; i++ { go factorial(i)
} fmt.Scanln()        // ждем ввода пользователя fmt.Println("The End")
}

Результат:
2 - 2 1 - 1 4 - 24 The End 5 - 120

// со fmt.Scanln()
1 - 1 3 - 6 5 - 120 4 - 24 2 - 2 6 - 720 The End
```

### Вызовы анонимных функций

```go
package main

import "fmt"

func main() {
for i := 1; i < 7; i++ { go func(n int) { result := 1 for j := 1; j <= n; j++ { result *= j }
fmt.Println(
n, "-", result)
}(i)
}
fmt.Scanln()
fmt.Println("The End")
}
```

```go
func f(from string) {
    for i := 0; i < 3; i++ {
        fmt.Println(from, ":", i)
    }
}

func main() {
    f("direct")
    go f("goroutine")

    go func(msg string) {
        fmt.Println(msg)
    }("going")

    time.Sleep(time.Second)
    fmt.Println("done")
}
// direct : 0 direct : 1 direct : 2 goroutine : 0 going goroutine : 1 goroutine : 2 done
```
