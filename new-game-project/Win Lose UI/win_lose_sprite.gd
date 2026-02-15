class_name WinLoseSprite extends Sprite2D

@onready var node_2d_effect: Node2DEffect = $Node2DEffect

func _ready() -> void:
	rotation_degrees = 26
	hide()
	
	win()
	


func win() -> void:
	show()
	await get_tree().create_timer(0.5).timeout
	node_2d_effect.do_tween()


func lose() -> void:
	show()
	await get_tree().create_timer(0.5).timeout
	node_2d_effect.do_tween()
