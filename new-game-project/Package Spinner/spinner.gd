extends Node3D

const MOUSE_SENSITIVITY : float = 0.002
const COVERAGE_INCREMENT_AMOUNT : float = 0.01
@onready var package_center_target: Marker3D = $PackageCenterTarget

@export var package : Package

var coverage : float

func _input(event: InputEvent) -> void:
	if event is not InputEventMouseMotion:
		return
	if !Input.is_action_pressed("drag"):
		return
	
	drag(event)

func drag(event: InputEventMouseMotion):
	coverage += COVERAGE_INCREMENT_AMOUNT * abs(event.relative.length())
	package.next_rotation_dir = event.relative
	coverage = clamp(coverage, 0, 100)
	print(coverage)


func _on_child_entered_tree(node: Node) -> void:
	if node is not Package:
		return
	print("Setting ", node, "'s target to ", package_center_target)
	node.target = package_center_target
	
