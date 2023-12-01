# Объект приложения Vue

[Назад][back]

---

```vue
<script setup>
    const vueApp = Vue.createApp({})
    vueApp.mount('#app')
</script>

<template>
    <div id="app"></div>
</template>
```

## Данные приложения

```vue
<script setup>
    Vue.createApp({
        data() {
            return {
                name: 'Tom',
                age: 36
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <p>Name: {{ name }}</p>
        <p>Age: {{ age }}</p>
    </div>
</template>
```

```vue
<script setup>
    const tom = {name: 'Tom', age: 36}
    const vueApp = Vue.createApp({
        data() {
            return tom
        },
        mounted() {
            // получение данных
            console.log(this.age)    // 36

            // изменение данных
            this.age = 25;
            console.log(this.age)    // 25
        }
    })

    vueApp.mount('#app')
</script>

<template>
    <div id="app">
        <p>Name: {{ name }}</p>
        <p>Age: {{ age }}</p>
    </div>
</template>
```

## Методы

```vue
<script setup>
    Vue.createApp({
        data() {
            return {name: 'Tom', age: 36}
        },
        methods: {
            welcome() {
                return 'Welcome ' + this.name
            },
            displayUser() {
                return 'UserInfo: name ' + this.name + '  age ' + this.age
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <p>{{ welcome() }}</p>
        <p>{{ displayUser() }}</p>
    </div>
</template>
```

```vue
<script setup>
    const app = Vue.createApp({
        data() {
            return {name: 'Tom', age: 36}
        },
        methods: {
            incrementAge() {
                this.age++
            },
            incrementAgeThreeTimes() {
                this.incrementAge()
                this.incrementAge()
                this.incrementAge()
            }
        }
    }).mount('#app')

    app.incrementAgeTreeTimes()
</script>

<template>
    <div id="app">
        <p>Name: {{ name }}</p>
        <p>Age: {{ age }}</p>
    </div>
</template>
```

---

[Назад][back]

[back]: <.> "Назад к оглавлению"