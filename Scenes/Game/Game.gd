extends Node

const PIPES = preload("uid://dnokfmil33cmm")

@onready var pipes_holder: Node = $PipesHolder
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn

func _ready() -> void:
	spawn_pipes()

func _on_spawn_timer_timeout() -> void:
	spawn_pipes()
	
func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var y_position = randf_range(
		upper_spawn.position.y,
		lower_spawn.position.y
	)
	new_pipes.position = Vector2(upper_spawn.position.x, y_position)
	pipes_holder.add_child(new_pipes)
