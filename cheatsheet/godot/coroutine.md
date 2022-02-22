# coroutine

[Назад][back]

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