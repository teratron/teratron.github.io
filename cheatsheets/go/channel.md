# chan

← [Назад][back]

### Каналы это типизированные "трубы".

```go
var ch chan int // nil
var ch chan int = make(chan int)
var ch = make(chan int)
ch := make(chan int)
```

Для передачи данных в канал или, наоборот, из канала применяется операция `<-` (направленная влево стрелка).

Например, передача данных в канал:

```go
ch <- v   // Послать v в канал ch.
v := <-ch // Получить из канала ch, и присвоить значение переменной v.
```

или

```go
ch <- 5   // В данном случае в канал посылается число 5
v := <-ch // Получение данных из канала в переменную
```

Как правило, отправителем данных является одна горутина, а получателем - другая горутина.

```go
func main() {
    messages := make(chan string)
    go func() {
        messages <- "ping"
    }()

    msg := <-messages
    fmt.Println(msg)  // ping
}
```

### Не буферизированные каналы

Для создания не буферизированного канала вызывается функция `make()` без указания емкости канала.

Если канал пустой, то горутина-получатель блокируется, пока в канале не окажутся данные. Когда горутина-отправитель
посылает данные, горутина-получатель получает эти данные и возобновляет работу.

Горутина-отправитель может отправлять данные только в пустой канал. Горутина-отправитель блокируется до тех пор, пока
данные из канала не будут получены.

```go
func main() {
    intCh := make(chan int) // 1. Запускается функция main. Она создает канал intCh и запускает горутину в виде анонимной функции.

    go func() {             // 3. Параллельно выполняется запущенная горутина в виде анонимной функции
        fmt.Println("Go routine starts")
        intCh <- 5          // блокировка, пока данные не будут получены функцией main
                            // В конце своего выполнения она отправляет даные через канал: intCh <- 5.
                            // Горутина блокируется, пока функция main не получит данные
    }()

    fmt.Println(<-intCh)    // получение данных из канала
                            // 2. Функция main продолжает выполняться и блокируется на строке fmt.Println(<-intCh), пока не будут получены данные.
                            // 4. Функция main получает отправленные данные, деблокируется и продолжает свою работу.
    fmt.Println("The End")
}
```

```go
func factorial(n int, ch chan int) {
    result := 1
    for i := 1; i <= n; i++ {
        result *= i
    }
    fmt.Println(n, "-", result)
    ch <- result     // отправка данных в канал
}

func main() { intCh := make(chan int)
    go factorial(5, intCh)  // вызов горутины
    fmt.Println(<-intCh)    // получение данных из канала
    fmt.Println("The End")
}

// 5 - 120
// 120
// The End
```

Стоит отметить, что отправителем данных должна быть отдельно запускаемая горутина. Например, если мы определим
отправление и получение данных через канал в самой функции main, то мы столкнемся с взаимоблокировкой:

```go
func main() {
    intCh := make(chan int)
    intCh <- 10 // функция main блокируется
    fmt.Println(<-intCh)
}
```

### Буферизированные каналы

Буферизированные каналы также создаются с помощью функции `make()`, только в качестве второго аргумента в функцию
передается емкость канала. Если канал пуст, то получатель ждет, пока в канале появится хотя бы один элемент.

При отправке данных горутина-отправитель ожидает, пока в канале не освободится место для еще одного элемента и
отправляет элемент, только тогда, когда в канале освобождается для него место.

```go
func main() {
    intCh := make(chan int, 3)
    intCh <- 10 
    intCh <- 3
    intCh <- 24

    fmt.Println(<-intCh)     // 10
    fmt.Println(<-intCh)     // 3
    fmt.Println(<-intCh)     // 24
}
```

В то же время в данном случае должно быть соответствие между количеством отправляемых и получаемых данных. Если в
функции main будет одновременно отправлено значений больше, чем вмещает канал, то функция заблокируется:

```go
func main() {
    intCh := make(chan int, 3)
    intCh <- 10

    fmt.Println(cap(intCh))     // 3
    fmt.Println(len(intCh))     // 1

    intCh <- 3
    intCh <- 24
    intCh <- 15  // блокировка - функция main ждет, когда освободится место в канале

    fmt.Println(<-intCh)
    fmt.Println("The End")
}
```

### Однонаправленные каналы

В Go можно определить канал, как доступный только для отправки данных или только для получения данных.

```go
var inCh chan<- int  // Определение канала только для отправки данных (write only)
var outCh <-chan int // Определение канала только для получения данных (read only)
```

```go
func factorial(n int, ch chan<- int) {
    result := 1
    for i := 1; i <= n; i++ {
        result *= i
    }
    ch <- result
}

func main() {
    intCh := make(chan int, 2)
    go factorial(5, intCh)
    fmt.Println(<-intCh)
    fmt.Println("The End")
}
```

### Возвращение канала

```go
func createChan(n int) chan int {
    ch := make(chan int)    // создаем канал

    //ch <- n       // мы столкнемся с блокировкой
    // следует вынести в отдельную горутину

    go func() {
        ch <- n     // отправляем данные в канал
    }()             // запускаем горутину
    return ch       // возвращаем канал
}

func main() { 
    fmt.Println("Start")
    // создание канала и получение из него данных
    fmt.Println(<-createChan(5)) // 5
    fmt.Println("End")
}
```

### Закрытие канала

```go
func main() {
    intCh := make(chan int, 3)
    intCh <- 10
    intCh <- 3 close(intCh)    // канал закрыт
    //intCh <- 24 // ошибка - канал уже закрыт

    for i := 0; i < cap(intCh); i++ {
         if val, opened := <-intCh; opened {
            fmt.Println(val)
         } else {
            fmt.Println("Channel closed!")
         }
    } 
}

// 10
// 3
// Channel closed!
```

### Синхронизация

```go

```

### Передача потоков данных

```go

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"