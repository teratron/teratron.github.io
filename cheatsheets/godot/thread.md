# thread

← [Назад][back]

### Пример

```gdscript
extends Timer

var timer = self
var thread

func _ready():
	# Создаём thread
	thread = Thread.new()
	print("Create Thread Id: ", thread)
	print("Thread Active: ", thread.is_active())

	# Запускаем thread
	thread.start(self, "startTimer", null, 0)
	print("\nStart the thread: ")
	print("Thread Active: ", thread.is_active())

	# Ожидаем завершения нашей thread, прежде чем двигаться дальше
	var waitForThread = thread.wait_to_finish()
	print("\nThread is Finished: ", waitForThread)
	print("Thread Active: ", thread.is_active())

func startTimer(param):
	print("inside timer")
	timer.set_one_shot(true)
	timer.start(2)
	timer.connect("timeout", self, "print")
	return 100

func print():
	print("\ntimer done!")
```

```gdscript
extends Node

func _ready():
	pass
```

```gdscript

```

← [Назад][back]

[back]: <.> "Назад к оглавлению"