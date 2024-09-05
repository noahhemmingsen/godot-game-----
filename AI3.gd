extends VehicleBody3D

# Variables for car movement
var speed = 10.0
var turn_speed = 2.0
var acceleration = 10.0
var target_position: Vector3

# Navigation related
@onready var navigation = Vector3(-440, 160, -39)
var path = []
var current_path_index = 0

func _ready():
	# Set the initial target position (waypoint)
	target_position = Vector3(-440, 160, -39)
	calculate_path()

func _physics_process(delta):
	if path.size() > 0:
		# Get the next waypoint in the path
		var next_point = path[current_path_index]
		var direction = (next_point - global_transform.origin).normalized()
		
		# Move the car forward
		var move_vector = direction * speed * delta
		move_and_collide(move_vector)

		# Rotate the car towards the direction of movement
		var target_rotation = global_transform.basis.get_rotation_quaternion().slerp(
			Quaternion(Vector3.UP, atan2(direction.x, direction.z)), turn_speed * delta)
		global_transform.basis = Basis(target_rotation)

		# Check if the car is close enough to the next waypoint
		if global_transform.origin.distance_to(next_point) < 1.0:
			current_path_index += 1
			if current_path_index >= path.size():
				# If the car has reached the final waypoint, stop the car
				path = []

func calculate_path():
	# Use the navigation system to calculate a path to the target
	path = calculate_path()
	current_path_index = 0

# To dynamically update the waypoint and recalculate the path
func set_new_waypoint(new_target: Vector3):
	target_position = new_target
	calculate_path()
