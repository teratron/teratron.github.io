//------------------------------------------------------ // Глобальный контекст
//------------------------------------------------------ // В глобальном контексте this ссылается на глобальный объект.
// В данном случае поведение не зависит от режима (строгий или нестрогий):
this.alert("global alert"); this.console.log("global console"); var currentDocument = this.document; // Но в данном
случае использвание this избыточно.

//------------------------------------------------------ // Контекст функции
//------------------------------------------------------ // В пределах функции this ссылается на внешний контекст. //
Для функций, определенных в глобальном контексте, - это объект Window, который представляет окно браузера. function
foo() { var bar = "bar2"; console.log(this.bar); } var bar = "bar1"; foo(); // bar1

//Если бы мы не использовали бы this, то обращение шло бы к локальной переменной, определенной внутри функции. function
foo() { var bar = "bar2"; console.log(bar); } var bar = "bar1"; foo(); // bar2

// Но если бы мы использовали строгий режим (strict mode), то this в этом случае имело бы значение undefined:
"use strict"; var obj = { function foo() { var bar = "bar2"; console.log(this.bar); } } var bar = "bar1"; foo(); //
ошибка - this - undefined

//------------------------------------------------------ // Контекст объекта
//------------------------------------------------------ // В контексте объекта, в том числе в его методах, ключевое
слово this ссылается на этот же объект:
var o = { bar: "bar3", foo: function() { console.log(this.bar); } }; var bar = "bar1"; o.foo(); // bar3

// Рассмотрим более сложный пример:
function foo() { var bar = "bar2"; console.log(this.bar); } var o3 = {bar: "bar3", foo: foo}; var o4 = {bar: "bar4",
foo: foo}; var bar = "bar1"; foo(); // bar1 o3.foo(); // bar3 o4.foo(); // bar4

// Ещё var o1 = { bar: "bar1", foo: function() { console.log(this.bar); } }; var o2 = {bar: "bar2", foo: o1.foo}; var
bar = "bar3"; var foo = o1.foo; o1.foo(); // bar1 o2.foo(); // bar2 foo(); // bar3

// Ещё var bar = "bar2"; function daz() { var bar = "bar5"; function maz() { console.log(this.bar); } maz(); } daz(); //
bar2

//------------------------------------------------------ // Явная привязка
//------------------------------------------------------ // С помощью методов call() и apply() можно задать явную
привязку функции к определенному контексту:
function foo() { console.log(this.bar); } var o3 = {bar: "bar3"}; var bar = "bar1"; foo(); // bar1 foo.apply(o3); //
bar3 // или // foo.call(o3);

//------------------------------------------------------ // Метод bind
//------------------------------------------------------ // Метод f.bind(o) позволяет создать новую функцию с тем же
телом и областью видимости, что и функция f, но с привязкой к объекту o:
function foo() { console.log(this.bar); } var o3 = {bar: "bar3"}; var bar = "bar1"; foo(); // bar1 var func = foo.bind(
o3); func(); // bar3

//------------------------------------------------------ // this и стрелочные функции
//------------------------------------------------------ // При работе с несколькими контекстами мы вынуждены учитывать,
в каком контексте определяется переменная. // Например, возьмем следующий код:
var school = { title: "Oxford", courses: ["JavaScript", "TypeScript", "Java", "Go"], printCourses: function() {
this.courses.forEach(function(course) { console.log(this.title, course); })
} }; school.printCourses(); // Результат:
// undefined "JavaScript"
// undefined "TypeScript"
// undefined "Java"
// undefined "Go"

var school = { title: "Oxford", courses: ["JavaScript", "TypeScript", "Java", "Go"], printCourses: function() { var that
= this; this.courses.forEach(function(course) { console.log(that.title, course); })
} }; school.printCourses(); // Результат:
// Oxford JavaScript // Oxford TypeScript // Oxford Java // Oxford Go

// Стрелочные функции также позволяют решить данную проблему:
var school = { title: "Oxford", courses: ["JavaScript", "TypeScript", "Java", "Go"], printCourses: function() {
this.courses.forEach((course) => console.log(this.title, course))
} }; school.printCourses();




