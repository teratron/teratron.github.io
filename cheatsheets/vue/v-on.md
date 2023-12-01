# Обработка событий

[Назад][back]

---

## v-on

### Обработка ввода пользователя

```vue

<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {counter: 0}
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <button v-on:click="counter++">+</button>
        <span>{{counter}}</span>
        <button v-on:click="if(counter>0) counter--">-</button>
        <!-- или -->
        <button @click="counter++">+</button>
        <span>{{counter}}</span>
        <button @click="if(counter>0) counter--">-</button>
    </div>
</template>
```

```vue

<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {counter: 0}
        },
        methods: {
            increase() {
                this.counter++
            },
            decrease() {
                if (this.counter > 0) this.counter--
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <button @click="increase">+</button>
        <span>{{counter}}</span>
        <button @click="decrease">-</button>
    </div>
</template>
```

### Передача параметров в обработчик событий

```vue

<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {counter: 0}
        },
        methods: {
            increase(n) {
                this.counter = this.counter + n
            },
            decrease(n) {
                if (this.counter > 0) this.counter = this.counter - n
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <button v-on:click="increase(4)">+</button>
        <span>{{counter}}</span>
        <button v-on:click="decrease(2)">-</button>
    </div>
</template>
```

### Получение объекта события

```vue

<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {counter: 0}
        },
        methods: {
            increase(event) {
                console.log(event)
                this.counter++
            },
            decrease(event) {
                console.log(event)
                if (this.counter > 0) this.counter--
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <button v-on:click="increase($event)">+</button>
        <span>{{counter}}</span>
        <button v-on:click="decrease($event)">-</button>
    </div>
</template>
```

```vue

<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {counter: 0}
        },
        methods: {
            increase(n, event) {
                console.log(event)
                this.counter = this.counter + n
            },
            decrease(n, event) {
                console.log(event)
                if (this.counter > 0) this.counter = this.counter - n
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <button v-on:click="increase(4, $event)">+</button>
        <span>{{counter}}</span>
        <button v-on:click="decrease(2, $event)">-</button>
    </div>
</template>
```

### Множественная обработка событий

```vue

<script setup>
    const vueApp = Vue.createApp({
        data() {
            return {
                counter: 0,
                status: ''
            }
        },
        methods: {
            increase(n) {
                this.counter = this.counter + n
            },
            inform() {
                this.status = 'Время нажатия кнопки: ' + new Date().toLocaleString()
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <button v-on:click="increase(2), inform">+</button>
        <span>{{counter}}</span>
        <div>{{status}}</div>
    </div>
</template>
```

---

[Назад][back]

[back]: <.> "Назад к оглавлению"