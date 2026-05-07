extends Node2D

var rng = RandomNumberGenerator.new()
var apple_scene = preload("res://apple.tscn")
var x_value = 26

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		await get_tree().create_timer(10).timeout
		spawn_apple(Vector2(x_value, 28))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_apple(pos: Vector2) -> void:
	var apple = apple_scene.instantiate()
	apple.global_position = pos
	get_tree().current_scene.add_child(apple)
	x_value = x_value + 50
	
	
