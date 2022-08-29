//------------------------------------------------------ // Методы интерфейса Document
//------------------------------------------------------ document.adoptNode()             // Метод позволяет принять
узел из любого документа, частью которого он являлся на момент вызова, и записывает в свойство Node.ownerDocument ссылку
на текущий документ, подготавливая его к добавлению в текущий документ. document.close()                 // Метод
завершает запись в документ (закрывает поток открытый с помощью метода open() объекта Document)
document.createAttribute()       // Метод создает новый атрибут с указанным именем (объект Attr) и возвращает его.
document.createCDATASection()    // Создает узел CDATASection и возвращает его (только для XML документов).
document.createComment()         // Позволяет создать новый узел комментария и возвратить его.
document.createDocumentFragment()// Позволяет создать новый пустой объект DocumentFragment, предназначенный для создания
фрагмента документа, в который впоследствии допускается добавить новые элементы и узлы, а затем присоединить этот
фрагмент к основному дереву DOM. document.createElement()         // Метод позволяет создать и вернуть новый элемент (
пустой узел Element) с указанным именем тега. document.createElementNS()       // Метод позволяет создать и вернуть
новый элемент (пустой узел Element) с указанным именем тега с указанным URI пространства имен. document.createEvent()
// Метод создает событие указанного типа. document.createNodeIterator()    // Возвращает новый объект NodeIterator.
document.createTextNode()        // Метод позволяет создать и вернуть текстовый узел с указанным текстом.
document.getElementById()        // Метод возвращает объект Element, представляющий из себя элемент, глобальный атрибут
id которого соответствует указанной строке. document.getElementsByClassName()// Возвращает массивоподобный (итерируемый)
объект всех дочерних элементов, которые соответствуют указанному имени классу, или классам. document.getElementsByName()
// Метод возвращает коллекцию всех элементов документа с указанным именем (значением атрибута name) в виде объекта
NodeList. document.getElementsByTagName()  // Метод возвращает коллекцию всех элементов документа с указанным именем
тега в виде объекта HTMLCollection. document.getElementsByTagNameNS()// Метод возвращает коллекцию всех элементов
документа с указанным именем тега в виде объекта NodeList, принадлежащих определенному пространству имен
document.hasFocus()              // Метод возвращает логическое значение, которое указывает на то, имеет ли документ,
или любой элемент внутри документа фокус. document.importNode()            // Метод создает новую копию указанного
узла (объект Node) или фрагмента (объект DocumentFragment) из другого документа для возможности вставки в текущий
документ. document.open()                  // Метод позволяет открыть поток для записи документа (данные могут быть
переданы с помощью методов write() или writeln() объекта Document). document.querySelector()         // Метод возвращает
первый элемент в документе (объект Element), соответствующий указанному селектору, или группе селекторов. Да Да Да Да
8.0* Да document.querySelectorAll()      // Метод возвращает список элементов в пределах документа (статичный (не живой)
объект типа NodeList), соответствующих указанному селектору, или группе селекторов. Да Да Да Да 8.0* Да document.write()
// Записывает в поток документа строку текста. document.writeln()               // Записывает в поток документа строку
текста за которой следует символ новой строки.

//------------------------------------------------------ // Свойства интерфейса Document
//------------------------------------------------------ document.body // Представляет ссылку на узел <body>
или <frameset> текущего документа, или null, если такой элемент не существует. Элемент <frameset> не поддерживается в
HTML 5. document.characterSet // Возвращает кодировку для текущего документа. Свойство доступно только для чтения.
document.cookie // Получает или задает cookie (небольшой фрагмент данных, отправленный веб-сервером и хранимый на
компьютере пользователя), связанных с текущим документом. document.defaultView // Возвращает ссылку на объект Window,
связанный с документом, или null, если он недоступен. document.designMode // Управляет возможностью редактирования всего
документа. document.dir // Возвращает, или задает направление текста документа (слева направо (по умолчанию) или справа
налево). document.doctype // Возвращает объявление (декларацию) типа документа (Document Type Declaration), связанное с
текущим документом. document.documentElement // Возвращает элемент (объект Element), являющийся корневым элементом
документа (например, элемент <html> для документов типа HTML). document.documentURI // Возвращает в виде строки текущий
адрес документа. document.DocumentOrShadowRoot.activeElement // Возвращает элемент в дереве DOM, или shadowDOM, который
в данный момент имеет фокус. document.DocumentOrShadowRoot.fullscreenElement // Свойство доступное только для чтения
возвращает элемент, который в настоящее время представлен в полноэкранном режиме в этом документе, или значение null,
если полноэкранный режим в настоящее время не используется. document.DocumentOrShadowRoot.pointerLockElement //
Предоставляет набор элементов в качестве целевого объекта для событий мыши, когда указатель заблокирован.
document.DocumentOrShadowRoot.styleSheets // Возвращает коллекцию StyleSheetList, содержащую объекты CSSStyleSheet,
описывающих стили явно связанных или внедренных в текущем документе. document.domain // Возвращает, или задает доменную
часть источника текущего документа, используемую той же политикой источника. document.embeds // Возвращает список
элементов внедренных с использованием HTML элемента <embed>html5, содержащихся в текущем документе. document.fonts //
Возвращает объект FontFaceSet, который управляет загрузкой шрифтов и запросом их статуса загрузки для текущего
документа. document.forms // Возвращает коллекцию HTMLCollection со списком всех элементов <form>, содержащихся в
текущем документе. document.head // Возвращает элемент <head>, содержащийся в текущем документе. document.hidden //
Возвращает логическое значение, которое указывает на то, считается ли страница скрытой, или нет. document.images //
Возвращает коллекцию изображений в текущем HTML документе. document.implementation // Возвращает объект
DOMImplementation, связанный с текущим документом. Этот объект определяет методы, не относящиеся к какому-либо
конкретному объекту Document, а являющиеся глобальными для реализации DOM. document.lastModified // Возвращает строку,
содержащую дату и время последнего изменения текущего документа. document.links // Возвращает коллекцию всех
элементов <area> и <a> со значением атрибута href, содержащихся в текущем документе. document.location // Возвращает
объект Location, который содержит сведения об URL адресе документа и предоставляет методы для изменения этого URL
адреса, и загрузки другого URL адреса. document.plugins // Возвращает коллекцию HTMLCollection, содержащую один, или
несколько элементов <embed>html5 в текущем документе, или null, если в документе нет вложений. document.scripts //
Возвращает коллекцию HTMLCollection всех элементов <script>, содержащихся в текущем документе.
document.scrollingElement// Возвращает ссылку на элемент (объект Element), прокручивающий текущий документ.
document.visibilityState // Возвращает строковое значение определяющее видимость документа (находится ли документ в
фоновом режиме, или на невидимой вкладке, или загружается только для предварительной отрисовки).
document.ParentNode.childElementCount // Возвращает количество дочерних элементов конкретного узла.
document.ParentNode.children // Возвращает живую коллекцию (HTMLCollection), которая содержит все дочерние элементы
узла, на котором он был вызван. document.ParentNode.firstElementChild // Возвращает первый дочерний элемент (объект
Element) конкретного узла, или null, если дочерних элементов нет. document.ParentNode.lastElementChild // Возвращает
последний дочерний элемент (объект Element) конкретного узла, или null, если дочерних элементов нет. document.readyState
// Описывает состояние загрузки документа. document.referrer // Возвращает URI страницы, с которой был осуществлен
переход на текущую страницу. document.title // Получает или задает текущее название документа (содержимое
элемента <title>). document.URL // Возвращает расположение документа в виде строки.






