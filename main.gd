extends Node2D

var rng = RandomNumberGenerator.new()
var apple_scene = preload("res://apple.tscn")
var width = 26 # used to center the apples in the squares when they spawn

func get_random(low = 0, high = 19) -> int:
	return rng.randi_range(low, high) * 50 + width

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_apple(Vector2(get_random(), get_random()))
	while true:
		await get_tree().create_timer(10).timeout
		spawn_apple(Vector2(get_random(), get_random()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_apple(pos: Vector2) -> void:
	var apple = apple_scene.instantiate()
	apple.global_position = pos
	get_tree().current_scene.add_child(apple)
	
	
