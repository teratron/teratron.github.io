# SIMD

[Назад][back]

---

```mojo
fn add[
        datatype: DType,
        length: Int
    ](
        a: SIMD[datatype, length],
        b: SIMD[datatype, length]
    ) -> SIMD[datatype, length]:
    return a + b

fn main():
    let x = SIMD[DType.float16, 4](1, 4, 9, 16)
    print(x * 2)  # [2.0, 8.0, 18.0, 32.0]
    print(x.__len__())  # 4

    let y: SIMD[DType.float16, 4] = add(x, x)
    print(y)  # [2.0, 8.0, 18.0, 32.0]
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

[Назад][back]

[back]: <.> "Назад к оглавлению"