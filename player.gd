extends Area2D

@export var dist = 50 # This moves the player one square per frame
var game_speed = 1.0 # seconds between "frames"
var direction = "right" # initial starting direction
var last_direction = "right" # used to keep player from doubling back in the direction it came from

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		await get_tree().create_timer(game_speed).timeout
		move_snake()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left") and last_direction != "right":
		direction = "left"
	if Input.is_action_pressed("right") and last_direction != "left":
		direction = "right"
	if Input.is_action_pressed("up") and last_direction != "down":
		direction = "up"
	if Input.is_action_pressed("down") and last_direction != "up":
		direction = "down"

func move_snake() -> void:	
	if position.x > 926 and direction == "right":
		position.x = 26
	elif position.x < 76 and direction == "left":
		position.x = 976
	elif position.y < 78 and direction == "up":
		position.y = 978
	elif position.y > 928 and direction == "down":
		position.y = 28 
	else:
		match direction:
			"left":
				position += Vector2(-dist, 0)
			"right":
				position += Vector2(dist, 0)
			"up":
				position += Vector2(0, -dist)
			"down":
				position += Vector2(0, dist)
	last_direction = direction
	print(global_position)
