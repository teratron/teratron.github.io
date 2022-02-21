# coroutines

[Назад][back]

_Main.gd_

```gdscript
extends Node

enum STATE {IDLE, DAMAGE}
var currentState

func _ready():
	currentState = STATE.IDLE

func _process(delta):
	# We run this line of code as long as we are in idle state
	if(currentState == STATE.IDLE):
		var z = coroutine()
		print("Function In Memory: ", z) # A function State
		var a = z.resume(100)
		a.resume("hi passed from _ready function")

func coroutine():
	# ENTER DAMAGE STATE, can't run coroutine() inside of _process(delta)
	currentState = STATE.DAMAGE

	var stop = yield()

	print("Value passed from _ready Function: ", stop)
	var stopAgain = yield()

	print("Value passed from _ready function 2nd time: ", stopAgain)
	var signalValue = yield(get_node("Player"), "health")

	print("signal was recieved in coroutine function")
	print("Value Passed from signal: ", signalValue)

	#ENTER IDLE STATE, able to run coroutine() inside _process(delta)
	currentState = STATE.IDLE
```

_Player.gd_

```gdscript
extends Node

signal health
var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
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
