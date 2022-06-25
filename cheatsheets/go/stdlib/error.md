# error

[Назад][back]

```go
package main

import (
	"errors"
	"fmt"
)

type errorOne struct {
	text string
	Err error
}

func (e errorOne) Error() string {
	return "err1:"
}

func main() {
	e1 := errorOne{text: "This is error", Err: errors.New("error")}
	e2 := fmt.Errorf("err2: %w", e1)
	e3 := fmt.Errorf("err3: %w", e2)

	fmt.Println(e1, "/", errors.Unwrap(e1))
	fmt.Println(e2, "/", errors.Unwrap(e2))
	fmt.Println(e3, "/", errors.Unwrap(e3))
}

// err1: / <nil>
// err2: err1: / err1:
// err3: err2: err1: / err2: err1:
```

[Назад][back]

[back]: <../.> "Назад к оглавлению"