extends Node

const MAIN = preload("uid://cxt5x3kdbarw8")
const GAME = preload("uid://cp2yabkxip7n6")
const SIMPLE_CHANGE = preload("uid://b82qojief8vav")
const COMPLEX_CHANGE = preload("uid://b7d33n824na5y")

var next_scene: PackedScene
var cx: ComplexChange

func _ready() -> void:
	cx = COMPLEX_CHANGE.instantiate()
	add_child(cx)

func change_to_next() -> void:
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)

func start_transition(to_scene: PackedScene) -> void:
	next_scene = to_scene
	cx.play_animation()

func load_main_scene() -> void:
	start_transition(MAIN)
	#next_scene = MAIN
	#get_tree().change_scene_to_packed(SIMPLE_CHANGE)
	
func load_game_scene() -> void:
	start_transition(GAME)
	#next_scene = GAME
	#get_tree().change_scene_to_packed(SIMPLE_CHANGE)
