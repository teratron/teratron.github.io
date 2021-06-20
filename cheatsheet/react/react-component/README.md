# React.Component
[Назад](https://teratron.github.io/cheatsheet/react/)

---
### render()
единственный из обязательных методов в классовом компоненте. 
При вызове он должен проверять this.props и this.state. 
render() не будет вызываться, если shouldComponentUpdate() возвращает false.

---
### constructor()
    constructor(props)

Конструктор для компонента React вызывается до того, как будет примонтирован.

---
### componentDidMount()
вызывается сразу после монтирования компонента (вставлено в DOM-дерево).

---
### componentDidUpdate()
    componentDidUpdate(prevProps, prevState, snapshot)

вызывается сразу после обновления. Этот метод не вызывается при первоначальной отрисовке.

```
componentDidUpdate(prevProps) {
  // Обычное использование (не забудьте сравнить свойства):
  if (this.props.userID !== prevProps.userID) {
    this.fetchData(this.props.userID);
  }
}
```
componentDidUpdate() не будет вызываться, если shouldComponentUpdate() возвращает false.

---
### componentWillUnmount()
вызывается непосредственно перед размонтированием и уничтожением компонента.

---
### shouldComponentUpdate()
    shouldComponentUpdate(nextProps, nextState)

Используйте shouldComponentUpdate(), чтобы позволить React знать, не влияет ли на результат компонента текущее изменение состояния или свойства.
shouldComponentUpdate()вызывается перед отрисовкой при получении новых свойств или состояний.



[Назад](https://teratron.github.io/cheatsheet/react/)
