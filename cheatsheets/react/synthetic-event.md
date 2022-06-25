# SyntheticEvent

[Назад][back]

| Тип            | Атрибут                |
|----------------|------------------------|
| boolean        | bubbles                |
| boolean        | cancelable             |
| DOMEventTarget | currentTarget          |
| boolean        | defaultPrevented       |
| number         | eventPhase             |
| boolean        | isTrusted              |
| DOMEvent       | nativeEvent            |
| void           | preventDefault()       |
| boolean        | isDefaultPrevented()   |
| void           | stopPropagation()      |
| boolean        | isPropagationStopped() |
| void           | persist()              |
| DOMEventTarget | target                 |
| number         | timeStamp              |
| string         | type                   |

### Поддерживаемые события

- События буфера обмена
- Композиционные события
- События клавиатуры
- События фокуса
- События формы
- Общие события
- События мыши
- События курсора
- События выбора
- Сенсорные события
- События UI
- События колёсика мыши
- События медиа-элементов
- События изображений
- События анимаций
- События переходов
- Другие события

### События буфера обмена

- onCopy
- onCut
- onPaste

| Тип             | Свойства      |
|-----------------|---------------|
| DOMDataTransfer | clipboardData |

### Композиционные события

- onCompositionEnd
- onCompositionStart
- onCompositionUpdate

| Тип    | Свойства |
|--------|----------|
| string | data     |

### События клавиатуры

- onKeyDown
- onKeyPress
- onKeyUp

| Тип     | Свойства              |
|---------|-----------------------|
| boolean | altKey                |
| number  | charCode              |
| boolean | ctrlKey               |
| boolean | getModifierState(key) |
| string  | key                   |
| number  | keyCode               |
| string  | locale                |
| number  | location              |
| boolean | metaKey               |
| boolean | repeat                |
| boolean | shiftKey              |
| number  | which                 |

### События фокуса

Эти события фокуса работают не только на элементах формы, но и на всех остальных элементах в React DOM.

- onFocus
- onBlur

| Тип            | Свойства      |
|----------------|---------------|
| DOMEventTarget | relatedTarget |

#### onFocus

Событие onFocus вызывается при перемещении фокуса на элемент (включая дочерние элементы внутри него).

```react
function Example() {
    return (
        <input
            onFocus={(e) => {
                console.log('Получен фокус на поле ввода');
            }}
            placeholder="onFocus выполнится при нажатии на это поле ввода." />
    )
}
```

#### onBlur

Событие onBlur вызывается при пропадании фокуса с элемента (включая дочерние элементы внутри него).

```react
function Example() {
    return (
        <input
            onBlur={(e) => {
                console.log('Пропал фокус с поля ввода');
            }}
            placeholder="onBlur выполнится в случае изменения фокуса с этого поля ввода на любой другой элемент." />
    )
}
```

#### Отслеживание получения и перемещения фокуса

Можно использовать свойства `currentTarget` и `relatedTarget`, чтобы определить, когда наступили события появления или
исчезновения фокуса за пределами родительского элемента.

```react
function Example() {
    return (
        <div
            tabIndex={1}
            onFocus={(e) => {
                if (e.currentTarget === e.target) {
                    console.log('фокус на родительском элементе установлен');
                } else {
                    console.log('фокус на дочернем элементе установлен', e.target);
                }
                if (!e.currentTarget.contains(e.relatedTarget)) {
                    // Не срабатывает при перемещении фокуса между дочерними элементами
                    console.log('фокус находится внутри родительского элемента');
                }
            }}
            onBlur={(e) => {
                if (e.currentTarget === e.target) {
                    console.log('фокус на родительском элементе снят');
                } else {
                    console.log('фокус на дочернем элементе снят', e.target);
                }
                if (!e.currentTarget.contains(e.relatedTarget)) {
                    // Не срабатывает при перемещении фокуса между дочерними элементами
                    console.log('фокус потерян изнутри родительского элемента');
                }
            }}
        >
            <input id="1" />
            <input id="2" />
        </div>
    );
}
```

### События формы

- onChange
- onInput
- onInvalid
- onReset
- onSubmit

### Общие события

- onError
- onLoad

### События мыши

- onClick
- onContextMenu
- onDoubleClick
- onDrag onDragEnd
- onDragEnter
- onDragExit
- onDragLeave
- onDragOver
- onDragStart
- onDrop
- onMouseDown
- onMouseEnter
- onMouseLeave
- onMouseMove
- onMouseOut
- onMouseOver
- onMouseUp

События `onMouseEnter` и `onMouseLeave` всплывают с покинутого элемента к наведённому, вместо обычного процесса всплытия
и не имеют фазы перехвата.

| Тип            | Свойства              |
|----------------|-----------------------|
| boolean        | altKey                |
| number         | button                |
| number         | buttons               |
| number         | clientX               |
| number         | clientY               |
| boolean        | ctrlKey               |
| boolean        | getModifierState(key) |
| boolean        | metaKey               |
| number         | pageX                 |
| number         | pageY                 |
| DOMEventTarget | relatedTarget         |
| number         | screenX               |
| number         | screenY               |
| boolean        | shiftKey              |

### События курсора

- onPointerDown
- onPointerMove
- onPointerUp
- onPointerCancel
- onGotPointerCapture
- onLostPointerCapture
- onPointerEnter
- onPointerLeave
- onPointerOver
- onPointerOut

События `onPointerEnter` и `onPointerLeave` всплывают с покинутого элемента к наведённому, вместо обычного процесса
всплытия и не имеют фазы перехвата.

| Тип     | Свойства           |
|---------|--------------------|
| number  | pointerId          |
| number  | width              |
| number  | height             |
| number  | pressure           |
| number  | tangentialPressure |
| number  | tiltX              |
| number  | tiltY              |
| number  | twist              |
| string  | pointerType        |
| boolean | isPrimary          |

### События выбора

- onSelect

### Сенсорные события

- onTouchCancel
- onTouchEnd
- onTouchMove
- onTouchStart

| Тип          | Свойства              |
|--------------|-----------------------|
| boolean      | altKey                |
| DOMTouchList | changedTouches        |
| boolean      | ctrlKey               |
| boolean      | getModifierState(key) |
| boolean      | metaKey               |
| boolean      | shiftKey              |
| DOMTouchList | targetTouches         |
| DOMTouchList | touches               |

### События UI

- onScroll

| Тип             | Свойства |
|-----------------|----------|
| number          | detail   |
| DOMAbstractView | view     |

### События колёсика мыши

- onWheel

| Тип    | Свойства  |
|--------|-----------|
| number | deltaMode |
| number | deltaX    |
| number | deltaY    |
| number | deltaZ    |

### События медиа-элементов

- onAbort
- onCanPlay
- onCanPlayThrough
- onDurationChange
- onEmptied
- onEncrypted
- onEnded
- onError
- onLoadedData
- onLoadedMetadata
- onLoadStart
- onPause
- onPlay
- onPlaying
- onProgress
- onRateChange
- onSeeked
- onSeeking
- onStalled
- onSuspend
- onTimeUpdate
- onVolumeChange
- onWaiting

### События изображений

- onLoad
- onError

### События анимаций

- onAnimationStart
- onAnimationEnd
- onAnimationIteration

| Тип    | Свойства      |
|--------|---------------|
| string | animationName |
| string | pseudoElement |
| float  | elapsedTime   |

### События переходов

- onTransitionEnd

| Тип    | Свойства      |
|--------|---------------|
| string | propertyName  |
| string | pseudoElement |
| float  | elapsedTime   |

### Другие события

- onToggle

[Назад][back]

[back]: <.> "Назад к оглавлению"