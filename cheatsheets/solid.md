# S.O.L.I.D

[Назад к перечню шпаргалок][back]

---

## 1. Single Responsibility Principle

**Принцип единственной обязанности** требует того, чтобы _один класс выполнял только одну работу_.

Ниже приведен класс, который имеет две обязанности:

```python
class  User:
    def __init__(self, name: str):
        self.name = name
    
    def get_name(self) -> str:
        pass

    def save(self, user: User):
        pass
```

Мы же просто разделим класс. Мы создадим ещё один класс, который возьмет на себя одну ответственность — управление базой данных пользователя:

```python
class User:
    def __init__(self, name: str):
        self.name = name
    
    def get_name(self):
        pass

class UserDB:
    def get_user(self, id) -> User:
        pass

    def save(self, user: User):
        pass
```

_Распространённым решением этой проблемы является применение шаблона проектирования **Фасад**._

## 2. Open-Closed Principle

**Принцип открытости/закрытости** - программные сущности (классы, модули, функции) _должно быть открыты для
расширения_, но не модификации.

**OCP** запрещает это:

```python
class Discount:
    def __init__(self, customer, price):
        self.customer = customer
        self.price = price

    def give_discount(self):
        if self.customer == 'fav': return self.price * 0.2
        if self.customer == 'vip': return self.price * 0.4
```

Чтобы следовать **OCP
**, мы добавим новый класс, который будет расширять `Discount`. И в этом новом классе реализуем требуемую логику:

```python
class Discount:
    def __init__(self, customer, price):
        self.customer = customer
        self.price = price

    def get_discount(self):
        return self.price * 0.2

class VIPDiscount(Discount):
    def get_discount(self):
        return super().get_discount() * 2
```

Если вы решите дать скидку супер VIP пользователям, то это будет выглядеть так:

```python
class SuperVIPDiscount(VIPDiscount):
    def get_discount(self):
        return super().get_discount() * 2
```

_Расширяйте, но не модифицируйте._

## 3. Liskov Substitution Principle

**Принцип подстановки Лисков** - для любого класса клиент _должен иметь возможность использовать любой подкласс базового
класса, не замечая разницы между
ними_, и следовательно, без каких-либо изменений поведения программы при выполнении. Это означает, что клиент полностью изолирован и не подозревает об изменениях в иерархии классов.

```python
class User():
    def __init__(self, color, board):
        create_pieces()
        self.color = color
        self.board = board

    def move(self, piece: Piece, position: int):
        piece.move(position)
        chessmate_check()

board = ChessBoard()

user_white = User("white", board)
user_black = User("black", board)

pieces = user_white.pieces
horse = helper.getHorse(user_white, 1)
user.move(horse)
```

_**LSP** это основа хорошего объектно-ориентированного проектирования программного обеспечения, потому что он следует
одному из базовых принципов ООП — **полиморфизму**._

## 4. Interface Segregation Principle

**Принцип разделения интерфейсов
** - клиенты не должны зависеть от интерфейсов, которые они не используют. Этот принцип устраняет недостатки реализации больших интерфейсов.

Классический пример:

```python
class IShape:
    def draw(self):
        raise NotImplementedError

class Circle(IShape):
    def draw(self):
        pass

class Square(IShape):
    def draw(self):
        pass

class Rectangle(IShape):
    def draw(self):
        pass
```

```python
from abc import ABC, abstractmethod

class InputDevice(ABC):
    @abstractmethod
    def read_input(self):
        pass

class OutputDevice(ABC):
    @abstractmethod
    def write_output(self, data):
        pass

class Keyboard(InputDevice):
    def read_input(self):
        # Логика чтения ввода с клавиатуры
        pass

class Mouse(InputDevice):
    def read_input(self):
        # Логика чтения ввода с мыши
        pass

class Monitor(OutputDevice):
    def write_output(self, data):
        # Логика вывода данных на монитор
        pass

class Printer(OutputDevice):
    def write_output(self, data):
        # Логика вывода данных на принтер
        pass
```

## 5. Dependency Inversion Principle

**Принцип инверсии зависимостей
** - классы не должны напрямую полагаться на другие классы, а вместо этого должны зависеть от абстракций.

```python
class AuthenticationForUser():
    def __init__(self, connector: Connector):
        self.connection = connector.connect()

    def authenticate(self, credentials):
        pass

    def is_authenticated(self):
        pass	

    def last_login(self):
        pass

class AnonymousAuth(AuthenticationForUser):
	pass

class GithubAuth(AuthenticationForUser):
	def last_login(self):
		pass

class FacebookAuth(AuthenticationForUser):
	pass

class Permissions()
	def __init__(self, auth: AuthenticationForUser)
		self.auth = auth

	def has_permissions():
		pass
		
class IsLoggedInPermissions(Permissions):
	def last_login():
		return auth.last_log
```

Другой пример:

```python
from abc import ABC, abstractmethod

class Notification(ABC):
    @abstractmethod
    def send_notification(self, message):
        pass

class EmailSender(Notification):
    def send_notification(self, message):
        # Логика отправки уведомления по электронной почте
        pass

class SMSNotification(Notification):
    def send_notification(self, message):
        # Логика отправки уведомления по SMS
        pass

class User:
    def __init__(self, username, email):
        self.username = username
        self.email = email
        self.notification_service = EmailSender()

    def send_notification(self, message):
        self.notification_service.send_notification(message)
```

Чтобы применить принцип **DIP
**, мы изменяем `User`, чтобы он зависел от абстракции `Notification`, а не от конкретной реализации:

```python
class User:
    def __init__(self, username, email, notification_service):
        self.username = username
        self.email = email
        self.notification_service = notification_service

    def send_notification(self, message):
        self.notification_service.send_notification(message)

email_sender = EmailSender()
user = User("John", "john@example.com", email_sender)
user.send_notification("Hello!")

sms_notification = SMSNotification()
user = User("Jane", "jane@example.com", sms_notification)
user.send_notification("Hi there!")
```

Теперь `User` зависит от абстракции `Notification` и может быть легко настроен для работы с различными реализациями уведомлений.

```python

```

```python

```

## Ссылки

- [https://www.youtube.com/watch?v=WEVGU8qIJyM](https://www.youtube.com/watch?v=WEVGU8qIJyM)
- [https://tproger.ru/articles/principy-solid-python](https://tproger.ru/articles/principy-solid-python)
- [https://metanit.com/sharp/patterns/5.1.php](https://metanit.com/sharp/patterns/5.1.php)

---

[Назад к перечню шпаргалок][back]

[back]: <./.> "Назад к перечню шпаргалок"