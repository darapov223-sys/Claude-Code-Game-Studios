class_name Districts
extends Node2D
## Builds the placeholder map (three districts, buildings, boundary walls) from
## assets/data/world_config.json and configures the player and camera.
##
## Rect arrays in the config are [x, y, width, height] in pixels.
## Not thread-safe; use from the main thread only.
##
## Usage: attach to the root of src/world/map.tscn; it builds itself in _ready().

const CONFIG_PATH: String = "res://assets/data/world_config.json"

@onready var _blocks: Node2D = $Blocks
@onready var _player: Player = $Player
@onready var _camera: Camera2D = $Player/Camera2D


func _ready() -> void:
	var config: Dictionary = _load_config()
	if config.is_empty():
		return

	var player_cfg: Dictionary = config["player"]
	var camera_cfg: Dictionary = config["camera"]
	var map_cfg: Dictionary = config["map"]
	var districts: Array = config["districts"]

	var map_width: float = map_cfg["width"]
	var map_height: float = map_cfg["height"]
	var wall: float = map_cfg["wall_thickness"]
	var wall_color: Color = Color.html(map_cfg["wall_color"])
	var building_color: Color = Color.html(map_cfg["building_color"])

	for district: Dictionary in districts:
		var area: Rect2 = _to_rect(district["rect"])
		_add_visual(area, Color.html(district["color"]))
		var label: Label = Label.new()
		label.text = district["name"]
		label.position = area.position + Vector2(16.0, 16.0)
		_blocks.add_child(label)
		var buildings: Array = district["buildings"]
		for building: Array in buildings:
			var rect: Rect2 = _to_rect(building)
			_add_visual(rect, building_color)
			_add_solid(rect)

	# Boundary walls sit just outside the map rectangle.
	var boundary: Array[Rect2] = [
		Rect2(-wall, -wall, map_width + 2.0 * wall, wall),
		Rect2(-wall, map_height, map_width + 2.0 * wall, wall),
		Rect2(-wall, 0.0, wall, map_height),
		Rect2(map_width, 0.0, wall, map_height),
	]
	for rect: Rect2 in boundary:
		_add_visual(rect, wall_color)
		_add_solid(rect)

	var spawn: Array = player_cfg["spawn"]
	var body_size: Array = player_cfg["size"]
	var speed: float = player_cfg["speed"]
	_player.position = Vector2(float(spawn[0]), float(spawn[1]))
	_player.configure(speed, Vector2(float(body_size[0]), float(body_size[1])))

	var zoom: float = camera_cfg["zoom"]
	_camera.zoom = Vector2(zoom, zoom)
	_camera.limit_left = 0
	_camera.limit_top = 0
	_camera.limit_right = int(map_width)
	_camera.limit_bottom = int(map_height)


## Loads and validates the world config. Returns an empty Dictionary on failure.
func _load_config() -> Dictionary:
	var text: String = FileAccess.get_file_as_string(CONFIG_PATH)
	if text.is_empty():
		push_error("world config missing or empty: %s (error %d)" % [CONFIG_PATH, FileAccess.get_open_error()])
		return {}
	var parsed: Variant = JSON.parse_string(text)
	if not parsed is Dictionary:
		push_error("world config is not a valid JSON object: %s" % CONFIG_PATH)
		return {}
	var config: Dictionary = parsed
	for key: String in ["player", "camera", "map", "districts"]:
		if not config.has(key):
			push_error("world config lacks key '%s'" % key)
			return {}
	return config


func _to_rect(values: Array) -> Rect2:
	return Rect2(float(values[0]), float(values[1]), float(values[2]), float(values[3]))


func _add_visual(rect: Rect2, color: Color) -> void:
	var node: ColorRect = ColorRect.new()
	node.position = rect.position
	node.size = rect.size
	node.color = color
	_blocks.add_child(node)


func _add_solid(rect: Rect2) -> void:
	var body: StaticBody2D = StaticBody2D.new()
	body.position = rect.get_center()
	var shape: RectangleShape2D = RectangleShape2D.new()
	shape.size = rect.size
	var collision: CollisionShape2D = CollisionShape2D.new()
	collision.shape = shape
	body.add_child(collision)
	_blocks.add_child(body)
