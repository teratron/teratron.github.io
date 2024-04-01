# interface

← [Назад][back]

Интерфейсы представляют абстракцию поведения других типов.
Интерфейсы позволяют определять функции, которые не привязаны к конкретной реализации.

```go
type Vehicle interface {
    move()
}

type Car struct {}
type Aircraft struct {}

func (c Car) move() {
    fmt.Println("Автомобиль едет")
}

func (a Aircraft) move() {
    fmt.Println("Самолет летит")
}

func drive(vehicle Vehicle) {
    vehicle.move()
}

func main() {
    var tesla Vehicle = Car{}      // или tesla := Car{}
    var boing Vehicle = Aircraft{} // или boing := Aircraft{}

    tesla.move()
    boing.move()
    // или
    drive(tesla)
    drive(boing)
}
```

### Соответствие интерфейсу

Чтобы тип данных соответствовал интерфейсу, он должен реализовать все методы этого интерфейса.

```go
type Stream interface {
    read() string
    write(string)
    close()
}

func writeToStream(stream Stream, text string) {
    stream.write(text)
}

func closeStream(stream Stream) {
    stream.close()
}

type File struct {
    text string
}

type Folder struct {}

// реализация методов для типа *File
func (f *File) read() string {
    return f.text
}

func (f *File) write(message string) {
    f.text = message
    fmt.Println("Запись в файл строки", message)
}

func (f *File) close() {
    fmt.Println("Файл закрыт")
}

// релизация методов для типа *Folder
func (f *Folder) close() {
    fmt.Println("Папка закрыта")
}

func main() {
    myFile   := &File{}
    myFolder := &Folder{}

    writeToStream(myFile, "hello world")
    closeStream(myFile)
    //closeStream(myFolder)     // Ошибка: тип *Folder не реализует интерфейс Stream
    myFolder.close()            // Так можно

    myFile2 := File{}           // нужно *File
    //closeStream(myFile2)      // ! Ошибка: тип File не соответствует интерфейсу Stream
}
```

### Реализация нескольких интерфейсов

```go
type Reader interface {
    read()
}

type Writer interface {
    write(string)
}

func writeToStream(writer Writer, text string) {
    writer.write(text)
}

func readFromStream(reader Reader) {
    reader.read()
}

type File struct {
    text string
}

func (f *File) read() {
    fmt.Println(f.text)
}

func (f *File) write(message string) {
    f.text = message
    fmt.Println("Запись в файл строки", message)
}

func main() {
    myFile := &File{}
    writeToStream(myFile, "hello world")
    readFromStream(myFile)
}
```

### Вложенные интерфейсы

```go
type Reader interface {
    read()
}

type Writer interface {
    write(string)
}

type ReaderWriter interface {
    Reader
    Writer
}

func writeToStream(writer Writer, text string) {
    writer.write(text)
}

func readFromStream(reader Reader) {
    reader.read()
}

type File struct {
    text string
}

func (f *File) read() {
    fmt.Println(f.text)
}

func (f *File) write(message string) {
    f.text = message
    fmt.Println("Запись в файл строки", message)
}

func main() {
    myFile := &File{}
    writeToStream(myFile, "hello world")
    readFromStream(myFile)
    writeToStream(myFile, "lolly bomb")
    readFromStream(myFile)
}
```

### Полиморфизм

Полиморфизм представляет способность принимать многообразные формы.

```go
type Vehicle interface {
    move()
}

type Car struct { model string}
type Aircraft struct { model string}

func (c Car) move() {
    fmt.Println(c.model, "едет")
}

func (a Aircraft) move() {
    fmt.Println(a.model, "летит")
}

func main() {
    tesla  := Car{"Tesla"}
    volvo  := Car{"Volvo"}
    boeing := Aircraft{"Boeing"}

    vehicles := [...]Vehicle{tesla, volvo, boeing}
    for _, vehicle := range vehicles {
        vehicle.move()
    }
}

// Tesla едет
// Volvo едет
// Boeing летит
```

### Неявные интерфейсы

В `LogicProvider` ничего не объявлено, чтобы указать, что он соответствует интерфейсу `Logic`.
Это означает, что клиент может легко заменить своего поставщика логики в будущем, если этот поставщик логики содержит
все наборы методов базового интерфейса `Logic`.

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

← [Назад][back]

[back]: <.> "Назад к оглавлению"