extends Node2D

class_name Pipes

const PIPE_SPEED: float = 120.0

@onready var score_sound: AudioStreamPlayer2D = $ScoreSound

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	position.x -= PIPE_SPEED * delta

func _on_screen_notifier_screen_exited() -> void:
	queue_free()

func _on_life_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()


func _on_laser_body_exited(body: Node2D) -> void:
	if body is Tappy:
		score_sound.play()
		SignalHub.emit_on_point_scored()
