extends Node3D

@onready var coverage_bar: Control = $CoverageBar as Control
@onready var spinner: Spinner = $Spinner as Spinner

var wrapped_packages_num : int = 0

func _ready() -> void:
	coverage_bar.spinner = spinner
	spinner.package_finished_wrapping.connect(_on_package_finished_wrapping)


func _on_package_finished_wrapping():
	wrapped_packages_num += 1
	if wrapped_packages_num == 3:
		# TODO: Connect to framework to cycle to next screen
		print('win game')
		#get_tree().quit()
