# coroutine

[Назад][back]

### yield() и resume()

```
GDScriptFunctionState yield ( Object object=null, String signal="" )
```

Вызов `yield()` немедленно произведет возврат из текущей функции с текущим замороженным состоянием этой же функции как
возвращаемое значение. При вызове `resume()` на данном результате объект продолжит выполнение и вернет все, что
возвращает функция. После возобновления состояние объекта становится недействительным.

```gdscript
func my_func():
    print("Hello")
    yield()
    print("world")

func _ready():
    var y = my_func()
    # Состояние функции сохраняется в 'y'.
    print("my dear")
    y.resume()
    # 'y' возобновилось и теперь находится в недопустимом состоянии.

# Результат:
# Hello
# my dear
# world
```

Также можно передавать значения между функциями `yield()` и `resume()`, например:

```gdscript
func my_func():
    print("Hello")
    print(yield())
    return "cheers!"

func _ready():
    var y = my_func()
    print(y.resume("world"))

# Результат:
# Hello
# world
# cheers!
```

Не забывайте сохранять новое состояние функции при использовании нескольких `yield`:

```gdscript
func co_func():
    for i in range(1, 5):
    print("Turn %d" % i)
    yield();

func _ready():
    var co = co_func();
    while co is GDScriptFunctionState && co.is_valid():
    co = co.resume();
```

### Сопрограммы и сигналы

Настоящая мощь использования `yield` заключается в их сочетании с сигналами.
`yield` может принимать два аргумента, объект и сигнал. Когда сигнал будет получен, выполнение будет возобновлено.

```gdscript
# Возобновляет выполнение в следующем кадре.
yield(get_tree(), "idle_frame")

# Возобновляет выполнение, когда анимация будет воспроизведена.
yield(get_node("AnimationPlayer"), "animation_finished")

# Ожидает 5 секунд, затем возобновите выполнение.
yield(get_tree().create_timer(5.0), "timeout")
```

Сами сопрограммы используют сигнал `completed` при переходе в недействительное состояние:

```gdscript
# my_func будет продолжаться только после нажатия обеих кнопок.
func my_func():
    yield(button_func(), "completed")
    print("All buttons were pressed, hurray!")

func button_func():
    yield($Button0, "pressed")
    yield($Button1, "pressed")
```

Вы также можете получить аргумент сигнала, когда он передается объектом:

```gdscript
# Ожидает, когда какой-либо узел будет добавлен в дерево сцены.
var node = yield(get_tree(), "node_added")
```

Если передано несколько аргументов, то `yield` вернёт массив из этих аргументов:

```gdscript
signal done(input, processed)

func process_input(input):
    print("Processing initialized")
    yield(get_tree(), "idle_frame")
    print("Waiting")
    yield(get_tree(), "idle_frame")
    emit_signal("done", input, "Processed " + input)


func _ready():
    process_input("Test")          # Prints: Processing initialized
    var data = yield(self, "done") # Prints: waiting
    print(data[1])                 # Prints: Processed Test
```

Если вы не уверены, может ли функция вернуть промежуточный результат или нет, или может ли он вернуться несколько раз,
вы можете привести промежуточный результат к сигналу `completed` через условие:

```gdscript
func generate():
    var result = rand_range(-1.0, 1.0)
    if result < 0.0:
        yield(get_tree(), "idle_frame")
    return result

func make():
    var result = generate()
    if result is GDScriptFunctionState: # Still working.
        result = yield(result, "completed")
    return result
```

```gdscript
func _ready():
    # Ожидание завершения функции countdown()
    yield(countdown(), "completed")
    print('Ready')

func countdown():
    # Возвращает объект GDScriptFunctionState в _ready()
    yield(get_tree(), "idle_frame")
    print(3)
    yield(get_tree().create_timer(1.0), "timeout")
    print(2)
    yield(get_tree().create_timer(1.0), "timeout")
    print(1)
    yield(get_tree().create_timer(1.0), "timeout")

# Результат:
# 3
# 2
# 1
# Ready
```

### Пример

_Main.gd_

```gdscript
extends Node

enum STATE {IDLE, DAMAGE}
var currentState

func _ready():
	currentState = STATE.IDLE

func _process(delta):
	# Мы запускаем эту строку кода до тех пор, пока находимся в состоянии ожидания
	if(currentState == STATE.IDLE):
		var z = coroutine()
		print("Function In Memory: ", z) # A function State
		var a = z.resume(100)
		a.resume("hi passed from _ready function")

func coroutine():
	# ENTER DAMAGE STATE, не удается запустить coroutine() внутри _process(delta)
	currentState = STATE.DAMAGE

	var stop = yield()

	print("Value passed from _ready Function: ", stop)
	var stopAgain = yield()

	print("Value passed from _ready function 2nd time: ", stopAgain)
	var signalValue = yield(get_node("Player"), "health")

	print("signal was recieved in coroutine function")
	print("Value Passed from signal: ", signalValue)

	#ENTER IDLE STATE, возможность запуска coroutine() внутри _process(delta)
	currentState = STATE.IDLE
```

_Player.gd_

```gdscript
extends Node

signal health
var timer = Timer.new()

# Вызывается, когда узел впервые входит в дерево сцены.
func _ready():
	add_child(timer)
	timer.set_autostart(true)
	timer.set_wait_time(2)
	timer.connect("timeout", self, "test")
	timer.start()

func test():
	emit_signal("health", 200)
```

[Назад][back]

[back]: <.> "Назад к оглавлению"