extends Node

@onready var parallax_background: Parallax2D = $Background/ParallaxBackground
@onready var main: Node3D = $SubViewportContainer/SubViewport/Main
@onready var win_lose_screen: WinLoseScreen = $"Win_Lose Screen"


func _ready() -> void:
	main.game_was_lost.connect(lost_game)


func lost_game() -> void:
	win_lose_screen.lost()
	parallax_background.lost_game()
	await win_lose_screen.lost_anim_finished
	print('done')
