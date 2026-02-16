class_name WinLoseScreen extends Control

@onready var win_sprite: Sprite2D = $WinSprite
@onready var win_sprite_effect: Node2DEffect = $WinSprite/StampEffect


@onready var win_background: Sprite2D = $WinBackground
@onready var win_background_effect: Node2DEffect = $WinBackground/StampEffect

@onready var whimsy: Sprite2D = $Whimsy
@onready var stamp_effect: Node2DEffect = $Whimsy/StampEffect

func _ready() -> void:
	won()

func won() -> void:
	await get_tree().create_timer(1).timeout
	win_sprite.show()
	win_background.show()
	win_sprite_effect.do_tween_from_values(win_sprite.position, 60, Vector2(7,7))
	win_background_effect.do_tween_from_values(win_sprite.position, 60, Vector2(7,7))
	await win_background_effect.tween.finished
	whimsy.show()
	stamp_effect.do_tween_from_values(whimsy.position, 60, Vector2(10,10))


func lost() -> void:
	pass
