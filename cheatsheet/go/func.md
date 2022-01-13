--------------------------------------------------
�������������� ���������� ����������
--------------------------------------------------
package main

import "fmt"

func add(numbers ...int) { var sum = 0 for _, number := range numbers { sum += number } fmt.Println("sum = ", sum)
}

func main() { add(1, 2, 3)        // sum = 6 add(1, 2, 3, 4)     // sum = 10

    // ��� ����
    add([]int{1, 2, 3}...)
    add([]int{1, 2, 3, 4}...)
    var nums = []int{5, 6, 7, 2, 3}
    add(nums...)

}

--------------------------------------------------
��� �������
--------------------------------------------------
package main

import "fmt"

func add(x, y int) int { return x + y }

func multiply(x, y int) int { return x * y }

func display(message string) { fmt.Println(message) }

func main() { f := add // ��� ��� var f func(int, int) int = add fmt.Println(f(3, 4))          // 7

    f = multiply                  // ������ ���������� f ��������� �� ������� multiply
    fmt.Println(f(3, 4))          // 12

    // f = display                // ������, ��� ��� ������� display ����� ��� func(string)

    var f1 func(string) = display // ���� 
    f1("hello")

}

--------------------------------------------------
������� ��� ��������� ������ �������
--------------------------------------------------
package main

import "fmt"

func add(x, y int) int { return x + y }

func multiply(x, y int) int { return x * y }

func action(n1, n2 int, operation func(int, int) int) { result := operation(n1, n2)
fmt.Println(result)
}

func main() { action(5, 6, add)       // 11 action(5, 6, multiply)  // 30 }

--------------------------------------------------
������� ��� ��������� ������ �������
--------------------------------------------------
package main

import "fmt"

func add(x int, y int) int { return x + y }

func subtract(x int, y int) int { return x - y }

func multiply(x int, y int) int { return x * y }

func selectFn(n int) func(int, int) int { if n == 1 { return add } else if n == 2 { return subtract } else { return
multiply } }

func main() { f := selectFn(1)
fmt.Println(f(3, 4))        // 7

    f = selectFn(3)
    fmt.Println(f(3, 4))        // 12

}

--------------------------------------------------
��������� �������
--------------------------------------------------
package main

import "fmt"

func main() { f := func(x, y int) int { return x + y } fmt.Println(f(3, 4))        // 7 fmt.Println(f(6, 7))        //
13 }

--------------------------------------------------
��������� ������� ��� �������� �������
--------------------------------------------------
package main

import "fmt"

func action(n1, n2 int, operation func(int, int) int) { result := operation(n1, n2)
fmt.Println(result)
}

func main() { action(10, 25, func(x, y int) int { return x + y })    // 35 action(5, 6, func(x, y int) int { return x *
y })    // 30 }

--------------------------------------------------
��������� ������� ��� ��������� �������
--------------------------------------------------
package main

import "fmt"

func selectFn(n int) func(int, int) int { if n == 1 { return func(x, y int) int { return x + y } } else if n == 2 {
return func(x, y int) int { return x - y } } else { return func(x, y int) int { return x * y } } }

func main() { f := selectFn(1)
fmt.Println(f(2, 3))        // 5 fmt.Println(f(4, 5))        // 9 fmt.Println(f(7, 6))        // 13 }

--------------------------------------------------
������ � ���������
--------------------------------------------------
package main

import "fmt"

func square() func() int { var x int = 2 return func() int { x++ return x * x } }

func main() { f := square()
fmt.Println(f())        // 9 fmt.Println(f())        // 16 fmt.Println(f())        // 25 }

--------------------------------------------------
����������� �������
--------------------------------------------------
package main

import "fmt"

func factorial(n uint) uint { if n == 0 { return 1 } return n * factorial(n - 1)
}

func fibbonachi(n uint) uint { if n == 0 { return 0 } if n == 1 { return 1 } return fibbonachi(n - 1) + fibbonachi(n -
2)
}

func main() { fmt.Println(factorial(4))   // 24 fmt.Println(factorial(5))   // 120 fmt.Println(factorial(6))   // 720

    fmt.Println(fibbonachi(4))  // 3
    fmt.Println(fibbonachi(5))  // 5
    fmt.Println(fibbonachi(6))  // 8

}

--------------------------------------------------
������������� ����������
--------------------------------------------------
func swap(x, y string) (string, string) { return y, x }

func main() { a, b := swap("hello", "world")
fmt.Println(a, b)
}

--------------------------------------------------
����������� ������������ ��������
--------------------------------------------------
func split(sum int) (x, y int) { x = sum * 4 / 9 y = sum - x return }

--------------------------------------------------
��������� �������� ����������
--------------------------------------------------
package main

import "fmt"

func main() {  
x := 1 fmt.Println(x)     // ������� 1

    {
        fmt.Println(x) // ������� 1
        x := 2
        fmt.Println(x) // ������� 2
    }

    fmt.Println(x)     // ������� 1 (�����, ���� ����� ���� 2)

}

--------------------------------------------------
������
--------------------------------------------------
� ������ ������� - ��� ����������� ��������������� �������� �����. ��������: �� �������������� ���������� (���� package)
� ��� �����, ����� �����-�� ������� �������� �� ���� ������ �� �������, ������� ���������� � ��� � ���������� � �������
������. ����� �� �������� ����� ���� �� ��������� ������� � ������� ��� ��������� ��� ������� ������������ (���������� �
��������� �����).

package mylib

type someFunc func() bool

var (
Apple someFunc = func() bool { return true } Dog someFunc = func() bool { return false }
)

func Consume(f someFunc) { f()
}

����� ����� ������� ����������� �� ������ ������� ������� Consume() ������� ���� ����� ������ �������, � ������ ��
�������, ������� �� ��� ����������.

package main

import "mylib"

func main() { externalFunc := func() bool { return true }

    mylib.Consume(externalFunc) // fail
    var extF mylib.someFunc	// fail

    mylib.Consume(mylib.Apple)	// success

}

����� �������, ������� ���� ���������� �������������� ��������� �����, �� �������� ��������� ����������. �� ������
������� - ��� ����������� ������� ��� ����� ��������. ��������, � ��� ���-�� ���� ���������� ���������� ��������� � �
����� ������������ �� ������ ������, ����� �� ������ ���� � �� �� ����� ���, �� ������ ��������� ������ ��� ����������
������� � �������� ������, � ����� ����������� �������.

--------------------------------------------------
QFunc
--------------------------------------------------
�������, ������� ��������� �������� � ���������� ���� ��� ���������� (�������)

type QFunc func(fn interface{}, params ...interface{}) QFunc

func SaveUser(w http.ResponseWriter, rq *http.Request) { u := &User{} q.Err(ErrorHandler(w))(ioutil.ReadAll, rq.Body)(
json.Unmarshal, q.V, u)(u.Validate)(u.Save)(ok, w).Run()
}
