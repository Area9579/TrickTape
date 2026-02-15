class_name TapeDispenser extends Node3D

const TAPE = preload("uid://3l6601abffpf")
@onready var tape_location: Marker3D = $TapeLocation
var new_tape : Decal

var package : Package

#func _ready() -> void:
	#look_at(Vector3.ZERO)

func _on_timer_timeout() -> void:
	if package == null:
		return
	new_tape = TAPE.instantiate() as Decal
	tape_location.add_child(new_tape)
	new_tape.global_transform = tape_location.global_transform
	new_tape.reparent(package, true)
