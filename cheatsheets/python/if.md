# if

[Назад][back]

```python
language = "german"

if language == "english":
    print("Hello")
    print("World")
elif language == "german":
    print("Hallo")
    print("Welt")
else:
    print("Привет")
    print("мир")
```

### Вложенные конструкции if

```python
language = "russian"
daytime = "morning"

if language == "english":
    if daytime == "morning":
        print("Good morning")
    else:
        print("Good evening")
else:
    if daytime == "morning":
        print("Доброе утро")
    else:
        print("Добрый вечер")
```

[Назад][back]

[back]: <.> "Назад к оглавлению"