# Array

### Создание нового массива

```javascript
var myArray = new Array();
// или
var myArray = [];
```

```javascript
var people = ["Tom", "Alice", "Sam"];
console.log(people[2]); // Sam
console.log(people[7]); // undefined
```

```javascript
let objects = ["Tom", 12, true, 3.14, false]; // массив не являются строго типизированным
```

```javascript

```

### Spread-оператор

```javascript
// spread-оператор ... позволяет взять значения из массива по отдельности:
let numbers = [1, 2, 3, 4];
console.log(...numbers);    // 1 2 3 4
console.log(numbers);       // [1, 2, 3, 4]
```

//------------------------------------------------------ // Многомерные массивы
//------------------------------------------------------ var numbers1 = [0, 1, 2, 3, 4, 5]; // одномерный массив var
numbers2 = [[0, 1, 2], [3, 4, 5]]; // двумерный массив

var people = [
["Tom", 25, false],
["Bill", 38, true],
["Alice", 21, false]
]; console.log(people[0]); // ["Tom", 25, false]
console.log(people[1]); // ["Bill", 38, true]

var numbers = []; numbers[0] = []; // теперь numbers - двумерный массив numbers[0][0] = []; // теперь numbers -
трехмерный массив numbers[0][0][0] = 5; // первый элемент трехмерного массива равен 5 console.log(numbers[0][0][0]);

### Методы массивов

| Метод | Описание|
|---|---|
| Array.concat()        | Используется для объединения двух, или более массивов в один, при этом он не изменяет существующие массивы, а Возвращает новый массив.
| Array.copyWithin()    | Позволяет скопировать элементы массива (в зависимости от их индекса) и вставить их в тот же массив, заменяя определенные элементы массива (в зависимости от их индекса), длина массива при этом не изменяется.
| Array.entries()       | Возвращает объект итератор, который содержит пары ключ/значение по каждому индексу в массиве.
| Array.every()         | Позволяет проверить (в порядке возрастания индекса), все ли элементы в массиве соответствуют условию заданному в передаваемой функции.
| Array.fill()          | Позволяет заполнить все элементы массива одним значением, при необходимости задавая значение начального индекса с которого начинается заполнение и конечное значение индекса, которым заканчивается заполнение.
| Array.filter()        | Позволяет создать новый массив, элементы которого соответствуют условию заданному в пререданной функции.
| Array.find()          | Возвращает значение первого элемента в массиве, который соответствует условию в переданной функции, или undefined, если ни один элемент не удовлетворяет условию в переданной функции.
| Array.findIndex()     | Возвращает значение индекса элемента в массиве, который соответствует условию в переданной функции, или -1, если ни один элемент не удовлетворяет условию в переданной функции.
| Array.forEach()       | Позволяет выполнить переданную функцию один раз для каждого элемента в массиве.
| Array.from()          | Преобразует и Возвращает новый массив из массивоподобного, или итерируемого объекта.
| Array.includes()      | Позволяет определить, содержит ли массив искомый элемент. В случае нахождения элемента метод Возвращает логическое значение true, в обратном случае false.
| Array.indexOf()       | Возвращает индекс искомого элемента в массиве при первом совпадении, или -1 если элемент не найден.
| Array.isArray()       | Определяет и Возвращает логическое значение true в том случае, если переданное значение является массивом и false, если оно не является массивом.
| Array.join()          | Позволяет преобразовать и объединить все элементы массива в одно строковое значение.
| Array.keys()          | Возвращает новый итератор, который Возвращает значения индексов массива.
| Array.lastIndexOf()   | Возвращает последний индекс искомого элемента в массиве при первом совпадении, или -1 если элемент не найден.
| Array.map()           | Позволяет вызвать переданную функцию один раз для каждого элемента массива, формируя новый массив из результатов вызова этой функции.
| Array.of()            | Создает новый экземпляр массива, значения которого соответствует количеству переданных аргументов (независимо от их типа и числа).
| Array.pop()           | Позволяет удалить последний элемент из массива и возвратить его значение. Этот метод изменяет длину массива.
| Array.push()          | Позволяет добавить один, или более элементов в конец массива. После вызова (добавления элементов) Возвращает значение соответствуюшее длине массива.
| Array.reduce()        | Позволяет вызвать функцию обратного вызова один раз для каждого элемента массива в порядке возрастания индекса (слева-направо). Возвращаемое значение функции предоставляется как аргумент при следующем вызове функции, в результате чего возвращаемое значение последнего вызова становится возвращаемым значением метода (значение вычисляется из элементов массива).
| Array.reduceRight()   | Позволяет вызвать функцию обратного вызова один раз для каждого элемента массива в порядке убывания индекса (справа-налево). Возвращаемое значение функции предоставляется как аргумент при следующем вызове функции, в результате чего возвращаемое значение последнего вызова становится возвращаемым значением метода (значение вычисляется из элементов массива).
| Array.reverse()       | Позволяет обратить порядок следования элементов массива, таким образом, что первый элемент массива становится последним, а последний элемент первым (размещает элементы объекта | Array в обратном порядке).
| Array.shift()         | Позволяет удалить первый элемент из массива и возвратить его значение. Этот метод изменяет длину массива.
| Array.slice()         | Позволяет возвратить новый массив, который содержит копии элементов, вырезанных из исходного массива.
| Array.some()          | Позволяет проверить соответствует ли по крайней мере один элемент в массиве условию, заданному в передаваемой функции.
| Array.sort()          | Позволяет отсортировать массив путём преобразования его элементов в строки, и сравнения этих строк в порядке следования кодовых символов Unicode ( сортирует массив по алфавиту).
| Array.splice()        | Позволяет изменить содержимое массива за счёт удаления существующих элементов, и/или добавления новых элементов в массив.
| Array.toLocaleString()| Позволяет преобразовать и объединить все элементы массива в одно строковое значение, при этом элементы массива в зависимости от их типа преобразуются в строки с использованием своих собственных методов toLocaleString().
| Array.toString()      | Позволяет преобразовать и объединить все элементы массива в одно строковое значение.
| Array.unshift()       | Позволяет добавить один, или более элементов в начало массива. После вызова (добавления элементов) Возвращает значение соответствуюшее длине массива.



