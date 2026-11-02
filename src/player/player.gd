class_name Player
extends CharacterBody2D
## Top-down player. Moves with WASD / arrow keys and collides with walls.
##
## Speed and body size are not hardcoded: the owning map calls [method configure]
## with values read from assets/data/world_config.json.
## Not thread-safe; use from the main thread only.
##
## Usage:
## [codeblock]
## player.configure(220.0, Vector2(24.0, 24.0))
## [/codeblock]

const ACTION_UP: StringName = &"move_up"
const ACTION_DOWN: StringName = &"move_down"
const ACTION_LEFT: StringName = &"move_left"
const ACTION_RIGHT: StringName = &"move_right"

var _speed: float = 0.0

@onready var _collision_shape: CollisionShape2D = $CollisionShape2D
@onready var _body_rect: ColorRect = $Body


func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	_bind_action(ACTION_UP, KEY_W, KEY_UP)
	_bind_action(ACTION_DOWN, KEY_S, KEY_DOWN)
	_bind_action(ACTION_LEFT, KEY_A, KEY_LEFT)
	_bind_action(ACTION_RIGHT, KEY_D, KEY_RIGHT)


## Applies config values: movement speed (px/s) and body size (px).
func configure(speed: float, body_size: Vector2) -> void:
	_speed = speed
	var shape: RectangleShape2D = RectangleShape2D.new()
	shape.size = body_size
	_collision_shape.shape = shape
	_body_rect.size = body_size
	_body_rect.position = -body_size * 0.5


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector(ACTION_LEFT, ACTION_RIGHT, ACTION_UP, ACTION_DOWN)
	velocity = direction * _speed
	move_and_slide()


## Registers an input action (if missing) with two physical keys.
func _bind_action(action: StringName, key_a: Key, key_b: Key) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action)
	for key: Key in [key_a, key_b]:
		var event: InputEventKey = InputEventKey.new()
		event.physical_keycode = key
		InputMap.action_add_event(action, event)
