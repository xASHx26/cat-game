extends Node2D
@export var hazzerd:PackedScene
@onready var area_2d: Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func Spawn_hazzerds()->void:
	var new_hazerd=hazzerd.instantiate()
	new_hazerd.global_position.x=1068
	new_hazerd.global_position.y=randf_range(600,100)
	
	add_child(new_hazerd)


func _on_timer_timeout() -> void:
	Spawn_hazzerds()
