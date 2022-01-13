--------------------------------------------------
—оздание и инициализаци€ структуры
--------------------------------------------------
type person struct { name string age int }

var tom person var tom person = person{"Tom", 23} var alice person = person{age: 23, name: "Alice"}

var tom = person{name: "Tom", age: 24} bob := person{name: "Bob", age: 31}

undefined := person{} // name - пуста€ строка, age - 0

--------------------------------------------------
ќбращение к пол€м структуры
--------------------------------------------------
package main

import "fmt"

type person struct { name string age int }

func main() { var tom = person{name: "Tom", age: 24} fmt.Println(tom.name)       // Tom fmt.Println(tom.age)        //
24

    tom.age = 38                   // измен€ем значение
    fmt.Println(tom.name, tom.age) // Tom 38

}

--------------------------------------------------
”казатели на структуры
--------------------------------------------------
package main

import "fmt"

type person struct { name string age int }

func main() { tom := person{name: "Tom", age: 22} var tomPointer *person = &tom

    tomPointer.age = 29
    fmt.Println(tom.age)        // 29

    (*tomPointer).age = 32
    fmt.Println(tom.age)        // 32

}

также:
var tom *person = &person{name:"Tom", age:23} var bob *person = new(person)

tom := person{name: "Tom", age: 22} var agePointer *int = &tom.age // указатель на поле tom.age
*agePointer = 35 // измен€ем значение пол€ fmt.Println(tom.age)            // 35

--------------------------------------------------
¬ложенные структуры
--------------------------------------------------
package main

import "fmt"

type contact struct { email, phone string }

type person struct { name string age int contactInfo contact }

func main() { var tom = person{ name: "Tom", age: 24, contactInfo: contact{ email: "tom@gmail.com", phone: "+1234567899"
, }, } tom.contactInfo.email = "supertom@gmail.com"

    fmt.Println(tom.contactInfo.email)      // supertom@gmail.com
    fmt.Println(tom.contactInfo.phone)      // +1234567899

}

--------------------------------------------------
’ранени€ ссылки на структуру того же типа
--------------------------------------------------
package main

import "fmt"

type node struct { value int next *node // next node - ! ошибка структура не может иметь поле, которое представл€ет тип
этой же структуры }

// рекурсивный вывод списка func printNodeValue(n *node) { fmt.Println(n.value)
if n.next != nil { printNodeValue(n.next)
} }

func main() { first  := node{value: 4} second := node{value: 5} third  := node{value: 6}

    first.next = &second
    second.next = &third

    var current *node = &first
    for current != nil {
        fmt.Println(current.value)
        current = current.next
    }

}
