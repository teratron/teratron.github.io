// Создаём новый символ - id let id = Symbol();

// Создаём символ id с описанием (именем) "id"
let id = Symbol("id");

// Например, вот два символа с одинаковым описанием – но они не равны:
let id1 = Symbol("id"); let id2 = Symbol("id"); alert(id1 == id2); // false

// Символы в литеральном объекте let id = Symbol("id"); let user = { name: "Вася",
[id]: 123 // просто "id: 123" не сработает };

//------------------------------------------------------ // //------------------------------------------------------
Symbol.for()             // ищет символ по имени, читаем символ из глобального реестра и записываем его в переменную,
если символа не существует, он будет создан Symbol.keyFor()          // принимает глобальный символ и возвращает его
имя. Symbol.toString()
Symbol.description Symbol.hasInstance Symbol.isConcatSpreadable Symbol.iterator Symbol.toPrimitive