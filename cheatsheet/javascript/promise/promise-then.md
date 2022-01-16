//------------------------------------------------------ // then
//------------------------------------------------------ promise.then(
function(result) { /* обработает успешное выполнение */ }, function(error) { /* обработает ошибку */ }
); function(result) // функция, которая выполняется, когда промис переходит в состояние «выполнен успешно», и получает
результат. function(error)  // функция, которая выполняется, когда промис переходит в состояние «выполнен с ошибкой», и
получает ошибку.

// Например, вот реакция на успешно выполненный промис:
let promise = new Promise(function(resolve, reject) { setTimeout(() => resolve("done!"), 1000); }); // resolve запустит
первую функцию, переданную в .then promise.then(
result => alert(result), // выведет "done!" через одну секунду error => alert(error) // не будет запущена
);

// А в случае ошибки в промисе – выполнится вторая:
let promise = new Promise(function(resolve, reject) { setTimeout(() => reject(new Error("Whoops!")), 1000); }); //
reject запустит вторую функцию, переданную в .then promise.then(
result => alert(result), // не будет запущена error => alert(error) // выведет "Error: Whoops!" спустя одну секунду
);

// Если мы заинтересованы только в результате успешного выполнения задачи, то в then можно передать только одну функцию:
let promise = new Promise(resolve => { setTimeout(() => resolve("done!"), 1000); }); promise.then(alert); // выведет "
done!" спустя одну секунду




