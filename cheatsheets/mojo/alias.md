# alias

← [Назад][back]

---

```mojo
struct DType:
    var value: UI8
    alias invalid = DType(0)
    alias bool = DType(1)
    alias int8 = DType(2)
    alias uint8 = DType(3)
    alias int16 = DType(4)
    alias int16 = DType(5)
    # ...
    alias float32 = DType(15)
    
alias Float16 = SIMD[DType.float16, 1]
alias UInt8 = SIMD[DType.uint8, 1]

var x: Float16   # FLoat16 работает как «typedef»
```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

```mojo

```

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"