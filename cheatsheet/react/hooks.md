# Hooks

#### Основные хуки:

- useState
- useEffect
- useContext

#### Дополнительные хуки:

- useReducer
- useCallback
- useMemo
- useRef
- useImperativeHandle
- useLayoutEffect
- useDebugValue

### useState

```react
// Такой синтаксис в JavaScript называется «деструктуризацией массивов (array destructuring)».
// Он означает, что мы создаём две новые переменные, fruit и setFruit.
const [fruit, setFruit] = useState('банан');
```

Во fruit будет записано первое значение, вернувшееся из useState, а в setFruit — второе, что равносильно такому коду:

```react
let fruitStateVariable = useState('банан'); // Возвращает пару значений
let fruit = fruitStateVariable[0];          // Извлекаем первое значение
let setFruit = fruitStateVariable[1];       // Извлекаем второе значение
```

```react
const [state, setState] = useState(initialState);

// Функция setState используется для обновления состояния.
// Она принимает новое значение состояния и ставит в очередь повторный рендер компонента.
setState(newState);

function Counter({initialCount}) {
  const [count, setCount] = useState(initialCount);
  return (
    <>
      Счёт: {count}
      <button onClick={() => setCount(initialCount)}>Сбросить</button>
      <button onClick={() => setCount(prevCount => prevCount - 1)}>-</button>
      <button onClick={() => setCount(prevCount => prevCount + 1)}>+</button>
    </>
  );
}
```

```react
// Ленивая инициализация состояния
const [state, setState] = useState(() => {
  const initialState = someExpensiveComputation(props);
  return initialState;
});
```

### useEffect

Принимает функцию, которая содержит императивный код, возможно, с эффектами. По умолчанию эффекты запускаются после
каждого завершённого рендеринга, но вы можете решить запускать их только при изменении определённых значений.

```react
useEffect(didUpdate);

// Очистка эффекта
useEffect(() => {
  const subscription = props.source.subscribe();
  return () => {
    // Очистить подписку
    subscription.unsubscribe();
  };
});
// Функция очистки запускается до удаления компонента из пользовательского интерфейса,
// чтобы предотвратить утечки памяти.
// Кроме того, если компонент рендерится несколько раз (как обычно происходит),
// предыдущий эффект очищается перед выполнением следующего эффекта.
```

```react
useEffect(
  () => {
    const subscription = props.source.subscribe();
    return () => {
      subscription.unsubscribe();
    };
  },
  [props.source],
);
// Теперь подписка будет создана повторно только при изменении props.source.
```

Если вы хотите запустить эффект и сбросить его только один раз (при монтировании и размонтировании), вы можете передать
пустой массив (`[]`) вторым аргументом.

### useContext

Принимает объект контекста (значение, возвращённое из `React.createContext`) и возвращает текущее значение контекста для
этого контекста.

```react
const value = useContext(MyContext);

const themes = {
  light: {
    foreground: "#000000",
    background: "#eeeeee"
  },
  dark: {
    foreground: "#ffffff",
    background: "#222222"
  }
};

const ThemeContext = React.createContext(themes.light);

function App() {
  return (
    <ThemeContext.Provider value={themes.dark}>
      <Toolbar />
    </ThemeContext.Provider>
  );
}

function Toolbar(props) {
  return (
    <div>
      <ThemedButton />
    </div>
  );
}

function ThemedButton() {
  const theme = useContext(ThemeContext);
  return (
    <button style={{background: theme.background, color: theme.foreground}}>
      Я стилизован темой из контекста!
    </button>
  );
}
```

### useReducer

Альтернатива для `useState`.\
Принимает редюсер типа `(state, action) => newState` и возвращает текущее состояние в паре с методом dispatch.

```react
const [state, dispatch] = useReducer(reducer, initialArg, init);
```

Хук `useReducer` обычно предпочтительнее `useState`, когда у вас сложная логика состояния, которая включает в себя
несколько значений, или когда следующее состояние зависит от предыдущего.

```react
const initialState = {count: 0};

function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return {count: state.count + 1};
    case 'decrement':
      return {count: state.count - 1};
    default:
      throw new Error();
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, initialState);
  return (
    <>
      Count: {state.count}
      <button onClick={() => dispatch({type: 'decrement'})}>-</button>
      <button onClick={() => dispatch({type: 'increment'})}>+</button>
    </>
  );
}

// Указание начального состояния
const [state, dispatch] = useReducer(
    reducer,
    {count: initialCount}
);

// Ленивая инициализация
function init(initialCount) {
  return {count: initialCount};
}

function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return {count: state.count + 1};
    case 'decrement':
      return {count: state.count - 1};
    case 'reset':
      return init(action.payload);
    default:
      throw new Error();
  }
}

function Counter({initialCount}) {
  const [state, dispatch] = useReducer(reducer, initialCount, init);
  return (
    <>
      Count: {state.count}
      <button onClick={() => dispatch({type: 'reset', payload: initialCount})}>Reset</button>
      <button onClick={() => dispatch({type: 'decrement'})}>-</button>
      <button onClick={() => dispatch({type: 'increment'})}>+</button>
    </>
  );
}
```

### useCallback

Вернёт мемоизированную версию колбэка, который изменяется только, если изменяются значения одной из зависимостей.

```react
const memoizedCallback = useCallback(
  () => { doSomething(a, b); },
  [a, b],
);
```

`useCallback(fn, deps)` — это эквивалент `useMemo(() => fn, deps)`.

### useMemo

Возвращает мемоизированное значение.\
функция, переданная useMemo, запускается во время рендеринга.

```react
const memoizedValue = useMemo(
    () => computeExpensiveValue(a, b),
    [a, b]
);
```

### useRef

Возвращает изменяемый ref-объект, свойство `.current` которого инициализируется переданным аргументом (initialValue).
Возвращённый объект будет сохраняться в течение всего времени жизни компонента.

const refContainer = useRef(initialValue);

function TextInputWithFocusButton() { const inputEl = useRef(null); const onButtonClick = () => { // `current` указывает
на смонтированный элемент `input`
inputEl.current.focus(); };

return (
<>
<input ref={inputEl} type="text" />
<button onClick={onButtonClick}>Установить фокус на поле ввода</button>
</>
); }

### useImperativeHandle

// настраивает значение экземпляра, которое предоставляется родительским компонентам при использовании ref. // Как
всегда, в большинстве случаев следует избегать императивного кода, использующего ссылки. // useImperativeHandle должен
использоваться с forwardRef:
useImperativeHandle(ref, createHandle, [deps])

function FancyInput(props, ref) { const inputRef = useRef(); useImperativeHandle(ref, () => ({ focus: () => {
inputRef.current.focus(); } })); return <input ref={inputRef} ... />; }

FancyInput = forwardRef(FancyInput); // В этом примере родительский компонент, который
отображает <FancyInput ref={inputRef} />, // сможет вызывать inputRef.current.focus().

### useLayoutEffect

Сигнатура идентична `useEffect`, но этот хук запускается синхронно после всех изменений DOM. Используйте его для чтения
макета из DOM и синхронного повторного рендеринга.

### useDebugValue

// может использоваться для отображения метки для пользовательских хуков в React DevTools. useDebugValue(value)

function useFriendStatus(friendID) { const [isOnline, setIsOnline] = useState(null);

// ...

// Показывать ярлык в DevTools рядом с этим хуком // например, «Статус друга: В сети» useDebugValue(isOnline ? 'В
сети' : 'Не в сети');

return isOnline; }





