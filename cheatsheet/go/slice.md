var users []string // ��� var users []string = []string{"Tom", "Alice", "Kate"} // ��� var users = []string{"Tom", "
Alice", "Kate"} // ��� users := []string{"Tom", "Alice", "Kate"}

--------------------------------------------------
�������� �����
--------------------------------------------------
var users []string = make([]string, 3, 5) // 3 - len, 5 - cap // ��� users := make([]string, 3, 5)

--------------------------------------------------
���������� � ���� / �������� ����� / �������� ��������
--------------------------------------------------
users := []string{"Bob", "Alice", "Kate", "Sam", "Tom", "Paul", "Mike", "Robert"} users = append(users[:3], users[4:]
...)   // ������� 4-� ������� fmt.Println(users)
// ["Bob", "Alice", "Kate", "Tom", "Paul", "Mike", "Robert"]