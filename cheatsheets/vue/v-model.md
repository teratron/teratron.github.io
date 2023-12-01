# Двусторонняя привязка данных

[Назад][back]

---

## v-model

Применяться только к html-элементам `<input>`, `<select>`, `<textarea>` и к компонентам Vue.

`v-model` игнорирует значения атрибутов `value`, `checked` и `selected` полей ввода, а для установки начального значения следует использовать свойства объекта из кода javascript.

```vue

<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {userName: 'Tom'}
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <p>Введите имя:
            <input type="text" v-model="userName" placeholder="Введите имя"/>
        </p>
        <p>Ваше имя: {{userName}}</p>
    </div>
</template>
```

```vue

<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {
                width: 20,
                height: 10
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <p>Ширина:
            <input type="number" v-model="width" placeholder="Введите ширину"/>
        </p>
        <p>Высота:
            <input type="number" v-model="height" placeholder="Введите высоту"/>
        </p>
        <p>Площаль прямоугольника: {{width * height}}</p>
    </div>
</template>
```

---

[Назад][back]

[back]: <.> "Назад к оглавлению"