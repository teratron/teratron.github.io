# React.Component

[Назад][back]

### render()

Единственный из обязательных методов в классовом компоненте. При вызове он должен проверять `this.props` и `this.state`.
`render()` не будет вызываться, если `shouldComponentUpdate()` возвращает `false`.

### constructor()

```react
constructor(props)
```

Конструктор для компонента React вызывается до того, как будет примонтирован.

### componentDidMount()

Вызывается сразу после монтирования компонента (вставлено в DOM-дерево).

### componentDidUpdate()

```react
componentDidUpdate(prevProps, prevState, snapshot)
```

Вызывается сразу после обновления. Этот метод не вызывается при первоначальной отрисовки.

```react
function componentDidUpdate(prevProps) {
    // Обычное использование (не забудьте сравнить свойства):
    if (this.props.userID !== prevProps.userID) {
        this.fetchData(this.props.userID);
    }
}
```

`componentDidUpdate()` не будет вызываться, если `shouldComponentUpdate()` возвращает `false`.

### componentWillUnmount()

Вызывается непосредственно перед размонтированием и уничтожением компонента.

### shouldComponentUpdate()

```react
shouldComponentUpdate(nextProps, nextState)
```

Используйте `shouldComponentUpdate()`, чтобы позволить React знать, не влияет ли на результат компонента текущее
изменение состояния или свойства.
`shouldComponentUpdate()` вызывается перед отрисовкой при получении новых свойств или состояний.

[Назад][back]

[back]: <.> "Назад к оглавлению"