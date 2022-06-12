# SASS / SCSS

[Назад к перечню шпаргалок][back]

## Правила и директивы

### @import

### @media

#### 1

```scss
.sidebar {
  width: 300px;

  @media screen and (orientation: landscape) {
    width: 500px;
  }
}
```

```css
.sidebar {
  width: 300px; 
}

@media screen and (orientation: landscape) {
  .sidebar {
    width: 500px; 
  } 
}
```

#### 2

```scss
@media screen {
  .sidebar {
    @media (orientation: landscape) {
      width: 500px;
    }
  }
}
```

```css
@media screen and (orientation: landscape) {
  .sidebar {
    width: 500px; 
  } 
}
```

#### 3

```scss
$media: screen;
$feature: -webkit-min-device-pixel-ratio;
$value: 1.5;

@media #{$media} and ($feature: $value) {
  .sidebar {
    width: 500px;
  }
}
```

```css
@media screen and (-webkit-min-device-pixel-ratio: 1.5) {
  .sidebar {
    width: 500px; 
  } 
}
```

### @extend

## Типы данных

### Строки

```scss
@mixin firefox-message($selector) {
  body.firefox #{$selector}:before {
    content: "Hi, Firefox users!";
  }
}

@include firefox-message(".header");
```

```css
body.firefox .header:before {
  content: "Hi, Firefox users!";
}
```

### Списки

```scss
// Узнаем значение элемента списка по индексу:
nth(10px 20px 30px, 1)
nth((Helvetica, Arial, sans-serif), 3)
nth((width: 10px, length: 20px), 2)

// Объединяем списки в один:
join(10px 20px, 30px 40px)
join((blue, red), (#abc, #def))
join(10px, 20px)

// Добавляем в список элементы:
append(10px 20px, 30px)
append((blue, red), green)
append(10px 20px, 30px 40px)
```

```css
/* Узнаем значение элемента списка по индексу: */
10px
sans-serif
length, 20px

/* Объединяем списки в один: */
10px 20px 30px 40px
blue, red, #abc, #def
10px 20px

/* Добавляем в список элементы: */
10px 20px 30px
blue, red, green
```

### Мапы (Ассоциативные массивы)

```scss
$status-colors: (
  primary: #000,
  success: #27BA6C,
  info: #03a9f4,
  warning: #FF8833,
  danger: #ff1a1a
);

.message {
  @each $status, $color in $status-colors {
    &--#{$status} {
      background: $color;
    }
  }
}
```

```css
.message--primary {
  background: #000;
}

.message--success {
  background: #27ba6c;
}

.message--info {
  background: #03a9f4;
}

.message--warning {
  background: #f83;
}

.message--danger {
  background: #ff1a1a;
}
```

## Операции

## Интерполяция

#### 1

```scss
$name: foo;
$attr: border;
p.#{$name} {
#{$attr}-color: blue;
}
```

```css
p.foo {
border-color: blue;
}
```

#### 2

```scss
p {
$font-size: 12px;
$line-height: 30px;
font: #{$font-size}/#{$line-height};
}
```

```css
p {
font: 12px/30px;
}
```

## Оператор "&"

```scss
@mixin does-parent-exist {
    @if & {
        &:hover {
            color: red;
        }
    } @else {
        a {
            color: red;
        }
    }
}
```

## Переменные по умолчанию

Вы можете присваивать значение по-умолчанию переменным, у которых еще нет значения, добавив метку !default в конце
значения.
В таком случае, если переменная уже имела значение, то оно не изменится; если же переменная пуста, ей будет присвоено
новое указанное значение.

```scss
$content: "Тестовый текст";
$content: "Новый тестовый текст?" !default;
$new_content: "Как пройти в библиотеку?" !default;

#main {
  content: $content;
  new-content: $new_content;
}
```

```css
#main {
  content: "Тестовый текст";
  new-content: "Как пройти в библиотеку?"; 
}
```

Переменные, имеющие значение null, рассматриваются меткой !default как не имеющие значения:

```scss
$content: null;
$content: "НЕ-null контент" !default;

#main {
  content: $content;
}
```

```css
#main {
  content: "НЕ-null контент"; 
}
```

[Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"