class_name Package extends RigidBody3D

const CENTRAL_FORCE : float = 50.0
const DRAG_TORQUE : float = 0.3

var next_rotation_dir : Vector2 = Vector2.ZERO
var target : Marker3D


func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if target != null:
		state.apply_central_force((target.global_position - global_position) * CENTRAL_FORCE)
	else:
		target = get_tree().get_first_node_in_group("PackageTarget")
	state.apply_central_force(Vector3(randf_range(-5, 5), randf_range(-5, 5), 0.0))
	state.apply_torque(Vector3(next_rotation_dir.y, next_rotation_dir.x, 0.0) * DRAG_TORQUE)
	next_rotation_dir = lerp(next_rotation_dir, Vector2.ZERO, 0.006)
