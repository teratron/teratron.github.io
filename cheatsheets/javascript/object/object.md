//------------------------------------------------------ // Свойства конструктора Object
//------------------------------------------------------ Object.length // Имеет значение 1. Object.prototype //
Позволяет добавлять свойства ко всем объектам типа Object.

//------------------------------------------------------ // Методы конструктора Object
//------------------------------------------------------ Object.assign()                   // Создаёт новый объект путём
копирования значений всех собственных перечислимых свойств из одного или более исходных объектов в целевой объект.
Object.create()                   // Создаёт новый объект с указанными объектом прототипа и свойствами.
Object.defineProperty()           // Добавляет к объекту именованное свойство, описываемое переданным дескриптором.
Object.defineProperties()         // Добавляет к объекту именованные свойства, описываемые переданными дескрипторами.
Object.entries()                  // Возвращает массив, содержащий собственные перечислимые свойства и методы заданного
объекта, включая их значения. Object.freeze()                   // Замораживает объект: другой код не сможет удалить или
изменить никакое свойство. Object.getOwnPropertyDescriptor() // Возвращает дескриптор свойства для именованного свойства
объекта. Object.getOwnPropertyDescriptors()// Возвращает объект, содержащий дескрипторы всех собственных (
неунаследованных) свойств заданного объекта. Object.getOwnPropertyNames()      // Возвращает массив, содержащий имена
всех переданных объекту собственных перечисляемых и неперечисляемых свойств. Object.getOwnPropertySymbols()    //
Возвращает массив всех символьных свойств, найденных непосредственно в переданном объекте. Object.getPrototypeOf()
// Возвращает прототип указанного объекта. Object.hasOwnProperty()           // Возвращает логическое значение, которое
указывает на то содержит ли объект указанное cобственное (неунаследованное) свойство, или метод. Object.is()
// Определяет, являются ли два значения одинаковыми значениями. Object.isExtensible()             // Определяет,
разрешено ли расширение объекта. Object.isFrozen()                 // Определяет, был ли объект заморожен.
Object.isPrototypeOf()            // Проверяет существует ли указанный объект в цепочке прототипов другого объекта,
возвращая при этом логическое значение. Object.isSealed()                 // Определяет, является ли объект
запечатанным (sealed). Object.keys()                     // Возвращает массив, содержащий имена всех собственных
перечислимых свойств переданного объекта. Object.observe()                  // Асинхронно наблюдает за изменениями в
объекте. Object.preventExtensions()        // Предотвращает любое расширение объекта. Object.propertyIsEnumerable()
// Возвращает логическое значение, которое определяет является ли указанное свойство или метод целевого объекта
перечислимым. Object.seal()                     // Предотвращает удаление свойств объекта другим кодом.
Object.setPrototypeOf()           // Устанавливает прототип (т.е. внутреннее свойство [[Prototype]])
Object.toLocaleString()           // Возвращает строковое представление указанного объекта. Этот метод предназначен для
переопределения производными объектами для возвращения локализованного строкового представления указанного объекта.
Object.toString()                 // Возвращает строковое представление указанного объекта. Object.valueOf()
// Возвращает примитивное значение указанного объекта. Object.values()                   // Возвращает массив
собственных перечислимых значений свойств и методов указанного объекта.






