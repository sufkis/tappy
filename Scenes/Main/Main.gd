extends Control

@onready var label_4: Label = $MarginContainer/Label4

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		GameManager.load_game_scene()

func _ready() -> void:
	get_tree().paused = false
	label_4.text = "%03d" % ScoreManager.high_score
