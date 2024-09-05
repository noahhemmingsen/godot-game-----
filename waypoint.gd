extends Node3D

@export var waypoint = Vector3(position)

func _physics_process(delta):
	waypoint = Vector3(position)
	print(waypoint)
	var engine_force = Input.get_action_strength("backward") - Input.get_action_strength("forward") * 500
