extends Node2D
@onready var area_2d: Area2D = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	area_2d.global_position+=Vector2(-2,0)


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.set_physics_process(false)
	if body.is_in_group("cat") and body.is_processing()==false:
		body.position.y=580
		body.animated_sprite_2d.play("finish")
		
