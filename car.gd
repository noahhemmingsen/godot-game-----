extends VehicleBody3D

var max_rpm = 500
var max_torque = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta):
	steering = lerp(steering, Input.get_action_strength("backward") - Input.get_action_strength("forward") * 0.4, 5 * delta)
	var rpm = abs($back_left_wheel.get_rpm())
	rpm = abs($back_right_wheel.get_rpm())
	$front_left.steering = steering
	$front_right.steering = steering
	var acceleration = Input.get_action_strength("left") - Input.get_action_strength("right") * 100
	$rear_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = $rear_right.get_rpm()
	$rear_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	$rear_left.brake = 0 if acceleration != 0 else max_torque
