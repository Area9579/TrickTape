class_name TapeDispenser extends Node3D

const TAPE = preload("uid://3l6601abffpf")
@onready var tape_location: Marker3D = $TapeLocation
var new_tape : Decal
@onready var sprite_3d: Sprite3D = $Sprite3D

var package : Package

#func _ready() -> void:
	#look_at(Vector3.ZERO)

#func _physics_process(delta: float) -> void:
	#global_position = lerp(global_position, get_parent().global_position, 2.0 * delta)

func _on_timer_timeout() -> void:
	if package == null:
		return
	new_tape = TAPE.instantiate() as Decal
	tape_location.add_child(new_tape)
	new_tape.global_transform = tape_location.global_transform
	new_tape.reparent(package, true)
