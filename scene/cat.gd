extends CharacterBody2D


const SPEED = 300.0
@export var JUMP_VELOCITY = -40000.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		
		
		velocity.y = JUMP_VELOCITY*delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
		
	if direction:
		
		velocity.x = direction * SPEED
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#
	if is_on_floor():	
		if Input.is_action_pressed("left"):
			
			
			animated_sprite_2d.play("run")
			
			animated_sprite_2d.flip_h=true
		elif Input.is_action_pressed("right"):
			
			animated_sprite_2d.play("run")
			
			animated_sprite_2d.flip_h=false
		else :
			animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("jump")
	move_and_slide()
	
