--------------------------------------------------
Пример
--------------------------------------------------
package main

import "fmt"

func main() { var age int

election:
fmt.Print("Enter your age: ")
fmt.Scanln(&age)
if (age <= 17) { fmt.Print("You are not eligible to vote.\n")
goto election } else { fmt.Print("You are eligible to vote.")
} }


--------------------------------------------------
Пример
--------------------------------------------------
package main

import "fmt"

func main() { var a int = 10 // local variable definition

// do loop execution LOOP: for a < 20 { if a == 15 { // skip the iteration a++ goto LOOP } fmt.Printf("value of a: %d\n"
, a)
a++ } }

Результат:
value of a: 10 value of a: 11 value of a: 12 value of a: 13 value of a: 14 value of a: 16 value of a: 17 value of a: 18
value of a: 19