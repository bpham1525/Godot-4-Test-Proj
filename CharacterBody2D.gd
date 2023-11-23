extends CharacterBody2D


const SPEED = 300.0

@onready var animPlayer = get_node("AnimationPlayer")
@onready var animSprite = get_node("AnimatedSprite2D")

func _ready():
	animPlayer.play("Idle")

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		animPlayer.play("Move")
	else:
		animPlayer.play("Idle")
	
	var facing = Input.get_axis("ui_left", "ui_right")
	if facing == -1:
		animSprite.flip_h = true
	elif facing == 1:
		animSprite.flip_h = false
		
		
	velocity = direction * SPEED
	move_and_slide()
