//------------------------------------------------------ // Статические методы
//------------------------------------------------------ // Статические методы вызываются для всего класса в целом, а не
для отедельного объекта. // Для их определения применяется оператор static. class Person{ constructor(name, age) {
this.name = name; this.age = age; } // В данном случае определен статический метод nameToUpper(). static nameToUpper(
person) { return person.name.toUpperCase(); } display() { console.log(this.name, this.age); } } let tom = new Person("
Tom Soyer", 34); let personName = Person.nameToUpper(tom); console.log(personName); // TOM SOYER // Поскольку
статический метод относится классу вцелом, а не к объекту, // то мы НЕ можем использовать в нем ключевое слово this и
через него обращаться к свойствам объекта.

//------------------------------------------------------ class User { static staticMethod() { alert(this === User); } }
User.staticMethod(); // true

// Это фактически то же самое, что присвоить метод напрямую как свойство функции:
class User { } User.staticMethod = function() { alert(this === User); }; // Значением this при вызове
User.staticMethod() является сам конструктор класса User (правило «объект до точки»).

//------------------------------------------------------ class Article { constructor(title, date) { this.title = title;
this.date = date; }

static compare(articleA, articleB) { return articleA.date - articleB.date; } }

// использование let articles = [
new Article("HTML", new Date(2019, 1, 1)), new Article("CSS", new Date(2019, 0, 1)), new Article("JavaScript", new Date(2019, 11, 1))
];

articles.sort(Article.compare); alert( articles[0].title ); // CSS // Здесь метод Article.compare стоит «над» статьями,
как способ их сравнения. // Это метод не отдельной статьи, а всего класса.

//------------------------------------------------------ class Article { constructor(title, date) { this.title = title;
this.date = date; }

static createTodays() { // помним, что this = Article return new this("Сегодняшний дайджест", new Date()); } }

let article = Article.createTodays(); alert( article.title ); // Сегодняшний дайджест

// ... // предположим, что Article - это специальный класс для управления статьями // статический метод для удаления
статьи:
Article.remove({id: 12345});

//------------------------------------------------------ // Статические свойства
//------------------------------------------------------ // Статические свойства также возможны, они выглядят как
свойства класса, но с static в начале:
class Article { static publisher = "Илья Кантор"; } alert( Article.publisher ); // Илья Кантор

// Это то же самое, что и прямое присваивание Article:
Article.publisher = "Илья Кантор";

//------------------------------------------------------ // Наследование статических свойств и методов
//------------------------------------------------------ // Например, метод Animal.compare в коде ниже наследуется и
доступен как Rabbit.compare:
class Animal { constructor(name, speed) { this.speed = speed; this.name = name; }

run(speed = 0) { this.speed += speed; alert(`${this.name} бежит со скоростью ${this.speed}.`); }

static compare(animalA, animalB) { return animalA.speed - animalB.speed; }

}

// Наследует от Animal class Rabbit extends Animal { hide() { alert(`${this.name} прячется!`); } }

let rabbits = [
new Rabbit("Белый кролик", 10), new Rabbit("Чёрный кролик", 5)
];

rabbits.sort(Rabbit.compare); rabbits[0].run(); // Чёрный кролик бежит со скоростью 5. // Мы можем вызвать
Rabbit.compare, при этом будет вызван унаследованный Animal.compare.

//------------------------------------------------------ // В результате наследование работает как для обычных, так и
для статических методов. class Animal {} class Rabbit extends Animal {}

// для статики alert(Rabbit.__proto__ === Animal); // true

// для обычных методов alert(Rabbit.prototype.__proto__ === Animal.prototype); // true

//------------------------------------------------------ // Итого
//------------------------------------------------------ // Статические свойства используются в тех случаях, // когда мы
хотели бы сохранить данные на уровне класса, а не какого-то одного объекта. class MyClass { static property = ...;

static method() { ... } }

// Технически, статическое объявление – это то же самое, что и присвоение классу:
MyClass.property = ... MyClass.method = ... // Статические свойства и методы наследуются.




