# Context

[Назад][back]

### React.createContext

Создаёт объект Context.\
Когда React рендерит компонент, который подписан на этот объект, React получит текущее значение контекста из ближайшего
подходящего Provider выше в дереве компонентов.

```javascript
const MyContext = React.createContext(defaultValue);
```

### Context.Provider

Каждый объект Context используется вместе с Provider компонентом, который позволяет дочерним компонентам, использующим
этот контекст, подписаться на его изменения.

```javascript
<MyContext.Provider value={/* некоторое значение */}>
```

### Class.contextType

В свойство класса contextType может быть назначен объект контекста, созданный с помощью `React.createContext()`.

```javascript
class MyClass extends React.Component {
    componentDidMount() {
        let value = this.context;
        /* выполнить побочный эффект на этапе монтирования, используя значение MyContext */
    }
    componentDidUpdate() {
        let value = this.context;
        /* ... */
    }
    componentWillUnmount() {
        let value = this.context;
        /* ... */
    }
    render() {
        let value = this.context;
        /* отрендерить что-то, используя значение MyContext */
    }
}
```

```javascript
MyClass.contextType = MyContext;
// С помощью этого свойства вы можете использовать ближайшее и актуальное значение указанного контекста при помощи this.context.

class MyClass extends React.Component {
    static contextType = MyContext;
    render() {
        let value = this.context;
        /* отрендерить что-то, используя значение MyContext */
    }
}
```

### Context.Consumer

Consumer — это React-компонент, который подписывается на изменения контекста.\
В свою очередь, использование этого компонента позволяет вам подписаться на контекст в функциональном компоненте.

```javascript
<MyContext.Consumer>
    {value => /* отрендерить что-то, используя значение контекста */}
</MyContext.Consumer>
```

### Context.displayName

Объекту Context можно задать строковое свойство `displayName`. React DevTools использует это свойство при отображении
контекста.

```javascript
const MyContext = React.createContext(/* некоторое значение */);
MyContext.displayName = 'MyDisplayName';

<MyContext.Provider /> // "MyDisplayName.Provider" в DevTools
<MyContext.Consumer /> // "MyDisplayName.Consumer" в DevTools
```

### Динамический контекст

```javascript
// theme-context.js
export const themes = {
    light: {
        foreground: '#000000',
        background: '#eeeeee',
    },
    dark: {
        foreground: '#ffffff',
        background: '#222222',
    },
};

export const ThemeContext = React.createContext(themes.dark); // значение по умолчанию
```

```javascript
// themed-button.js
import {ThemeContext} from './theme-context';

class ThemedButton extends React.Component {
    render() {
        let props = this.props;
        let theme = this.context;
        return (
            <button
                {...props}
                style={{backgroundColor: theme.background}}
            />
        );
    }
}
ThemedButton.contextType = ThemeContext;

export default ThemedButton;
```

```javascript
// app.js
import {ThemeContext, themes} from './theme-context';
import ThemedButton from './themed-button';

// Промежуточный компонент, который использует ThemedButton
function Toolbar(props) {
    return (
        <ThemedButton onClick={props.changeTheme}>Change Theme</ThemedButton>
    );
}

class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            theme: themes.light,
        };
    
        this.toggleTheme = () => {
          this.setState(state => ({
            theme:
              state.theme === themes.dark
                ? themes.light
                : themes.dark,
          }));
        };
    }

    render() {
        // ThemedButton внутри ThemeProvider использует
        // значение светлой UI-темы из состояния, в то время как
        // ThemedButton, который находится вне ThemeProvider,
        // использует тёмную UI-тему из значения по умолчанию
        return (
            <Page>
                <ThemeContext.Provider value={this.state.theme}>
                    <Toolbar changeTheme={this.toggleTheme} />
                </ThemeContext.Provider>
                <Section>
                    <ThemedButton />
                </Section>
            </Page>
        );
    }
}

ReactDOM.render(<App />, document.root);
```

### Изменение контекста из вложенного компонента

```javascript
// theme-context.js
// Убедитесь, что форма значения по умолчанию,
// передаваемого в createContext, совпадает с формой объекта,
// которую ожидают потребители контекста.
export const ThemeContext = React.createContext({
    theme: themes.dark,
    toggleTheme: () => {},
});
```

