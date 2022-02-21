//--------------------------------------------- // Рендер-пропсы //--------------------------------------------- //
Термин «рендер-проп» относится к возможности компонентов React разделять код между собой с помощью пропа, // значение
которого является функцией.

// Компонент с рендер-пропом берёт функцию, которая возвращает React-элемент, // и вызывает её вместо реализации
собственного рендера.
<DataProvider render={data => (
  <h1>Привет, {data.target}</h1>
)}/>

//--------------------------------------------- // Использование рендер-пропа для сквозных задач
//--------------------------------------------- // рендер-проп — функция, которая сообщает компоненту что необходимо
рендерить.

class Cat extends React.Component { render() { const mouse = this.props.mouse; return (
<img src="/cat.jpg" style={{ position: 'absolute', left: mouse.x, top: mouse.y }} />
); } }

class Mouse extends React.Component { constructor(props) { super(props); this.handleMouseMove =
this.handleMouseMove.bind(this); this.state = { x: 0, y: 0 }; }

handleMouseMove(event) { this.setState({ x: event.clientX, y: event.clientY }); }

render() { return (
<div style={{ height: '100vh' }} onMouseMove={this.handleMouseMove}>

        {/*
          Вместо статического представления того, что рендерит <Mouse>,
          используем рендер-проп для динамического определения, что надо отрендерить.
        */}
        {this.props.render(this.state)}
      </div>
    );

} }

class MouseTracker extends React.Component { renderTheCat(mouse) { return <Cat mouse={mouse} />; } render() { return (
<div>
<h1>Перемещайте курсор мыши!</h1>
//<Mouse render={mouse => (<Cat mouse={mouse} />)}/>
<Mouse render={this.renderTheCat} />
</div>
); } }

//--------------------------------------------- // Использование пропсов, отличных от render
//--------------------------------------------- //Несмотря на то, что в вышеприведённых примерах мы используем render,
// мы можем также легко использовать проп children!
<Mouse children={mouse => (
  <p>Текущее положение курсора мыши: {mouse.x}, {mouse.y}</p>
)}/>

// или

<Mouse>
  {mouse => (
    <p>Текущее положение курсора мыши: {mouse.x}, {mouse.y}</p>
  )}
</Mouse>

// Поскольку этот метод не совсем обычен, вы, вероятно, захотите явно указать, // что children должен быть функцией в
вашем propTypes при разработке такого API. Mouse.propTypes = { children: PropTypes.func.isRequired };




