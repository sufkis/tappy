extends CharacterBody2D

class_name Tappy

#signal on_plane_died

const JUMP_POWER: float = -350.0

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped: bool = false

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		_jumped = true

func die() -> void:
	SignalHub.emit_on_plane_died()
	get_tree().paused = true

func _ready() -> void:
	pass # Replace with function body.

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("power"):
		#_jumped = true

func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta
	if _jumped:
		velocity.y = JUMP_POWER
		_jumped = false
		
	#if Input.is_action_just_pressed("power"): # An option but is checked for every phtsics frame and unhandled will just signal when it's pressed
		#velocity.y = JUMP_POWER
		
	move_and_slide()
	
	if is_on_floor():
		die()
	
	if is_on_ceiling():
		print("on ceiling")
