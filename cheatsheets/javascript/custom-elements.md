# Пользовательские элементы (Custom Elements)

[Назад][back]

#### Существует два вида пользовательских элементов:

- Автономные пользовательские элементы – «полностью новые» элементы, расширяющие абстрактный класс HTMLElement.
- Пользовательские встроенные элементы – элементы, расширяющие встроенные, например кнопку HTMLButtonElement и т.п.

```javascript
class MyElement extends HTMLElement {
  constructor() {
    super();
    // элемент создан
  }

  connectedCallback() {
    // браузер вызывает этот метод при добавлении элемента в документ
    // (может вызываться много раз, если элемент многократно добавляется/удаляется)
  }

  disconnectedCallback() {
    // браузер вызывает этот метод при удалении элемента из документа
    // (может вызываться много раз, если элемент многократно добавляется/удаляется)
  }

  static get observedAttributes() {
    return [/* массив имён атрибутов для отслеживания их изменений */];
  }

  attributeChangedCallback(name, oldValue, newValue) {
    // вызывается при изменении одного из перечисленных выше атрибутов
  }

  adoptedCallback() {
    // вызывается, когда элемент перемещается в новый документ
    // (происходит в document.adoptNode, используется очень редко)
  }

  // у элемента могут быть ещё другие методы и свойства
}
```

После этого нам нужно зарегистрировать элемент:

```javascript
// сообщим браузеру, что <my-element> обслуживается нашим новым классом
customElements.define("my-element", MyElement);
```

### Пример: «time-formatted»

```html
<script>
    // Класс имеет только один метод connectedCallback() – браузер вызывает его,
    // когда элемент <time-formatted> добавляется на страницу (или когда HTML-парсер обнаруживает его),
    // и он использует встроенный форматировщик данных Intl.DateTimeFormat,
    // хорошо поддерживаемый в браузерах, чтобы показать красиво отформатированное время.
    class TimeFormatted extends HTMLElement {

        connectedCallback() {
        let date = new Date(this.getAttribute('datetime') || Date.now());

        this.innerHTML = new Intl.DateTimeFormat("default", {
                year: this.getAttribute('year') || undefined,
                month: this.getAttribute('month') || undefined,
                day: this.getAttribute('day') || undefined,
                hour: this.getAttribute('hour') || undefined,
                minute: this.getAttribute('minute') || undefined,
                second: this.getAttribute('second') || undefined,
                timeZoneName: this.getAttribute('time-zone-name') || undefined,
            }).format(date);
        }
    }

    // Нам нужно зарегистрировать наш новый элемент, используя customElements.define(tag, class).
    customElements.define("time-formatted", TimeFormatted);
</script>

// И тогда мы сможем использовать его везде.
<time-formatted datetime="2019-12-01"
                year="numeric" month="long" day="numeric"
                hour="numeric" minute="numeric" second="numeric"
                time-zone-name="short"
></time-formatted>
```

```javascript

```

```javascript

```

[Назад][back]

[back]: <../.> "Назад к оглавлению"
