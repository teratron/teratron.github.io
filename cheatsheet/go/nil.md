# nil

[Назад][back]

### nil Can Represent Zero Values of Many Types

In Go, nil can represent zero values of the following kinds of types:

- pointer types (including type-unsafe ones).
- map types.
- slice types.
- function types.
- channel types.
- interface types.

### Predeclared nil Has Not a Default Type

```go
	// There must be sufficient information for
	// compiler to deduce the type of a nil value.
	_ = (*struct{})(nil)
	_ = []int(nil)
	_ = map[int]bool(nil)
	_ = chan string(nil)
	_ = (func())(nil)
	_ = interface{}(nil)
```

```go
	// These lines are equivalent to the above lines.
	var _ *struct{} = nil
	var _ []int = nil
	var _ map[int]bool = nil
	var _ chan string = nil
	var _ func() = nil
	var _ interface{} = nil
```

```go
	// This following line doesn't compile.
	var _ = nil
```

### Predeclared nil Is Not a Keyword in Go

```go
	nil := 123
	fmt.Println(nil) // 123
```

```go
	// The following line fails to compile,
	// for nil represents an int value now
	// in this scope.
	var _ map[string]int = nil
```

### The Sizes of Nil Values With Types of Different Kinds May Be Different

```go
package main

import (
	"fmt"
	"unsafe"
)

func main() {
	var p *struct{} = nil
	fmt.Println( unsafe.Sizeof( p ) ) // 8

	var s []int = nil
	fmt.Println( unsafe.Sizeof( s ) ) // 24

	var m map[int]bool = nil
	fmt.Println( unsafe.Sizeof( m ) ) // 8

	var c chan string = nil
	fmt.Println( unsafe.Sizeof( c ) ) // 8

	var f func() = nil
	fmt.Println( unsafe.Sizeof( f ) ) // 8

	var i interface{} = nil
	fmt.Println( unsafe.Sizeof( i ) ) // 16
}
```

### Two Nil Values of Two Different Types May Be Not Comparable

```go
	// Compilation failure reason: mismatched types.
	var _ = (*int)(nil) == (*bool)(nil)         // error
	var _ = (chan int)(nil) == (chan bool)(nil) // error
```

```go
	// The code lines in the following example all compile okay.
	type IntPtr *int
	// The underlying of type IntPtr is *int.
	var _ = IntPtr(nil) == (*int)(nil)
```

```go
	// Every type in Go implements interface{} type.
	var _ = (interface{})(nil) == (*int)(nil)
```

```go
	// Values of a directional channel type can be
	// converted to the bidirectional channel type
	// which has the same element type.
	var _ = (chan int)(nil) == (chan<- int)(nil)
	var _ = (chan int)(nil) == (<-chan int)(nil)
```

### Two Nil Values of the Same Type May Be Not Comparable

```go
	// The following comparisons fail to compile
	var _ = ([]int)(nil) == ([]int)(nil)
	var _ = (map[string]int)(nil) == (map[string]int)(nil)
	var _ = (func())(nil) == (func())(nil)
```

```go
	// The following lines compile okay.
	var _ = ([]int)(nil) == nil
	var _ = (map[string]int)(nil) == nil
	var _ = (func())(nil) == nil
```

### Two Nil Values May Be Not Equal

```go
	fmt.Println((interface{})(nil) == (*int)(nil)) // false
```

### Retrieving Elements From Nil Maps Will Not Panic

```go
	fmt.Println((map[string]int)(nil)["key"]) // 0
	fmt.Println((map[int]bool)(nil)[123])     // false
	fmt.Println((map[int]*int64)(nil)[123])   // <nil>
```

### It Is Legal to Range Over Nil Channels, Maps, Slices, and Array Pointers

For example, the following code will print 0, 1, 2, 3 and 4, then block forever. Hello, world and Bye will never be
printed:

```go
	for range []int(nil) {
		fmt.Println("Hello")
	}
```

```go
	for range map[string]string(nil) {
		fmt.Println("world")
	}
```

```go
	for i := range (*[5]int)(nil) {
		fmt.Println(i)
	}
```

```go
	for range chan bool(nil) { // block here
		fmt.Println("Bye")
	}
```

### Invoking Methods Through Non-Interface Nil Receiver Arguments Will Not Panic

```go
package main

type Slice []bool

func (s Slice) Length() int {
	return len(s)
}

func (s Slice) Modify(i int, x bool) {
	s[i] = x // panic if s is nil
}

func (p *Slice) DoNothing() {
}

func (p *Slice) Append(x bool) {
	*p = append(*p, x) // panic if p is nil
}

func (p *Slice) Append(x bool) {
	// *p = append(*p, x) // panic if p is nil
	// or
	if p == nil {
		*p = []bool{x}
		return
	}
	*p = append(*p, x)
}

func main() {
	// The following selectors will not cause panics.
	_ = ((Slice)(nil)).Length
	_ = ((Slice)(nil)).Modify
	_ = ((*Slice)(nil)).DoNothing
	_ = ((*Slice)(nil)).Append

	// The following two lines will also not panic.
	_ = ((Slice)(nil)).Length()
	((*Slice)(nil)).DoNothing()

	// The following two lines will panic. But panics
	// will not be triggered at the time of invoking
	// the methods. They will be triggered on
	// dereferencing nil pointers in the method bodies.
	/*
	((Slice)(nil)).Modify(0, true)
	((*Slice)(nil)).Append(true)
	*/
}
```

### *new(T) приводит к значению nil T, если нулевое значение типа T Представлено с предварительно заданным идентификатором nil

```go
	fmt.Println(*new(*int) == nil)         // true
	fmt.Println(*new([]int) == nil)        // true
	fmt.Println(*new(map[int]bool) == nil) // true
	fmt.Println(*new(chan string) == nil)  // true
	fmt.Println(*new(func()) == nil)       // true
	fmt.Println(*new(interface{}) == nil)  // true
```

[Назад][back]

[back]: <../.> "Назад к оглавлению"
