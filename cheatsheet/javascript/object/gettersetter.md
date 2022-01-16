//------------------------------------------------------ // Определение геттеров и сеттеров
//------------------------------------------------------ var o = { a: 7, get b() { return this.a + 1; }, set c(x) {
this.a = x / 2; } };

console.log(o.a); // 7 console.log(o.b); // 8 o.c = 50; console.log(o.a); // 25

// В следующем примере создаются в точности такие же геттер и сеттер, как и в примере выше:
var o = { a: 0 };

Object.defineProperties(o, {
'b': { get: function() { return this.a + 1; } },
'c': { set: function(x) { this.a = x / 2; } } });

o.c = 10; // Запускает сеттер, который присваивает 10 / 2 (5) свойству 'a' console.log(o.b); // Запускает геттер,
который возвращает a + 1 (тоесть 6)

// Определение геттера и сеттера для свойства year:
var d = Date.prototype; Object.defineProperty(d, 'year', { get: function() { return this.getFullYear(); }, set:
function(y) { this.setFullYear(y); } });

var now = new Date(); console.log(now.year); // 2000 now.year = 2001; // 987617605170 console.log(now); // Wed Apr 18
11:13:25 GMT-0700 (Pacific Daylight Time) 2001





