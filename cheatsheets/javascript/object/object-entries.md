//------------------------------------------------------ Object.entries()
//------------------------------------------------------ // Возвращает массив, содержащий собственные перечислимые
свойства и методы заданного объекта, включая их значения.

let obj = {a: 1, b: 2, c: 3}; let newArr = Object.entries( obj ); console.log( newArr ); // [ ["a", 1], ["b", 2]
, ["c", 3] ]

// изменяем в объекте существующее свойство Object.defineProperty( obj, "c", { enumerable: false // устанавливаем, что
свойство не перечислимо }); console.log( Object.entries( obj ) ); // [ ["a", 1], ["b", 2] ]

let obj = {a: 1, b: 2, c: () => console.log( "hello" )}; let newArr = Object.entries( obj ); console.log( newArr );
// [ ["a", 1], ["b", 2], ["c", () => console.log( "hello" )] ]
newArr[2][1]()         // выведет значение hello в консоль

let str = "What"
let newArr = Object.entries( str ); console.log( newArr ); // [ ["0", "W"], ["1", "h"], ["2", "a"], ["3", "t"] ]

let arr = ["a", "b", "c"]
let newArr = Object.entries( arr ); console.log( newArr ); // [ ["0", "a"], ["1", "b"], ["2", "c"] ]

let objWithSymbol = { [Symbol( "test" )]:"test", a: "test" } let newArr = Object.entries( objWithSymbol ); // игнорирует
свойства, ключом которых является символ console.log( newArr ); // [ ["a", "test"] ]

Object.entries( undefined ); // TypeError Object.entries( null ); // TypeError




