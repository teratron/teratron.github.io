# Вычисляемые свойства

[Назад][back]

---

```vue

<script setup>
    Vue.createApp({
        data() {
            return {
                name: 'Tom',
                age: 25
            }
        },
        computed: {
            enabled: function () {
                console.log("computed")
                if (this.age > 18) return "доступ разрешен"
                else return "доступ запрещен"
            }
        },
        methods: {
            checkAge: function () {
                console.log("checkAge")
                if (this.age > 18) return "доступ разрешен"
                else return "доступ запрещен"
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <input type="text" v-model="name"/>
        <input type="text" v-model="age"/>
        <p>Имя: {{ name }} Возраст {{ age }}</p>
        <p>{{ checkAge() }}</p>
        <p>{{ enabled }}</p>
    </div>
</template>
```

## Сеттеры и Геттеры

```vue

<script setup>
    Vue.createApp({
        data() {
            return {
                firstname: 'Tom',
                lastname: 'Smith'
            }
        },
        computed: {
            fullname: {
                get: function () {
                    return this.firstname + ' ' + this.lastname
                },
                set: function (newValue) {
                    const names = newValue.split(' ')
                    this.firstname = names[0]
                    this.lastname = names[names.length - 1]
                }
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <input type="text" v-model="firstname"/>
        <input type="text" v-model="lastname"/>
        <input type="text" v-model="fullname"/>
        <p>Имя: {{ fullname }}</p>
    </div>
</template>
```

---

[Назад][back]

[back]: <.> "Назад к оглавлению"