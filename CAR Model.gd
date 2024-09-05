extends VehicleBody3D

func _physics_process(delta):
	engine_force = Input.get_action_strength("backward") - Input.get_action_strength("forward") * 400
	steering = Input.get_action_strength("left") - Input.get_action_strength("right") * 0.4
