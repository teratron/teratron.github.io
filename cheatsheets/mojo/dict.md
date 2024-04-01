# Dict

← [Назад][back]

---

```mojo
from collections.dict import Dict, KeyElement

@value
struct StringKey(KeyElement):
    var s: String

    fn __init__(inout self, owned s: String):
        self.s = s ^

    fn __init__(inout self, s: StringLiteral):
        self.s = String(s)

    fn __hash__(self) -> Int:
        return hash(self.s)

    fn __eq__(self, other: Self) -> Bool:
        return self.s == other.s

fn main() raises:
    var d = Dict[StringKey, Int]()
    d["cats"] = 1
    d["dogs"] = 2
    print(len(d))         # 2
    print(d["cats"])      # 1
    print(d.pop("dogs"))  # 2
    print(len(d))         # 1
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