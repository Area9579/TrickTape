extends TextureProgressBar

@onready var timer: Timer = $".."
@onready var progress_bar: TextureProgressBar = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_bar.value = timer.time_left
	#print(timer.time_left)
