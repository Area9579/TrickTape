extends Node3D

const MOUSE_SENSITIVITY : float = 0.002

@export var package : Package

func _input(event: InputEvent) -> void:
	if event is not InputEventMouseMotion:
		return
	if !Input.is_action_pressed("drag"):
		return
	
	drag(event)

func drag(event: InputEventMouseMotion):
	package.next_rotation_dir = event.relative
