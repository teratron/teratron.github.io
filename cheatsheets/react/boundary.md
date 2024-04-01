# Boundary

← [Назад][back]

### Error Boundary

Если какой-то модуль не загружается (например, из-за сбоя сети), это вызовет ошибку. Вы можете обрабатывать эти ошибки
для улучшения пользовательского опыта с помощью Предохранителей.

```react
// my-component.js
import React, { Suspense } from 'react';
import ErrorBoundary from './ErrorBoundary';

const OtherComponent = React.lazy(() => import('./OtherComponent'));
const AnotherComponent = React.lazy(() => import('./AnotherComponent'));

const MyComponent = () => (
  <div>
    <ErrorBoundary>
      <Suspense fallback={<div>Загрузка...</div>}>
        <section>
          <OtherComponent />
          <AnotherComponent />
        </section>
      </Suspense>
    </ErrorBoundary>
  </div>
);
```

```react
// error-boundary.js
// Код для журналирования информации об отловленной ошибке:
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    // Обновить состояние с тем, чтобы следующий рендер показал запасной UI.
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    // Можно также сохранить информацию об ошибке в соответствующую службу журнала ошибок
    logErrorToMyService(error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      // Можно отрендерить запасной UI произвольного вида
      return <h1>Что-то пошло не так.</h1>;
    }

    return this.props.children; 
  }
}
```

Предохранители работают как JavaScript-блоки `catch {}`, но только для компонентов. Только классовые компоненты могут
выступать в роли предохранителей.

### Живой пример

```react
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { error: null, errorInfo: null };
  }
  
  componentDidCatch(error, errorInfo) {
    // Отловите ошибки в любых компонентах ниже и повторите визуализацию с сообщением об ошибке
    this.setState({
      error: error,
      errorInfo: errorInfo
    })
    // Вы также можете регистрировать сообщения об ошибках в службе отчетов об ошибках здесь
  }
  
  render() {
    if (this.state.errorInfo) {
      // Путь к ошибке
      return (
        <div>
          <h2>Something went wrong.</h2>
          <details style={{ whiteSpace: 'pre-wrap' }}>
            {this.state.error && this.state.error.toString()}
            <br />
            {this.state.errorInfo.componentStack}
          </details>
        </div>
      );
    }
    // Обычно, просто визуализируйте детей
    return this.props.children;
  }  
}

class BuggyCounter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { counter: 0 };
    this.handleClick = this.handleClick.bind(this);
  }
  
  handleClick() {
    this.setState(({counter}) => ({
      counter: counter + 1
    }));
  }
  
  render() {
    if (this.state.counter === 5) {
      // Имитация ошибки JS
      throw new Error('I crashed!');
    }
    return <h1 onClick={this.handleClick}>{this.state.counter}</h1>;
  }
}

function App() {
  return (
    <div>
      <p>
        <b>
		  Это пример предохранителя ошибок в React 16.
          <br /><br />
		  Нажмите на цифры, чтобы увеличить счетчики.
          <br />
		  Счетчик запрограммирован на выброс, когда он достигает 5. Это имитирует ошибку JavaScript в компоненте.
        </b>
      </p>
      <hr />
      
	  <ErrorBoundary>
        <p>
		Эти два счетчика находятся внутри одной и того же предохранителя ошибки. 
		Если один из них выйдет из строя, предохранитель ошибки заменит их обоих.
		</p>
        <BuggyCounter />
        <BuggyCounter />
      </ErrorBoundary>
      
	  <hr />
      <p>Эти два счетчика находятся каждый внутри своего собственного предохранителя ошибки. Поэтому, если один из них выйдет из строя, другой не пострадает.</p>
      
	  <ErrorBoundary>
		<BuggyCounter />
	  </ErrorBoundary>
      
	  <ErrorBoundary>
		<BuggyCounter />
	  </ErrorBoundary>
    </div>
  );
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

Чтобы отловить ошибку в обработчике событий, пользуйтесь обычной JavaScript-конструкцией `try` / `catch`:

```react
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = { error: null };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    try {
      // Делаем что-то, что сгенерирует ошибку
    } catch (error) {
      this.setState({ error });
    }
  }

  render() {
    if (this.state.error) {
      return <h1>Отловил ошибку.</h1>
    }
    return <button onClick={this.handleClick}>Нажми на меня</button>
  }
}
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"