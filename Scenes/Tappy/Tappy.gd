extends CharacterBody2D

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta
	move_and_slide()
