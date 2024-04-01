# CLI

← [Назад][back]

---

## Синтаксис (Synopsis)

```
mojo <command>
mojo [run-options] <path>
mojo [options]
mojo
```

## Команды

| Команды  | Описание                                     | Синтаксис                            |
|----------|----------------------------------------------|--------------------------------------|
| build    | Создает исполняемый файл                     | `mojo build [options] <path>`        |
| debug    | Запускает отладчик LLDB с поддержкой отладки | `mojo debug [options]`               |
| demangle | Расшифровывает данное имя                    | `mojo demangle [options] <name>`     |
| doc      | Компилирует строки документов                | `mojo doc [options] <path>`          |
| format   | Форматирует исходные файлы                   | `mojo format [options] <sources...>` |
| package  | Компилирует пакет                            | `mojo package [options] <path>`      |
| repl     | Запускает REPL-репозиторий                   | `mojo repl [options]`                |
| run      | Создает и выполняет исполняемый файл         | `mojo run [options] <path>`          |

## Опции

| Опции         | Описание                                      |
|---------------|-----------------------------------------------|
|               | **Варианты диагностики:**                     |
| --version, -v | Распечатывает версию Mojo и завершает работу. |
|               | **Общие параметры:**                          |
| --help, -h    | Отображает справочную информацию.             |

## Примеры

```shell
mojo hello.mojo
```

```shell
mojo package --help
```

```shell
mojo package mypackage -o mypack.mojopkg
```

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"