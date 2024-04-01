# defer, panic, recover

← [Назад][back]

**Panic** - это встроенная функция, которая останавливает обычный поток контроля и начинает паниковать. Когда
функция `F` вызывает `panic`, выполнение `F` останавливается, все отложенные (`defer`) функции в `F` выполняются
нормально, а затем `F` возвращается к своему вызывающему. Для вызывающей стороны `F` ведет себя как вызов `panic`.

**Recover** - это встроенная функция, которая восстанавливает контроль над паникующими goroutine.
`Recover` полезна только внутри отложенных (`defer`) функций. Во время обычного выполнения, вызов `recover` вернет `nil`
и не будет иметь никакого другого эффекта. Если текущая goroutine вызывает `panic`, вызов `recover` захватит значение,
переданное `panic`, и возобновит нормальное выполнение.

```go
func main() {
   f()
   fmt.Println("Returned normally from f.")
}

// Функция f откладывает функцию, которая вызывает recover и печатает восстановленное значение (если оно не равно nil).
func f() {
   defer func() {
      if r := recover(); r != nil {
         fmt.Println("Recovered in f", r)
      }
   }()
   fmt.Println("Calling g.")
   g(0)
   fmt.Println("Returned normally from g.")
}

// Функция g принимает int i и паникует, если i больше 3, иначе она вызывает себя с аргументом i + 1.
func g(i int) {
   if i > 3 {
      fmt.Println("Panicking!")
      panic(fmt.Sprintf("%v", i))
   }
   defer fmt.Println("Defer in g", i)
   fmt.Println("Printing in g", i)
   g(i + 1)
}
// Calling g.
// Printing in g 0
// Printing in g 1
// Printing in g 2
// Printing in g 3
// Panicking!
// Defer in g 3
// Defer in g 2
// Defer in g 1
// Defer in g 0
// Recovered in f 4
// Returned normally from f.
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"