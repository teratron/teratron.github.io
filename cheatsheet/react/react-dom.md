# ReactDOM

[Назад][back]

### render()

```react
ReactDOM.render(element, container[, callback])
```

Рендерит React-элемент в DOM-элемент, переданный в аргумент `container` и возвращает ссылку на компонент (или
возвращает `null` для компонентов без состояния).

### hydrate()

```react
ReactDOM.hydrate(element, container[, callback])
```

То же, что и `render()`, но используется для гидратации контейнера, HTML-содержимое которого было отрендерено с помощью
ReactDOMServer.

### unmountComponentAtNode()

```react
ReactDOM.unmountComponentAtNode(container)
```

Удаляет смонтированный компонент React из DOM и очищает его обработчики событий и состояние. Если в контейнер не было
смонтировано ни одного компонента, вызов этой функции ничего не делает. Возвращает `true`, если компонент был
размонтирован, и `false` если нет компонента для размонтирования.

### findDOMNode()

```react
ReactDOM.findDOMNode(component)
```

Это лазейка, используемая для доступа к базовому узлу DOM. Если этот компонент был смонтирован в DOM, он возвращает
соответствующий DOM элемент браузера.

### createPortal()

```react
ReactDOM.createPortal(child, container)
```

Создаёт портал. Порталы предоставляют способ отрендерить дочерние элементы в узле DOM, который существует вне иерархии
DOM-компонента.

[Назад][back]

[back]: <.> "Назад к оглавлению"