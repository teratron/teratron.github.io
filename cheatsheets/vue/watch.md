# Наблюдаемые свойства

← [Назад][back]

---

## watch

```vue

<script setup>
    Vue.createApp({
        data() {
            return {age: 0, result: ''}
        },
        watch: {
            age: function (newAge) {
                if (newAge > 0 && newAge < 110) {
                    this.check(newAge)
                }
            }
        },
        methods: {
            check: function (value) {
                this.result = 'Пожалуйста, подождите. Идет проверка...'
                const vm = this
                setTimeout(function () {
                    if (value > 18) vm.result = 'Доступ открыт'
                    else vm.result = 'Для возраста ' + value + ' доступ закрыт'
                }, 2000)
            }
        }
    }).mount('#app')
</script>

<template>
    <div id="app">
        <p>Введите возраст: <input v-model="age"/></p>
        <p>{{result}}</p>
    </div>
</template>
```

---

← [Назад][back]

[back]: <.> "Назад к оглавлению"