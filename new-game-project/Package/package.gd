class_name Package extends RigidBody3D

const CENTRAL_FORCE : float = 50.0

var next_rotation_dir : Vector2 = Vector2.ZERO
var DRAG_TORQUE : float = 10000

@export var target : Marker3D

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	state.apply_central_force((target.global_position - global_position) * CENTRAL_FORCE)
	state.apply_central_force(Vector3(randf_range(-5, 5), randf_range(-5, 5), 0.0))
	state.apply_torque(Vector3(next_rotation_dir.y, next_rotation_dir.x, 0.0))
	next_rotation_dir = lerp(next_rotation_dir, Vector2.ZERO, 0.006)
