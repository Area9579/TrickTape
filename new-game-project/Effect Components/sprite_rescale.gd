class_name SpriteEffect extends Node

@export var sprite : Sprite2D

@export var new_scale : float = 1.0
@export var trans_type : Tween.TransitionType
@export var ease_type : Tween.EaseType
@export var tween_duration : float = 0.1

var tween : Tween

func _ready() -> void:
	pass


## This function resets and creates a new tween with all given parameters:
## [member trans_type], [member ease_type], []
func reset_tween():
	# If there is a current tween, abort it
	if tween:
		tween.kill()
	# Create the tween with the [membet ease_type], [member trans_type] and
	# allow for tweening to be done simultaneously
	tween = create_tween().set_ease(ease_type).set_trans(trans_type).set_parallel(true)
