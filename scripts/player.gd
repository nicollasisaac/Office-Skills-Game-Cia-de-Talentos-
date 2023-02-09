extends KinematicBody2D

var speed = 150

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		
	velocity = move_and_slide(velocity, Vector2(0, -1))

