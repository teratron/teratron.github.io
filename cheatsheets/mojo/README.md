# Mojo

← [Назад к перечню шпаргалок][back]

---

## Ключевые слова

| Keyword           | Описание                                 | Пример |
|-------------------|------------------------------------------|--------|
| struct            | статичные атрибуты **строгий режим**     |        |
| class             | динамичные атрибуты                      |        |
| fn                | **строгий режим**                        |        |
| def               |                                          |        |
| const             |                                          |        |
| let               | неизменяемые параметры **строгий режим** |        |
| var               | изменяемые параметры                     |        |
| [alias](alias.md) | выражения именованных параметров         |        |
| True              |                                          |        |
| False             |                                          |        |

## Типы данных

| Типы    | Описание                                                             | Диапазон чисел или значение                            |
|---------|----------------------------------------------------------------------|--------------------------------------------------------|
| Int     | 32-битные или 64-битные числа со знаком (в зависимости от платформы) |                                                        |
| Int8    | 8-битные числа со знаком                                             | от -128 до 127                                         |
| Int16   | 16-битные числа со знаком                                            | от -32 768 до 32767                                    |
| Int32   | 32-битные числа со знаком                                            | от -2147483648 до 2147483647                           |
| Int64   | 64-битные числа со знаком                                            | от -9223372036854775808 до 9223372036854775807         |
| UInt    | 32-битные или 64-битные числа без знака (в зависимости от платформы) |                                                        |
| UInt8   | 8-битные числа без знака                                             | от 0 до 255                                            |
| UInt16  | 16-битные числа без знака                                            | от 0 до 65535                                          |
| UInt32  | 32-битные числа без знака                                            | от 0 до 4294967295                                     |
| UInt64  | 64-битные числа без знака                                            | от 0 до 18 446744073709551615                          |
| Float16 | занимает 2 байта с точностью до 3 знаков после запятой               |                                                        |
| Float32 | занимает 4 байта с точностью до 7 знаков после запятой               | от -3.4028235E+38 до 3.4028235E+38                     |
| Float64 | занимает 8 байт с точностью до 15 знаков после запятой               | от -1.7976931348623157E+308 до 1.7976931348623157E+308 |
| Bool    |                                                                      | True или False                                         |
| String  |                                                                      |                                                        |

| Collections             | Описание | Пример |
|-------------------------|----------|--------|
| [Tuple](tuple.md)       |          |        |
| [Dict](dict.md)         |          |        |
| [Optional](optional.md) |          |        |

## [CLI](cli.md)

## [Функции](functions.md)

## [Структуры](structures.md)

## [Трейты](traits.md)

## [Dict](dict.md)

## [Set](set.md)

- CollectionElement
- Copyable
- Destructable
- Intable
- Movable
- Sized
- Stringable

## [Модули](modules.md)

### - [benchmark](benchmark.md)

## [Пакеты](packages.md)

## [Generics](generics.md)

## Объявление переменных

### - [let]()

### - [var]()

### - [alias](alias.md)

## [SIMD](simd.md)

## *_

`*_` синтаксис, который позволяет пользователям явно отменять привязку любого количества позиционных параметров.

```mojo
struct StructWithDefault[a: Int, b: Int, c: Int = 8, d: Int = 9]: pass

alias all_unbound = StructWithDefault[*_]
# equivalent to
# alias all_unbound = StructWithDefault[_, _, _, _]

alias first_bound = StructWithDefault[5, *_]
# equivalent to
# alias first_bound = StructWithDefault[5, _, _, _]

alias last_bound = StructWithDefault[*_, 6]
# equivalent to
# alias last_bound = StructWithDefault[_, _, _, 6]

alias mid_unbound = StructWithDefault[3, *_, 4]
# equivalent to
# alias mid_unbound = StructWithDefault[3, _, _, 4]
```

```mojo
alias last_bound = StructWithDefault[*_, 6]
# При использовании `last_bound` вы должны указать `a`, `b` и `c`.
# `last_bound` не имеет значения по умолчанию для `c`.
var s = last_bound[1, 2, 3]()
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

## Ссылки

[https://docs.modular.com/mojo](https://docs.modular.com/mojo)

---

← [Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"