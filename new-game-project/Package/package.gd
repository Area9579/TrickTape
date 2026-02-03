extends RigidBody3D

const CENTRAL_FORCE : float = 50.0

@export var target : Marker3D

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	state.apply_central_force((target.global_position - global_position) * CENTRAL_FORCE)
