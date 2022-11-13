# interface

[Назад][back]

### Неявные интерфейсы

В LogicProvider ничего не объявлено, чтобы указать, что он соответствует интерфейсу Logic.
Это означает, что клиент может легко заменить своего поставщика логики в будущем, если этот поставщик логики содержит
все наборы методов базового интерфейса (Logic).

```go
type Logic interface {
    Process(data string) string
}

type LogicProvider struct {}

func (lp LogicProvider) Process(data string) string {
    // business logic
}

type Client struct {
    L Logic
}

func(c Client) Program() {
    // получить данные откуда-то
    c.L.Process(data)
}

func main() {
    c := Client {
        L: LogicProvider{},  
    }
    c.Program()
}
```

[Назад][back]

[back]: <.> "Назад к оглавлению"