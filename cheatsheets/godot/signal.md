# signal

← [Назад][back]

## Пользовательские сигналы

```gdscript
extends Node2D

signal health_depleted
var health = 10

func take_damage(amount):
    health -= amount
    if health <= 0:
        emit_signal("health_depleted")
```

```gdscript
extends Node

signal health_changed(old_value, new_value)

func take_damage(amount):
    var old_health = health
    health -= amount
    emit_signal("health_changed", old_health, health)
```

### Пример

_Health.gd_

```gdscript
extends Node2D

signal gameOver
onready var PlayerNode = get_node("Player")

func _ready():
	PlayerNode.connect("healthChanged", self, "doSomething")

func doSomething(playerHealth):
	print("We changed value of health to: ", playerHealth)
	PlayerNode.disconnect("healthChanged", self, "doSomething")
	emit_signal("gameOver")
```

_Player.gd_

```gdscript
extends Sprite

signal healthChanged
var check: int = 0
var playerHealth: int = 100

func _process(_delta):
	if check < 1:
		check += check
		changeHealth(-100)

func changeHealth(value):
	playerHealth = playerHealth + value
	emit_signal("healthChanged", playerHealth)
```

_GameOver.gd_

```gdscript
extends Node2D

onready var HealthNode = get_owner()

func _ready():
	HealthNode.connect("gameOver", self, "doSomething")

func doSomething():
	print("Game is Over Do Something ")
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"