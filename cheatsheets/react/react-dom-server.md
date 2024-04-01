# ReactDOMServer

← [Назад][back]

Объект **ReactDOMServer** позволяет отрендерить компоненты в статическую разметку. В основном, он используется на
Node-сервере.

**ES-модули**

    import ReactDOMServer from 'react-dom/server';

**CommonJS**

    var ReactDOMServer = require('react-dom/server');

**Методы:**

- renderToString()
- renderToStaticMarkup()

Следующие методы зависят от пакета _stream_, поэтому доступны только на сервере и не будут работать в браузере.

- renderToNodeStream()
- renderToStaticNodeStream()

### renderToString()

```react
ReactDOMServer.renderToString(element)
```

Рендерит React-элемент в исходный HTML и возвращает его в виде строки. Вы можете использовать этот метод, чтобы
сгенерировать HTML на сервере и отправить разметку в ответ на запрос, ускоряя загрузку страницы и позволяя поисковым
движкам обработать ваши страницы для SEO.

### renderToStaticMarkup()

```react
ReactDOMServer.renderToStaticMarkup(element)
```

Похож на метод renderToString, но не создаёт дополнительных DOM-атрибутов, таких, как `data-reactroot`, используемых
внутри React. Этот метод полезен, когда вы хотите использовать React для генерации простой статической страницы, где
отсутствие дополнительных атрибутов может сохранить несколько байтов.

### renderToNodeStream()

```react
ReactDOMServer.renderToNodeStream(element)
```

Рендерит React-элемент в исходный HTML. Возвращает поток для чтения, который выводит HTML-строку. HTML из потока
идентичен тому, что возвращает `ReactDOMServer.renderToString`. Вы можете использовать этот метод, чтобы сгенерировать
HTML на сервере и отправить разметку в ответ на запрос, ускоряя загрузку страницы и позволяя поисковым движкам
обработать ваши страницы для SEO.

### renderToStaticNodeStream()

```react
ReactDOMServer.renderToStaticNodeStream(element)
```

Похож на метод renderToNodeStream, но не создаёт дополнительных DOM-атрибутов, таких, как `data-reactroot`, используемых
внутри React. Метод полезен, когда вы хотите использовать React для генерации простой статической страницы, где
отсутствие дополнительных атрибутов может сохранить несколько байтов.

← [Назад][back]

[back]: <.> "Назад к оглавлению"