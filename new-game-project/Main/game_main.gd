extends Node

@onready var parallax_background: Parallax2D = $Background/ParallaxBackground
@onready var main: Node3D = $SubViewportContainer/SubViewport/Main
@onready var win_lose_screen: WinLoseScreen = $"Win_Lose Screen"


func _ready() -> void:
	main.game_was_lost.connect(lost_game)
	Input.set_custom_mouse_cursor(load("res://Cursor/carrot cursor.png"))


func lost_game() -> void:
	win_lose_screen.lost()
	parallax_background.lost_game()
	await win_lose_screen.lost_anim_finished
	Input.set_custom_mouse_cursor(null)
	print('done')
