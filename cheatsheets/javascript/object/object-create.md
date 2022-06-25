//------------------------------------------------------ Object.create()
//------------------------------------------------------ // Создаёт новый объект с указанными объектом прототипа и
свойствами.

let myObj = Object.create( null, { // объект-прототип соответствует null a: { // добавляем новое свойство value: 1 //
указываем значение свойства }, b: { // добавляем новое свойство value: 2, // указываем значение свойства enumerable:
true // указываем, что свойство перечислимо } }); console.log( myObj ) // {a: 1, b: 2} Object.keys( myObj ) // ["b"]

//------------------------------------------------------ // В следующем примере мы рассмотрим с Вами как с помощью
метода create() указать создаваемому объекту объект, // который будет использован в качестве прототипа. let obj = {
fullName: function() { // возвращает значения свойств текущего объекта firstName и lastName return this.firstName + " "

+ this.lastName   
  }, upperCase: function(){ // возвращает значения свойств текущего объекта firstName и lastName в верхнем регистре
  return (this.firstName + " " + this.lastName).toUpperCase()   	
  } }

let myObj = Object.create( obj, { // объект-прототип соответствует объекту obj firstName: { // добавляем новое свойство
value: "Boris"      // указываем значение свойства }, lastName: { // добавляем новое свойство value: "Britva", //
указываем значение свойства } });

console.log( myObj ); // {firstName: "Boris", lastName: "Britva"} console.log( myObj.fullName() ); // Boris Britva
console.log( myObj.upperCase() ); // BORIS BRITVA

// проверяем существует ли указанный объект в цепочке прототипов другого объекта obj.isPrototypeOf( myObj ); // true
myObj.isPrototypeOf( obj ); // false

//------------------------------------------------------ // Это пример одиночного наследования, поскольку только его
поддерживает JavaScript. // Shape — суперкласс function Shape() { this.x = 0; this.y = 0; }

// метод суперкласса Shape.prototype.move = function(x, y) { this.x += x; this.y += y; console.info('Фигура
переместилась.'); };

// Rectangle — подкласс function Rectangle() { Shape.call(this); // вызываем конструктор суперкласса }

// подкласс расширяет суперкласс Rectangle.prototype = Object.create(Shape.prototype); Rectangle.prototype.constructor =
Rectangle;

let rect = new Rectangle();

console.log('Является ли rect экземпляром Rectangle? ' + (rect instanceof Rectangle)); // true console.log('Является ли
rect экземпляром Shape? ' + (rect instanceof Shape)); // true rect.move(1, 1); // выведет 'Фигура переместилась.'





