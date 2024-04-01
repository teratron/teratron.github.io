# Привязка данных

← [Назад][back]

---

## Интерполяция

```vue
<script setup>
    Vue.createApp({
        data() {
            return {name: 'Tom', age: 36}
        },
        methods: {
            sayHi() {
                return `Привет, меня зовут ${this.name}`
            },
            welcome(hour) {
                if (hour > 21) return 'Доброй ночи.'
                else if (hour > 16) return 'Добрый вечер!'
                else if (hour > 11) return 'Добрый день'
                else return 'Доброе утро'
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <p>{{name}} - {{age}}</p>
        <p>{{age > 25 ? 'Больше 25 лет' : '25 лет или меньше'}}</p>
        <p>{{sayHi()}}</p>
        <p>12 часов: {{welcome(15)}}</p>
        <p>22 часа: {{welcome(22)}}</p>
    </div>
</template>
```

## v-text

```vue
<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {name: 'Tom', age: 36}
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <div v-text="name"></div>
        <div v-text="age"></div>
    </div>
</template>
```

## v-bind

```vue
<script setup>
    Vue.createApp({
        data() {
            return {
                text: 'Google',
                title: 'google.com',
                link: 'https://google.com'
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <a v-bind:href="link" v-bind:title="title">{{text}}</a>
        <!-- или -->
        <a :href="link" :title="title">{{text}}</a>
    </div>
</template>
```

## v-once

```vue
<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {message: 'Hello'}
        }
    }).mount('#app')

    vueApp.message = 'Goodbye'
    console.log(vueApp.message) // Goodbye
</script>

<template>
    <div id="app">
        <p v-once>{{message}}</p>  <!-- Hello -->
    </div>
</template>
```

## v-html

```vue
<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {message: '<h2>Hello</h2>'}
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <div v-html="message"></div>
        <div>{{message}}</div>
    </div>
</template>
```

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"