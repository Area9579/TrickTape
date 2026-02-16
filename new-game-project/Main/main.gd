extends Node3D

@onready var coverage_bar: Control = $CoverageBar as Control
@onready var spinner: Spinner = $Spinner as Spinner
@onready var timer: TextureProgressBar = $Timer

var wrapped_packages_num : int = 0

signal game_was_lost

func _ready() -> void:
	coverage_bar.spinner = spinner
	spinner.package_finished_wrapping.connect(_on_package_finished_wrapping)
	timer.player_died.connect(_on_player_died)

func _on_player_died():
	game_was_lost.emit()
	print('player died')

func _on_package_finished_wrapping():
	wrapped_packages_num += 1
	timer.start()
	if wrapped_packages_num == 3:
		# TODO: Connect to framework to cycle to next screen
		print('win game')
		#get_tree().quit()
