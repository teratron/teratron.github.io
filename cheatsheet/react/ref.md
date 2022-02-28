# Ref

[Назад][back]

### React.forwardRef

В данном примере мы используем React.forwardRef в компоненте FancyButton, чтобы получить реф и передать его в дочерний
DOM-элемент button.

```react
const FancyButton = React.forwardRef((props, ref) => (
    <button ref={ref} className="FancyButton">
        {props.children}
    </button>
));

// Теперь реф будет указывать непосредственно на DOM-узел button:
const ref = React.createRef();
<FancyButton ref={ref}>Click me!</FancyButton>;
```

Таким образом, когда мы будем применять FancyButton в других компонентах, мы сможем получить реф находящегося в нём
DOM-узла button и использовать его так же, как если бы мы рендерили непосредственно button.

### React.createRef

```react
class MyComponent extends React.Component {
    constructor(props) {
        super(props);
        this.myRef = React.createRef();
    }

    render() {
        return <div ref={this.myRef} />;
    }
}
```

### Доступ к рефам

Когда реф передаётся элементу в методе `render`, ссылка на данный узел доступна через свойство рефа `current`.

```react
const node = this.myRef.current;

// В представленном ниже примере ref используется для хранения ссылки на DOM-элемент.
class CustomTextInput extends React.Component {
    constructor(props) {
        super(props);
        // создадим реф в поле `textInput` для хранения DOM-элемента
        this.textInput = React.createRef();
        this.focusTextInput = this.focusTextInput.bind(this);
    }

    focusTextInput() {
        // Установим фокус на текстовое поле с помощью чистого DOM API
        // Примечание: обращаемся к "current", чтобы получить DOM-узел
        this.textInput.current.focus();
    }

    render() {
        // описываем, что мы хотим связать реф <input>
        // с `textInput` созданным в конструкторе
        return (
            <div>
                <input
                    type="text"
                    ref={this.textInput} />
                <input
                    type="button"
                    value="Фокус на текстовом поле"
                    onClick={this.focusTextInput} />
            </div>
        );
    }
}
```

### Добавление рефа к классовому компоненту

```react
class AutoFocusTextInput extends React.Component {
    constructor(props) {
        super(props);
        this.textInput = React.createRef();
    }

    componentDidMount() {
        this.textInput.current.focusTextInput();
    }

    render() {
        return (
            <CustomTextInput ref={this.textInput} />
        );
    }
}
```

### Рефы и функциональные компоненты

```react
function MyFunctionComponent() {
    return <input />;
}

class Parent extends React.Component {
    constructor(props) {
        super(props);
        this.textInput = React.createRef();
    }

    render() {
        // Данный код *не будет* работать!
        return (
            <MyFunctionComponent ref={this.textInput} />
        );
    }
}
```

```react
// Тем не менее, можно использовать атрибут ref внутри функционального компонента при условии,
// что он ссылается на DOM-элемент или классовый компонент:
function CustomTextInput(props) {
    // textInput должна быть объявлена здесь, чтобы реф мог иметь к ней доступ
    const textInput = useRef(null);

    function handleClick() {
        textInput.current.focus();
    }

    return (
        <div>
            <input
                type="text"
                ref={textInput} />
            <input
                type="button"
                value="Фокус на поле для ввода текста"
                onClick={handleClick} />
        </div>
    );
}
```

### Колбэк-рефы

```react
class CustomTextInput extends React.Component {
    constructor(props) {
        super(props);

        this.textInput = null;

        this.setTextInputRef = element => {
          this.textInput = element;
        };

        this.focusTextInput = () => {
          // Устанавливаем фокус на текстовом поле ввода с помощью чистого DOM API
          if (this.textInput) this.textInput.focus();
        };
    }

    componentDidMount() {
        // устанавливаем фокус на input при монтировании
        this.focusTextInput();
    }

    render() {
        // Используем колбэк в `ref`, чтобы сохранить ссылку на DOM-элемент
        // поля текстового ввода в поле экземпляра (например, this.textInput).
        return (
            <div>
                <input
                    type="text"
                    ref={this.setTextInputRef} />
                <input
                    type="button"
                    value="Focus the text input"
                    onClick={this.focusTextInput} />
            </div>
        );
    }
}
```

```react
// Вы можете передавать колбэк-рефы между компонентами точно так же,
// как и объектные рефы, созданные через React.createRef().
function CustomTextInput(props) {
    return (
        <div>
            <input ref={props.inputRef} />
        </div>
    );
}

class Parent extends React.Component {
    render() {
        return (
            <CustomTextInput inputRef={el => this.inputElement = el} />
        );
    }
}
```

[Назад][back]

[back]: <.> "Назад к оглавлению"