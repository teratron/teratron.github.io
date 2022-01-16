//------------------------------------------------------ // Создание класса
//------------------------------------------------------ // Класс представляет описание объекта, его состояния и
поведения, а объект является конкретным воплощением или экземпляром класса. class Person{ } // или let Person = class{}

// После этого мы можем создать объекты класса с помощью конструктора:
class Person{} let tom = new Person(); let bob = new Person();

//------------------------------------------------------ // constructor
//------------------------------------------------------ // Конструктор определяется с помощью метода с именем
constructor. // По сути это обычный метод, который может принимать параметры. // Также мы можем определить в классе свои
конструкторы. // Также класс может содержать свойства и методы:
class Person{ constructor(name, age) { this.name = name; this.age = age; } display() { console.log(this.name, this.age);
} } let tom = new Person("Tom", 34); tom.display(); // Tom 34 console.log(tom.name); // Tom

//------------------------------------------------------ // Наследование extends
//------------------------------------------------------ // Для наследования одного класса от другого в определении
класса применяется оператор extends, после которого идет название базового класса. // Одни классы могут наследоваться от
других. // Наследование позволяет сократить объем кода в классах-наследниках. class Person{ constructor(name, age) {
this.name = name; this.age = age; } display() { console.log(this.name, this.age); } } class Employee extends Person{
constructor(name, age, company) { super(name, age); this.company = company; } display() { super.display(); console.log("
Employee in", this.company); } work() { console.log(this.name, "is hard working"); } } let tom = new Person("Tom", 34);
let bob = new Employee("Bob", 36, "Google"); tom.display(); bob.display(); bob.work(); // Результат:
// Tom 34 // Bob 36 // Employee in Google // Bob is hard working

//------------------------------------------------------ // Статические методы
//------------------------------------------------------ // Статические методы вызываются для всего класса в целом, а не
для отедельного объекта. // Для их определения применяется оператор static. class Person{ constructor(name, age) {
this.name = name; this.age = age; } // В данном случае определен статический метод nameToUpper(). static nameToUpper(
person) { return person.name.toUpperCase(); } display() { console.log(this.name, this.age); } } let tom = new Person("
Tom Soyer", 34); let personName = Person.nameToUpper(tom); console.log(personName); // TOM SOYER

// Поскольку статический метод относится классу вцелом, а не к объекту, // то мы НЕ можем использовать в нем ключевое
слово this и через него обращаться к свойствам объекта.













