//--------------------------------------------- // SyntheticEvent //---------------------------------------------

// Вот перечень атрибутов объекта SyntheticEvent:
boolean bubbles boolean cancelable DOMEventTarget currentTarget boolean defaultPrevented number eventPhase boolean
isTrusted DOMEvent nativeEvent void preventDefault()
boolean isDefaultPrevented()
void stopPropagation()
boolean isPropagationStopped()
void persist()
DOMEventTarget target number timeStamp string type

//--------------------------------------------- // Поддерживаемые события
//--------------------------------------------- // События буфера обмена // Композиционные события // События клавиатуры
// События фокуса // События формы // Общие события // События мыши // События курсора // События выбора // Сенсорные
события // События UI // События колёсика мыши // События медиа-элементов // События изображений // События анимаций //
События переходов // Другие события

//--------------------------------------------- // События буфера обмена //---------------------------------------------
// Названия событий:
onCopy onCut onPaste

// Свойства:
DOMDataTransfer clipboardData

//--------------------------------------------- // Композиционные события
//--------------------------------------------- // Названия событий:
onCompositionEnd onCompositionStart onCompositionUpdate

// Свойства:
string data

//--------------------------------------------- // События клавиатуры //--------------------------------------------- //
Названия событий:
onKeyDown onKeyPress onKeyUp

// Свойства:
boolean altKey number charCode boolean ctrlKey boolean getModifierState(key)
string key number keyCode string locale number location boolean metaKey boolean repeat boolean shiftKey number which

//--------------------------------------------- // События фокуса //--------------------------------------------- // Эти
события фокуса работают не только на элементах формы, но и на всех остальных элементах в React DOM. // Названия событий:
onFocus onBlur

// Свойства:
DOMEventTarget relatedTarget

// onFocus //---------------------- // Событие onFocus вызывается при перемещении фокуса на элемент (включая дочерние
элементы внутри него). function Example() { return (
<input onFocus={(e) => { console.log('Получен фокус на поле ввода'); }} placeholder="onFocus выполнится при нажатии на
это поле ввода."
/>
)
}

// onBlur //---------------------- // Событие onBlur вызывается при пропадании фокуса с элемента (включая дочерние
элементы внутри него). function Example() { return (
<input onBlur={(e) => { console.log('Пропал фокус с поля ввода'); }} placeholder="onBlur выполнится в случае изменения
фокуса с этого поля ввода на любой другой элемент."
/>
)
}

// Отслеживание получения и перемещения фокуса //---------------------- // Можно использовать свойства currentTarget и
relatedTarget, чтобы определить, // когда наступили события появления или исчезновения фокуса за пределами родительского
элемента. function Example() { return (
<div tabIndex={1} onFocus={(e) => { if (e.currentTarget === e.target) { console.log('фокус на родительском элементе
установлен'); } else { console.log('фокус на дочернем элементе установлен', e.target); } if (!e.currentTarget.contains(
e.relatedTarget)) { // Не срабатывает при перемещении фокуса между дочерними элементами console.log('фокус находится
внутри родительского элемента'); } }} onBlur={(e) => { if (e.currentTarget === e.target) { console.log('фокус на
родительском элементе снят'); } else { console.log('фокус на дочернем элементе снят', e.target); } if (!
e.currentTarget.contains(e.relatedTarget)) { // Не срабатывает при перемещении фокуса между дочерними элементами
console.log('фокус потерян изнутри родительского элемента'); } }}
>
<input id="1" />
<input id="2" />
</div>
); }

//--------------------------------------------- // События формы //--------------------------------------------- //
Названия событий:
onChange onInput onInvalid onReset onSubmit

//--------------------------------------------- // Общие события //--------------------------------------------- //
Названия событий:
onError onLoad

//--------------------------------------------- // События мыши //--------------------------------------------- //
Названия событий:
onClick onContextMenu onDoubleClick onDrag onDragEnd onDragEnter onDragExit onDragLeave onDragOver onDragStart onDrop
onMouseDown onMouseEnter onMouseLeave onMouseMove onMouseOut onMouseOver onMouseUp // События onMouseEnter и
onMouseLeave всплывают с покинутого элемента к наведённому, // вместо обычного процесса всплытия и не имеют фазы
перехвата.

// Свойства:
boolean altKey number button number buttons number clientX number clientY boolean ctrlKey boolean getModifierState(key)
boolean metaKey number pageX number pageY DOMEventTarget relatedTarget number screenX number screenY boolean shiftKey

//--------------------------------------------- // События курсора //--------------------------------------------- //
Названия событий:
onPointerDown onPointerMove onPointerUp onPointerCancel onGotPointerCapture onLostPointerCapture onPointerEnter
onPointerLeave onPointerOver onPointerOut // События onPointerEnter и onPointerLeave всплывают с покинутого элемента к
наведённому, // вместо обычного процесса всплытия и не имеют фазы перехвата.

// Свойства:
number pointerId number width number height number pressure number tangentialPressure number tiltX number tiltY number
twist string pointerType boolean isPrimary

//--------------------------------------------- // События выбора //--------------------------------------------- //
Названия событий:
onSelect

//--------------------------------------------- // Сенсорные события //--------------------------------------------- //
Названия событий:
onTouchCancel onTouchEnd onTouchMove onTouchStart

// Свойства:
boolean altKey DOMTouchList changedTouches boolean ctrlKey boolean getModifierState(key)
boolean metaKey boolean shiftKey DOMTouchList targetTouches DOMTouchList touches

//--------------------------------------------- // События UI //--------------------------------------------- //
Названия событий:
onScroll

// Свойства:
number detail DOMAbstractView view

//--------------------------------------------- // События колёсика мыши //---------------------------------------------
// Названия событий:
onWheel

// Свойства:
number deltaMode number deltaX number deltaY number deltaZ

//--------------------------------------------- // События медиа-элементов
//--------------------------------------------- // Названия событий:
onAbort onCanPlay onCanPlayThrough onDurationChange onEmptied onEncrypted onEnded onError onLoadedData onLoadedMetadata
onLoadStart onPause onPlay onPlaying onProgress onRateChange onSeeked onSeeking onStalled onSuspend onTimeUpdate
onVolumeChange onWaiting

//--------------------------------------------- // События изображений //---------------------------------------------
// Названия событий:
onLoad onError

//--------------------------------------------- // События анимаций //--------------------------------------------- //
Названия событий:
onAnimationStart onAnimationEnd onAnimationIteration

// Свойства:
string animationName string pseudoElement float elapsedTime

//--------------------------------------------- // События переходов //--------------------------------------------- //
Названия событий:
onTransitionEnd

// Свойства:
string propertyName string pseudoElement float elapsedTime

//--------------------------------------------- // Другие события //--------------------------------------------- //
Названия событий:
onToggle



