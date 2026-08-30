extends CharacterBody2D

var speed = 310

func get_input():
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed
	if Input.is_action_pressed("run"):
		velocity = velocity* 1.4

func _physics_process(delta):
	get_input()
	move_and_slide()
