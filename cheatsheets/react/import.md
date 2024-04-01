# Import

← [Назад][back]

### import()

```react
// До:
import { add } from './math';
console.log(add(16, 26));

// После (динамический импорт):
import("./math").then(math => {
    console.log(math.add(16, 26));
});
```

### React.lazy

Функция `React.lazy` позволяет рендерить динамический импорт как обычный компонент.

```react
// До:
import OtherComponent from './OtherComponent';

// После:
const OtherComponent = React.lazy(() => import('./OtherComponent'));
// Она автоматически загрузит бандл, содержащий OtherComponent,
// когда этот компонент будет впервые отрендерен.
```

### Задержка

```react
import React, { Suspense } from 'react';

const OtherComponent = React.lazy(() => import('./OtherComponent'));
const AnotherComponent = React.lazy(() => import('./AnotherComponent'));

function MyComponent() {
    return (
        <div>
            <Suspense fallback={<div>Загрузка...</div>}>
                <section>
                    <OtherComponent />
                    <AnotherComponent />
                </section>
            </Suspense>
        </div>
    );
}
```

### Разделение кода на основе маршрутов

```react
import React, { Suspense, lazy } from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

const Home = lazy(() => import('./routes/Home'));
const About = lazy(() => import('./routes/About'));

const App = () => (
    <Router>
        <Suspense fallback={<div>Загрузка...</div>}>
            <Switch>
                <Route exact path="/" component={Home}/>
                <Route path="/about" component={About}/>
            </Switch>
        </Suspense>
    </Router>
);
```

### Именованный экспорт

```react
// ManyComponents.js
export const MyComponent = /* ... */;
export const MyUnusedComponent = /* ... */;
```

```react
// MyComponent.js
export { MyComponent as default } from './ManyComponents.js';
```

```react
// MyApp.js
import React, { lazy } from 'react';
const MyComponent = lazy(() => import('./MyComponent.js'));
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"