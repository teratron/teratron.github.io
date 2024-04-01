# React

← [Назад][back]

### React API

#### Компоненты:

- React.Component
- React.PureComponent
- React.memo

#### Создание элементов:

- createElement()
- createFactory()

#### Трансформация элементов:

- cloneElement()
- isValidElement()
- React.Children

#### Фрагменты:

- React.Fragment

#### Рефы:

- React.createRef
- React.forwardRef

#### Задержка (Suspense):

- React.lazy
- React.Suspense

#### Хуки:

- **Основные хуки**
    - useState
    - useEffect
    - useContext

- **Дополнительные хуки**
    - useReducer
    - useCallback
    - useMemo
    - useRef
    - useImperativeHandle
    - useLayoutEffect
    - useDebugValue

### React.Component

Это базовый класс для компонентов React, объявленных как ES6-классы:

```react
class Greeting extends React.Component {
    render() {
        return <h1>Привет, {this.props.name}</h1>;
    }
}
```

### React.PureComponent

Похож на `React.Component`.\
Отличие заключается в том, что `React.Component` не реализует `shouldComponentUpdate()`, а `React.PureComponent`
реализует его поверхностным сравнением пропсов и состояния.

### React.memo

Если ваш компонент всегда рендерит одно и то же при неменяющихся пропсах, вы можете обернуть его в вызов `React.memo`
для повышения производительности в некоторых случаях, мемоизируя тем самым результат. Это значит, что React будет
использовать результат последнего рендера, избегая повторного рендеринга.

```react
const MyComponent = React.memo(function MyComponent(props) {
    /* рендер с использованием пропсов */
});

function MyComponent(props) {
    /* рендер с использованием пропсов */
}

function areEqual(prevProps, nextProps) {
    /*
    возвращает true, если nextProps рендерит
    тот же результат что и prevProps,
    иначе возвращает false
    */
}

export default React.memo(MyComponent, areEqual);
```

### createElement()

```react
React.createElement(
    type,
    [props],
    [...children]
)
```

### cloneElement()

```react
React.cloneElement(
    element,
    [props],
    [...children]
)
```

### createFactory()

Возвращает функцию, которая создаёт элементы React заданного типа. Как и `React.createElement()`, аргументом type может
быть строка содержащая имя тега (например, `div` или `span`), React-компонент (класс или функция), или React-фрагмент.

```react
React.createFactory(type)
```

### isValidElement()

```react
// Проверяет, что объект является элементом React. Возвращает true или false.
React.isValidElement(object)
```

### React.Children

Предоставляет функции для работы с непрозрачной структурой данных `this.props.children`.\
Вызывает функцию для каждого непосредственного потомка, содержащегося в `children` передавая их по очереди в `thisArg`.

```react
// Если children — это массив, он будет пройден, и функция будет вызвана для каждого потомка в массиве.
React.Children.map(children, function[(thisArg)])

// Похож на React.Children.map(), но не возвращает массив.
React.Children.forEach(children, function[(thisArg)])

// Возвращает общее количество компонентов в children.
React.Children.count(children)

// Проверяет, что у children есть только один потомок (React элемент), и возвращает его.
React.Children.only(children)

// Возвращает непрозрачную структуру данных children в виде плоского массива с ключами, заданные каждому дочернему элементу.
React.Children.toArray(children)
```

### React.Fragment

```react
render() {
    return (
        <React.Fragment>
            <ChildA />
            Какой-то текст.
            <h2>Заголовок</h2>
        </React.Fragment>
    );
}
```

```react
// или
render() {
    return (
        <>
            <ChildA />
            <ChildB />
        </>
    );
}
```

```react
// Фрагменты с ключами
function Glossary(props) {
    return (
        <dl>
            {props.items.map(item => (
                // Без указания атрибута `key`, React выдаст предупреждение об его отсутствии
                <React.Fragment key={item.id}>
                    <dt>{item.term}</dt>
                    <dd>{item.description}</dd>
                </React.Fragment>
            ))}
        </dl>
    );
}
```

### React.createRef

```react
// React.createRef создаёт реф, который можно прикрепить к React-элементам через атрибут ref.
class MyComponent extends React.Component {
    constructor(props) {
        super(props);
        this.inputRef = React.createRef();
    }

    componentDidMount() {
        this.inputRef.current.focus();
    }

    render() {
        return <input type="text" ref={this.inputRef} />;
    }
}
```

### React.forwardRef

```react
// React.forwardRef создаёт React компонент, который перенаправляет атрибут ref,
// что он получает, другому компоненту ниже в дереве.
const FancyButton = React.forwardRef((props, ref) => (
    <button ref={ref} className="FancyButton">
        {props.children}
    </button>
));
```

```react
// Теперь вы можете получить ссылку на элемент DOM:
const ref = React.createRef();
<FancyButton ref={ref}>Click me!</FancyButton>;
```

### React.lazy

Позволяет вам определять компонент, который загружается динамически. Это помогает уменьшить размер сборки, откладывая
загрузку компонентов, которые не используются во время первоначального рендера.

```react
// Этот компонент загружается динамически
const SomeComponent = React.lazy(() => import('./SomeComponent'));
```

### React.Suspense

`React.Suspense` позволяет показать индикатор загрузки в случае, если некоторые компоненты в дереве под ним ещё не
готовы к рендеру.

```react
// Этот компонент загружается динамически
const OtherComponent = React.lazy(() => import('./OtherComponent'));

function MyComponent() {
    return (
        // Отобразится <Spinner> до тех пор, пока не загрузится <OtherComponent />
        <React.Suspense fallback={<Spinner />}>
            <div>
                <OtherComponent />
            </div>
        </React.Suspense>
    );
}
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"