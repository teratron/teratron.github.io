# Annotation

← [Назад][back]

### @export

```godot
@export var string = ""
@export var int_number = 5
@export var float_number: float = 5
@export var image: Image
```

```godot
@export_range(0, 20) var number
@export_range(-10, 20) var number
@export_range(-10, 20, 0.2) var number: float

@export_range(0, 100, 1, "or_greater") var power_percent
@export_range(0, 100, 1, "or_greater", "or_less") var health_delta

@export_range(-3.14, 3.14, 0.001, "radians") var angle_radians
@export_range(0, 360, 1, "degrees") var angle_degrees
@export_range(-8, 8, 2, "suffix:px") var target_offset
```

```godot
@export_category("Statistics")
```

```godot
@export_color_no_alpha var dye_color: Color
```

```godot
@export_dir var sprite_folder_path: String

@export_file var sound_effect_path: String
@export_file("*.txt") var notes_path: String
```

```godot
@export_enum("Warrior", "Magician", "Thief") var character_class: int
@export_enum("Slow:30", "Average:60", "Very Fast:200") var character_speed: int
@export_enum("Rebecca", "Mary", "Leah") var character_name: String = "Rebecca"

enum CharacterName {REBECCA, MARY, LEAH}
@export var character_name: CharacterName
```

```godot
@export_exp_easing var transition_speed
@export_exp_easing("attenuation") var fading_attenuation
@export_exp_easing("positive_only") var effect_power
```

```godot
@export_flags("Fire", "Water", "Earth", "Wind") var spell_elements = 0
@export_flags("Self:4", "Allies:8", "Foes:16") var spell_targets = 0
@export_flags("Self:4", "Allies:8", "Self and Allies:12", "Foes:16")
@export_flags("A:16", "B", "C") var x

@export_flags_2d_navigation var navigation_layers: int

@export_flags_2d_physics var physics_layers: int

@export_flags_2d_render var render_layers: int

@export_flags_3d_navigation var navigation_layers: int

@export_flags_3d_physics var physics_layers: int

@export_flags_3d_render var render_layers: int

@export_flags_avoidance var avoidance_layers: int
```

```godot
@export_global_dir var sprite_folder_path: String

@export_global_file var sound_effect_path: String
@export_global_file("*.txt") var notes_path: String
```

```godot
@export_group("Racer Properties")
@export var nickname = "Nick"
@export var age = 26

@export_group("Car Properties", "car_")
@export var car_label = "Speedy"
@export var car_number = 3

@export_group("", "")
@export var ungrouped_number = 3
```

```godot
@export_multiline var character_biography
```

```godot
@export_node_path("Button", "TouchScreenButton") var some_button
```

```godot
@export_placeholder("Name in lowercase") var character_id: String
```

```godot
@export_group("Racer Properties")
@export var nickname = "Nick"
@export var age = 26

@export_subgroup("Car Properties", "car_")
@export var car_label = "Speedy"
@export var car_number = 3
```

### @icon

```godot
@icon("res://path/to/class/icon.svg"
```

### @onready

```godot
@onready var character_name: Label = $Label
```

### @rpc

```godot
@rpc(
    String mode="authority",
    String sync="call_remote",
    String transfer_mode="unreliable",
    int transfer_channel=0
)
```

```godot
@rpc
func fn(): pass

@rpc("any_peer", "unreliable_ordered")
func fn_update_pos(): pass

@rpc("authority", "call_remote", "unreliable", 0) # Equivalent to @rpc
func fn_default(): pass
```

### @static_unload

Создаёт скрипт со статическими переменными, чтобы он не сохранялся после потери всех ссылок.\
Если скрипт будет загружен снова, статические переменные вернутся к своим значениям по умолчанию.

### @tool

```godot
@tool
extends Node
```

### @warning_ignore

```godot
func test():
    print("hello")
    return
    @warning_ignore("unreachable_code")
    print("unreachable")
```

← [Назад][back]

[back]: <.> "Назад к оглавлению"