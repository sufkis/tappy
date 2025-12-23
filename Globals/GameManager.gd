extends Node

const MAIN = preload("uid://cxt5x3kdbarw8")
const GAME = preload("uid://cp2yabkxip7n6")

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)
	
func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)
