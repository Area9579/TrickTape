extends Node3D

@onready var coverage_bar: Control = $CoverageBar
@onready var spinner: Node3D = $Spinner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coverage_bar.spinner = spinner
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
