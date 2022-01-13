--------------------------------------------------
Оператор выбора для каналов (Select)
--------------------------------------------------
// В Go _select_ позволяет ожидать выполнения // многоканальных операций. Cочетание горутин // и каналов с оператором
select является // сильной стороной Go.

package main

import (
"time"
"fmt"
)

func main() {

    // В нашем примере будем делать выбор из двух каналов.
    c1 := make(chan string)
    c2 := make(chan string)

    // Каждый канал будет получать значение после некоторого
    // промежутка времени, например, для имитации
    // блокирования RPC операций в одновременно
    // выполняющихся горутинах.
    go func() {
        time.Sleep(time.Second * 1)
        c1 <- "one"
    }()
    go func() {
        time.Sleep(time.Second * 2)
        c2 <- "two"
    }()

    // Будем использовать `select` для ожидания обоих
    // значений одновременно и печати каждого по мере
    // получения.
    for i := 0; i < 2; i++ {
        select {
        case msg1 := <-c1:
            fmt.Println("received", msg1)
        case msg2 := <-c2:
            fmt.Println("received", msg2)
        }
    }

}

--------------------------------------------------
Неблокирующие операции с каналами
(Non-Blocking Channel Operations)
--------------------------------------------------
// Базовые операции отправки и приёма из каналов являются // блокирующими. Но можно использовать `select`
// с оператором `default` для реализации _неблокирующих_
// отправки, приёма и даже неблокирующего // многовариантного `select`.

package main

import "fmt"

func main() {

    messages := make(chan string)
    signals  := make(chan bool)

    // Здесь показан неблокирующий приём.
    // Если значение доступно
    // в `messages`, то `select` выберет вариант
    // `<-messages` с этим значением. Если нет,
    // то будет сразу выбран вариант `default`.
    select {
    case msg := <-messages:
        fmt.Println("received message", msg)
    default:
        fmt.Println("no message received")
    }

    // Неблокирующая отправка работает аналогично.
    msg := "hi"
    select {
    case messages <- msg:
        fmt.Println("sent message", msg)
    default:
        fmt.Println("no message sent")
    }

    // Можно использовать несколько `case` перед
    // оператором `default` для реализации многовариантного
    // неблокирующего выбора. Здесь показана попытка
    // неблокирующим способом получить
    // как `messages` так и `signals`.
    select {
    case msg := <-messages:
        fmt.Println("received message", msg)
    case sig := <-signals:
        fmt.Println("received signal", sig)
    default:
        fmt.Println("no activity")
    }

}

