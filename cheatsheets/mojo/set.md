# Set

[Назад][back]

---

```mojo
from collections import Set

var set = Set[Int](1, 2, 3)
print(len(set))  # 3
set.add(4)

for element in set:
    print(element[])

set -= Set[Int](3, 4, 5)
print(set == Set[Int](1, 2))                      # True
print(set | Set[Int](0, 1) == Set[Int](0, 1, 2))  # True

let element = set.pop()
print(len(set))                                   # 1
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