# NumPy

← [Назад к перечню шпаргалок][back]

---

## Работа с NumPy

```python
import numpy as np
```

## Вектор

```python
data = [1, 2, 3, 4, 5]

arr = np.array(data) # создание из list

print(arr)        # [1 2 3 4 5]
print(arr.shape)  # (5,)
print(arr.dtype)  # int64
print(arr.ndim)   # 1
```

### Типы данных NumPy:

| Тип         | Описание                                   |
|-------------|--------------------------------------------|
| np.int64    | Signed 64-bit integer types                |
| np.float32  | Standard double-precision floating point   |
| np.complex  | Complex numbers represented by 128 floats> |
| np.bool     | Boolean type storing TRUE and FALSE values |
| np.object   | Python object type                         |
| np.string_  | Fixed-length string type>                  |
| np.unicode_ | Fixed-length unicode type                  |

```python
arr = np.array([1, 2, 3, 4, 5], dtype=np.float) # задаём явно тип данных

print(arr)        # [1. 2. 3. 4. 5.]
print(arr.shape)  # (5,)
print(arr.dtype)  # float64
print(arr.ndim)   # 1
print(len(arr))   # 5
print(arr.size)   # 5
```

### astype

```python
rr = np.array([1, 2, 3, 4, 5], dtype=np.float)

arr = arr.astype(np.int64) # приводим все элементы к типу int64

print(arr)       # [1 2 3 4 5]
print(arr.dtype) # int64
```

### arange

```python
arr = np.arange(0, 20, 1.5)  # 0 - старт, 20 - конец, 1.5 - шаг

print(arr)  # [0., 1.5, 3., 4.5, 6., 7.5, 9., 10.5, 12., 13.5, 15., 16.5, 18., 19.5]
```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

```python

```

## Ссылки

[]()

---

← [Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"