```javascript
// theme-toggler-button.js
import {ThemeContext} from './theme-context';

function ThemeTogglerButton() {
    // ThemeTogglerButton получает из контекста
    // не только значение UI-темы, но и функцию toggleTheme.
    return (
        <ThemeContext.Consumer>
            {({theme, toggleTheme}) => (
                <button
                    onClick={toggleTheme}
                    style={{backgroundColor: theme.background}}>
                    Toggle Theme
                </button>
            )}
        </ThemeContext.Consumer>
    );
}

export default ThemeTogglerButton;
```

```javascript
// app.js
import {ThemeContext, themes} from './theme-context';
import ThemeTogglerButton from './theme-toggler-button';

class App extends React.Component {
    constructor(props) {
        super(props);

        this.toggleTheme = () => {
          this.setState(state => ({
            theme:
              state.theme === themes.dark
                ? themes.light
                : themes.dark,
          }));
        };

        // Состояние хранит функцию для обновления контекста,
        // которая будет также передана в Provider-компонент.
        this.state = {
          theme: themes.light,
          toggleTheme: this.toggleTheme,
        };
    }

    render() {
        // Всё состояние передаётся в качестве значения контекста
        return (
            <ThemeContext.Provider value={this.state}>
                <Content />
            </ThemeContext.Provider>
        );
    }
}

function Content() {
    return (
        <div>
            <ThemeTogglerButton />
        </div>
    );
}

ReactDOM.render(<App />, document.root);
```

### Использование нескольких контекстов

```javascript
// Контекст UI-темы, со светлым значением по умолчанию
const ThemeContext = React.createContext('light');

// Контекст активного пользователя
const UserContext = React.createContext({
    name: 'Guest',
});

class App extends React.Component {
    render() {
        const {signedInUser, theme} = this.props;
    
        // Компонент App, который предоставляет начальные значения контекстов
        return (
          <ThemeContext.Provider value={theme}>
            <UserContext.Provider value={signedInUser}>
              <Layout />
            </UserContext.Provider>
          </ThemeContext.Provider>
        );
    }
}

function Layout() {
    return (
        <div>
            <Sidebar />
            <Content />
        </div>
    );
}

// Компонент, который может использовать несколько контекстов
function Content() {
    return (
        <ThemeContext.Consumer>
            {theme => (
                <UserContext.Consumer>
                    {user => (
                        <ProfilePage user={user} theme={theme} />
                    )}
                </UserContext.Consumer>
            )}
        </ThemeContext.Consumer>
    );
}
```

### Когда использовать контекст

```javascript
// Ниже мы вручную передаём props theme
class App extends React.Component {
    render() {
        return <Toolbar theme="dark" />;
    }
}

function Toolbar(props) {
    // Компонент Toolbar должен передать проп "theme" ниже,
    // фактически не используя его. Учитывая, что у вас в приложении
    // могут быть десятки компонентов, использующих UI-тему,
    // вам придётся передавать проп "theme" через все компоненты.
    // И в какой-то момент это станет большой проблемой.
    return (
        <div>
            <ThemedButton theme={props.theme} />
        </div>
    );
}

class ThemedButton extends React.Component {
    render() {
        return <Button theme={this.props.theme} />;
    }
}
```

```javascript
// Контекст позволяет передавать значение глубоко
// в дерево компонентов без явной передачи пропсов
// на каждом уровне. Создадим контекст для текущей
// UI-темы (со значением "light" по умолчанию).
const ThemeContext = React.createContext('light');

class App extends React.Component {
    render() {
        // Компонент Provider используется для передачи текущей
        // UI-темы вниз по дереву. Любой компонент может использовать
        // этот контекст и не важно, как глубоко он находится.
        // В этом примере мы передаём "dark" в качестве значения контекста.
        return (
            <ThemeContext.Provider value="dark">
                <Toolbar />
            </ThemeContext.Provider>
        );
    }
}

// Компонент, который находится в середине,
// больше не должен явно передавать тему вниз.
function Toolbar() {
    return (
        <div>
            <ThemedButton />
        </div>
    );
}

class ThemedButton extends React.Component {
    // Определяем contextType, чтобы получить значение контекста.
    // React найдёт (выше по дереву) ближайший Provider-компонент,
    // предоставляющий этот контекст, и использует его значение.
    // В этом примере значение UI-темы будет "dark".
    static contextType = ThemeContext;
    render() {
        return <Button theme={this.context} />;
    }
}
```

[Назад][back]

[back]: <.> "Назад к оглавлению"