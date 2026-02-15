class_name Spinner extends Node3D
## subdcribe to chopiethecat on youtube c:

const MOUSE_SENSITIVITY : float = 0.002
const COVERAGE_INCREMENT_AMOUNT : float = 0.1

signal package_finished_wrapping

const PACKAGE = preload("uid://bbnhk1576kmjl")
const BOX = preload("uid://bf8owuegxjcly")
const MIGUEL = preload("uid://b0daissj7v7do")
const SKULL = preload("uid://73odhl4c6k8b")

var packages : Array[PackedScene] = [SKULL, BOX, MIGUEL]

@onready var package_center_target: Marker3D = $PackageCenterTarget

@export var package : Package
@export var tape_dispenser : TapeDispenser

var coverage : float

func _ready() -> void:
	packages.shuffle()
	go_to_next_package()

func _input(event: InputEvent) -> void:
	if event is not InputEventMouseMotion:
		return
	if !Input.is_action_pressed("drag"):
		return
	
	drag(event)

func drag(event: InputEventMouseMotion):
	var target_input_dir : Vector2 = Vector2(tape_dispenser.global_position.x, tape_dispenser.global_position.y)
	var spin_effectiveness : float = abs(target_input_dir.normalized().dot(event.relative.normalized()))
	var spin_power : float = clamp(0, 20,  event.relative.length())
	coverage += COVERAGE_INCREMENT_AMOUNT * spin_effectiveness * spin_power
	package.next_rotation_dir = event.relative
	coverage = clamp(coverage, 0, 100)
	if coverage == 100:
		coverage = 0
		go_to_next_package()
		package_finished_wrapping.emit()

func go_to_next_package():
	if packages.is_empty():
		return
	package.queue_free()
	package = packages.pop_front().instantiate()
	add_child(package)
	tape_dispenser.package = package
	

func _on_child_entered_tree(node: Node) -> void:
	if node is not Package:
		return
	print("Setting ", node, "'s target to ", package_center_target)
	node.target = package_center_target
