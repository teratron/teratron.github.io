# Generics

[Назад][back]

## Function

```python
def max[T](args: Iterable[T]) -> T:
    ...
```

```python
def func[T: int, *Ts, **P](*args: *Ts, arg: Callable[P, T] = some_default):
    ...
```

```python
def overly_generic[
   SimpleTypeVar,
   TypeVarWithBound: int,
   TypeVarWithConstraints: (str, bytes),
   *SimpleTypeVarTuple,
   **SimpleParamSpec,
](
   a: SimpleTypeVar,
   b: TypeVarWithBound,
   c: Callable[SimpleParamSpec, TypeVarWithConstraints],
   *d: SimpleTypeVarTuple,
): ...
```

## Class

```python
class list[T]:
    def __getitem__(self, index: int, /) -> T:
        ...

    def append(self, element: T) -> None:
        ...
```

## Type

```python
type Point = tuple[float, float]

# или
type Point[T] = tuple[T, T]
```

```python
type IntFunc[**P] = Callable[P, int]                # ParamSpec
type LabeledTuple[*Ts] = tuple[str, *Ts]            # TypeVarTuple
type HashableSequence[T: Hashable] = Sequence[T]    # TypeVar with bound
type IntOrStrSequence[T: (int, str)] = Sequence[T]  # TypeVar with constraints
```

```python
from typing import TypeVar, Generic  
     
T = TypeVar('T')  
   
class Stack(Generic[T]):  
    def __init__(self) -> None:  
        # Create an empty list with items of type T  
        self.items: List[T] = []  
   
    def push(self, item: T) -> None:  
        self.items.append(item)  
 
    def pop(self) -> T:  
        return self.items.pop()  

    def empty(self) -> bool:  
        return not self.items
```

```python

```

```python

```

```python

```

[Назад][back]

[back]: <.> "Назад к оглавлению"