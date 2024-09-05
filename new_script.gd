extends VehicleBody3D
var time_accumulator = 0.0  # This will accumulate time

var driving_time = Timer 
var speed = linear_velocity.length()

func _physics_process(delta):
	brake = Input.get_action_strength("forward") - Input.get_action_strength("") * -300
	engine_force = 500
	steering = Input.get_action_strength("left") - Input.get_action_strength("right") * 0.6
	time_accumulator += delta  # Add the frame time to the accumulator
	if time_accumulator >= 0.2:  # Check if a second has passed
		print("Vector3"+str(position)+",")
		time_accumulator = 0.0  # Reset the accumulator
	speed = linear_velocity.length()
