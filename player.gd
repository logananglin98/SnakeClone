extends Area2D

@export var speed = 200
var direction = "right"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("left"):
		direction = "left"
	if Input.is_action_pressed("right"):
		direction = "right"
	if Input.is_action_pressed("up"):
		direction = "up"
	if Input.is_action_pressed("down"):
		direction = "down"
	
	if direction == "left":
		position += Vector2(-1, 0)
	elif direction == "right":
		position += Vector2(1, 0)
	elif direction == "up":
		position += Vector2(0, -1)
	elif direction == "down":
		position += Vector2(0, 1)
		
	#velocity = velocity * speed
	#
	#position += velocity * delta
		
