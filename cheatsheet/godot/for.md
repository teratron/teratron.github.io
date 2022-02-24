# for

[Назад][back]

```gdscript
for x in [5, 7, 11]:
    statement
# Loop iterates 3 times with 'x' as 5, then 7 and finally 11.
```

```gdscript
var dict = {"a": 0, "b": 1, "c": 2}
for i in dict:
    print(dict[i])
# Prints 0, then 1, then 2.
```

```gdscript
for i in range(3):
    statement
# Similar to [0, 1, 2] but does not allocate an array.
```

```gdscript
for i in range(1, 3):
    statement
# Similar to [1, 2] but does not allocate an array.
```

```gdscript
for i in range(2, 8, 2):
    statement
# Similar to [2, 4, 6] but does not allocate an array.
```

```gdscript
for c in "Hello":
    print(c)
# Iterate through all characters in a String, print every letter on new line.
```

```gdscript
for i in 3:
    statement
# Similar to range(3)
```

```gdscript
for i in 2.2:
    statement
# Similar to range(ceil(2.2))
```

[Назад][back]

[back]: <.> "Назад к оглавлению"