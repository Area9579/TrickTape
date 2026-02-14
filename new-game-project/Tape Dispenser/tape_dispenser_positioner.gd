extends Node3D

@onready var left: Marker3D = $Left
@onready var right: Marker3D = $Right
@onready var up: Marker3D = $Up
@onready var down: Marker3D = $Down

@onready var positions : Array[Marker3D] = [left, right, up, down]

@export var tape_dispenser : TapeDispenser

func _ready() -> void:
	positions.shuffle()
	set_new_dispenser_location()

func set_new_dispenser_location():
	tape_dispenser.reparent(positions.pop_front(), false)

func _physics_process(_delta: float) -> void:
	if positions.is_empty():
		return
	
	if Input.is_action_just_pressed("NewTapePosition"):
		set_new_dispenser_location()
