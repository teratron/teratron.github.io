# Vue

[Назад к перечню шпаргалок][back]

---

## Содержание:

### [Объект приложения Vue](vue.md)

- data()
- mounted()
- methods

### [Привязка данных](binding.md)

- Интерполяция
- v-text
- v-bind
- v-once
- v-html

### [Обработка событий](v-on.md)

- v-on

### [Двусторонняя привязка](v-model.md)

- v-model

### [Вычисляемые свойства](computed.md)

- computed
- setter / getter

### [Наблюдаемые свойства](watch.md)

- watch

## Global API

| Keyword                          | Описание        | Пример |
|----------------------------------|-----------------|--------|
|                                  | **Application** |        |
| createApp()                      |                 |        |
| createSSRApp()                   |                 |        |
| app.mount()                      |                 |        |
| app.unmount()                    |                 |        |
| app.component()                  |                 |        |
| app.directive()                  |                 |        |
| app.use()                        |                 |        |
| app.mixin()                      |                 |        |
| app.provide()                    |                 |        |
| app.runWithContext()             |                 |        |
| app.version                      |                 |        |
| app.config                       |                 |        |
| app.config.errorHandler          |                 |        |
| app.config.warnHandler           |                 |        |
| app.config.performance           |                 |        |
| app.config.compilerOptions       |                 |        |
| app.config.globalProperties      |                 |        |
| app.config.optionMergeStrategies |                 |        |
|                                  | **General**     |        |
| version                          |                 |        |
| nextTick()                       |                 |        |
| defineComponent()                |                 |        |
| defineAsyncComponent()           |                 |        |
| defineCustomElement()            |                 |        |

## Composition API

| Keyword                     | Описание                  | Пример |
|-----------------------------|---------------------------|--------|
|                             | **setup()**               |        |
| Basic Usage                 |                           |        |
| Accessing Props             |                           |        |
| Setup Context               |                           |        |
| Usage with Render Functions |                           |        |
|                             | **Reactivity: Core**      |        |
| ref()                       |                           |        |
| computed()                  |                           |        |
| reactive()                  |                           |        |
| readonly()                  |                           |        |
| watchEffect()               |                           |        |
| watchPostEffect()           |                           |        |
| watchSyncEffect()           |                           |        |
| watch()                     |                           |        |
|                             | **Reactivity: Utilities** |        |
| isRef()                     |                           |        |
| unref()                     |                           |        |
| toRef()                     |                           |        |
| toValue()                   |                           |        |
| toRefs()                    |                           |        |
| isProxy()                   |                           |        |
| isReactive()                |                           |        |
| isReadonly()                |                           |        |
|                             | **Reactivity: Advanced**  |        |
| shallowRef()                |                           |        |
| triggerRef()                |                           |        |
| customRef()                 |                           |        |
| shallowReactive()           |                           |        |
| shallowReadonly()           |                           |        |
| toRaw()                     |                           |        |
| markRaw()                   |                           |        |
| effectScope()               |                           |        |
| getCurrentScope()           |                           |        |
| onScopeDispose()            |                           |        |
|                             | **Lifecycle Hooks**       |        |
| onMounted()                 |                           |        |
| onUpdated()                 |                           |        |
| onUnmounted()               |                           |        |
| onBeforeMount()             |                           |        |
| onBeforeUpdate()            |                           |        |
| onBeforeUnmount()           |                           |        |
| onErrorCaptured()           |                           |        |
| onRenderTracked()           |                           |        |
| onRenderTriggered()         |                           |        |
| onActivated()               |                           |        |
| onDeactivated()             |                           |        |
| onServerPrefetch()          |                           |        |
|                             | **Dependency Injection**  |        |
| provide()                   |                           |        |
| inject()                    |                           |        |
| hasInjectionContext()       |                           |        |

## Options API

| Keyword         | Описание                 | Пример |
|-----------------|--------------------------|--------|
|                 | **Options: State**       |        |
| data            |                          |        |
| props           |                          |        |
| computed        |                          |        |
| methods         |                          |        |
| watch           |                          |        |
| emits           |                          |        |
| expose          |                          |        |
|                 | **Options: Rendering**   |        |
| template        |                          |        |
| render          |                          |        |
| compilerOptions |                          |        |
| slots           |                          |        |
|                 | **Options: Lifecycle**   |        |
| beforeCreate    |                          |        |
| created         |                          |        |
| beforeMount     |                          |        |
| mounted         |                          |        |
| beforeUpdate    |                          |        |
| updated         |                          |        |
| beforeUnmount   |                          |        |
| unmounted       |                          |        |
| errorCaptured   |                          |        |
| renderTracked   |                          |        |
| renderTriggered |                          |        |
| activated       |                          |        |
| deactivated     |                          |        |
| serverPrefetch  |                          |        |
|                 | **Options: Composition** |        |
| provide         |                          |        |
| inject          |                          |        |
| mixins          |                          |        |
| extends         |                          |        |
|                 | **Options: Misc**        |        |
| name            |                          |        |
| inheritAttrs    |                          |        |
| components      |                          |        |
| directives      |                          |        |
|                 | **Component Instance**   |        |  
| $data           |                          |        |
| $props          |                          |        |
| $el             |                          |        |
| $options        |                          |        |
| $parent         |                          |        |
| $root           |                          |        |
| $slots          |                          |        |
| $refs           |                          |        |
| $attrs          |                          |        |
| $watch()        |                          |        |
| $emit()         |                          |        |
| $forceUpdate()  |                          |        |
| $nextTick()     |                          |        |

## Built-ins

| Keyword             | Описание               | Пример |
|---------------------|------------------------|--------|
|                     | **Directives**         |        |
| v-text              |                        |        |
| v-html              |                        |        |
| v-show              |                        |        |
| v-if                |                        |        |
| v-else              |                        |        |
| v-else-if           |                        |        |
| v-for               |                        |        |
| v-on                |                        |        |
| v-bind              |                        |        |
| v-model             |                        |        |
| v-slot              |                        |        |
| v-pre               |                        |        |
| v-once              |                        |        |
| v-memo              |                        |        |
| v-cloak             |                        |        |
|                     | **Special Attributes** |        |
| key                 |                        |        |
| ref                 |                        |        |
| is                  |                        |        |
|                     | **Components**         |        |
| `<Transition>`      |                        |        |
| `<TransitionGroup>` |                        |        |
| `<KeepAlive>`       |                        |        |
| `<Teleport>`        |                        |        |
| `<Suspense>`        |                        |        |
|                     | **Special Elements**   |        |
| `<component>`       |                        |        |
| `<slot>`            |                        |        |
| `<template>`        |                        |        |

## Single-File Component

| Keyword | Описание | Пример |
|---------|----------|--------|

## Advanced APIs

| Keyword | Описание | Пример |
|---------|----------|--------|

## Ссылки:

[https://vuejs.org](https://vuejs.org)\
[https://router.vuejs.org](https://router.vuejs.org)\
[https://vue-router-ru.netlify.app](https://vue-router-ru.netlify.app)\
[https://metanit.com/web/vue](https://metanit.com/web/vue)

---

[Назад к перечню шпаргалок][back]

[back]: <../.> "Назад к перечню шпаргалок"