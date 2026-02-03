extends Node3D

const MOUSE_SENSITIVITY : float = 0.002
@onready var package_center_target: Marker3D = $PackageCenterTarget

@export var package : Package

func _input(event: InputEvent) -> void:
	if event is not InputEventMouseMotion:
		return
	if !Input.is_action_pressed("drag"):
		return
	
	drag(event)

func drag(event: InputEventMouseMotion):
	package.next_rotation_dir = event.relative


func _on_child_entered_tree(node: Node) -> void:
	if node is not Package:
		return
	print("Setting ", node, "'s target to ", package_center_target)
	node.target = package_center_target
	
