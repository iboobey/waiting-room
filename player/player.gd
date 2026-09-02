extends CharacterBody2D

var speed = 65
var sprint_scale = 1.4

@onready var shoe_anim = $CompositeSprites/ShoeRed
@onready var torso_anim = $CompositeSprites/TorsoGreen
@onready var short_anim = $CompositeSprites/ShortBlue
@onready var head_anim = $CompositeSprites/Head
@onready var hair_anim = $CompositeSprites/HairCurly
@onready var cap_anim = $CompositeSprites/CapRed



func move():
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	if Input.is_action_pressed("run"):
		velocity = velocity * sprint_scale

func walk_animation():
	var direction_h := Input.get_axis("left","right")
	var direction_v := Input.get_axis("down","up")
	var walk_direction : String 

	if Input.is_action_pressed("run"):
		cap_anim.speed_scale = sprint_scale
		hair_anim.speed_scale = sprint_scale
		head_anim.speed_scale = sprint_scale
		torso_anim.speed_scale = sprint_scale
		shoe_anim.speed_scale = sprint_scale
		short_anim.speed_scale = sprint_scale
		
	if direction_h != 0 or direction_v != 0: 
		if direction_h < 0:
			walk_direction = "walkleft"
		elif direction_h > 0:
			walk_direction = "walkright"
		else:
			if direction_v < 0:
				walk_direction = "walkdown"
			elif direction_v > 0:
					walk_direction = "walkup"
	else: 
		cap_anim.frame = 0
		hair_anim.frame = 0
		head_anim.frame = 0
		torso_anim.frame = 0
		shoe_anim.frame = 0
		short_anim.frame = 0
	
	
	cap_anim.play(walk_direction)
	hair_anim.play(walk_direction)
	head_anim.play(walk_direction)
	torso_anim.play(walk_direction)
	shoe_anim.play(walk_direction)
	short_anim.play(walk_direction)
	
	
	
func _physics_process(_delta):
	walk_animation()
	move()
	move_and_slide()
	
