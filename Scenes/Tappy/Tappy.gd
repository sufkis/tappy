extends CharacterBody2D

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped: bool = false

const JUMP_POWER: float = -350.0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		_jumped = true

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta
	if _jumped:
		velocity.y = JUMP_POWER
		_jumped = false
	move_and_slide()
