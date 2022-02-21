//--------------------------------------------- ReactDOM.createPortal //--------------------------------------------- //
Порталы позволяют рендерить дочерние элементы в DOM-узел, который находится вне DOM-иерархии родительского компонента.

ReactDOM.createPortal(child, container)

child // это любой React-компонент, который может быть отрендерен, такой как элемент, строка или фрагмент. container //
это DOM-элемент.

//--------------------------------------------- // Всплытие событий через порталы
//--------------------------------------------- // Родительский компонент в #app-root сможет поймать неперехваченное
всплывающее событие из соседнего узла #modal-root.
<html>
  <body>
    <div id="app-root"></div>
    <div id="modal-root"></div>
  </body>
</html>

// Это два соседних контейнера в DOM:
const appRoot = document.getElementById('app-root'); const modalRoot = document.getElementById('modal-root');

class Modal extends React.Component { constructor(props) { super(props); this.el = document.createElement('div'); }

componentDidMount() { // Элемент портала добавляется в DOM-дерево после того, как // потомки компонента Modal будут
смонтированы, это значит, // что потомки будут монтироваться на неприсоединённом DOM-узле. // Если дочерний компонент
должен быть присоединён к DOM-дереву // сразу при подключении, например, для замеров DOM-узла, // или вызова в потомке '
autoFocus', добавьте в компонент Modal // состояние и рендерите потомков только тогда, когда // компонент Modal уже
вставлен в DOM-дерево. modalRoot.appendChild(this.el); }

componentWillUnmount() { modalRoot.removeChild(this.el); }

render() { return ReactDOM.createPortal(
this.props.children, this.el
); } }

class Parent extends React.Component { constructor(props) { super(props); this.state = {clicks: 0}; this.handleClick =
this.handleClick.bind(this); }

handleClick() { // Эта функция будет вызвана при клике на кнопку в компоненте Child, // обновляя состояние компонента
Parent, несмотря на то, // что кнопка не является прямым потомком в DOM. this.setState(state => ({ clicks: state.clicks
+ 1 })); }

render() { return (
<div onClick={this.handleClick}>
<p>Количество кликов: {this.state.clicks}</p>
<p>
Откройте DevTools браузера, чтобы убедиться, что кнопка не является потомком блока div c обработчиком onClick.
</p>
<Modal>
<Child />
</Modal>
</div>
); } }

function Child() { // Событие клика на этой кнопке будет всплывать вверх к родителю, // так как здесь не определён
атрибут 'onClick' return (
<div className="modal">
<button>Кликните</button>
</div>
); }

ReactDOM.render(<Parent />, appRoot);




