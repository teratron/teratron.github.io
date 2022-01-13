var users []string // или var users []string = []string{"Tom", "Alice", "Kate"} // или var users = []string{"Tom", "
Alice", "Kate"} // или users := []string{"Tom", "Alice", "Kate"}

--------------------------------------------------
Создание среза
--------------------------------------------------
var users []string = make([]string, 3, 5) // 3 - len, 5 - cap // или users := make([]string, 3, 5)

--------------------------------------------------
Добавление в срез / Оператор среза / Удаление элемента
--------------------------------------------------
users := []string{"Bob", "Alice", "Kate", "Sam", "Tom", "Paul", "Mike", "Robert"} users = append(users[:3], users[4:]
...)   // удаляем 4-й элемент fmt.Println(users)
// ["Bob", "Alice", "Kate", "Tom", "Paul", "Mike", "Robert"]