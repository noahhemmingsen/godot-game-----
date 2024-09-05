extends VehicleBody3D

var driving_time = Timer 
var speed
var time = 0.0
var final_time
var seconds
var fastest_times = []
var continue_
var start_rotation = rotation
var start_position = position

func _ready():
	get_parent().get_node("Node/ProgressBar").visible = false

func _on_button_pressed():
	print("hello")
	time = 0
	continue_ = true
	print(position)
	
func _physics_process(delta):
	brake = Input.get_action_strength("forward") - Input.get_action_strength("backward") * -1500
	engine_force = Input.get_action_strength("backward") - Input.get_action_strength("forward") * -1500
	steering = Input.get_action_strength("left") - Input.get_action_strength("right") * 0.6
	speed = linear_velocity.length()
	if position != start_position:
		time += delta
	time = snapped(time, 0.001)
	speed = snapped(speed, 0)
	get_parent().get_node("Speedometer").text = (str(speed * 3) + "km/h")
	get_parent().get_node("Time_UI").text = str(time)
	if start_position.x - position.x < 10 or start_position.x - position.x > -10:
		final_time = time
		fastest_times.append(final_time)
		get_parent().get_node("Time_UI").text = str(final_time)
	if position.y < 5:
		get_parent().get_node("Node/TextureRect").visible = true
		get_parent().get_node("Node/Button").visible = true
		get_parent().get_node("Node/Label").text = "You fell off"
		get_parent().get_node("Node/Label").visible = true
		get_parent().get_node("Node/ProgressBar").visible = true
	else:
		continue_ = false
	get_parent().get_node("Node/ProgressBar").value = speed
		
	if continue_ == true:
		
		position = start_position
		rotation = start_rotation

		# Reset linear and angular velocity to stop residual movement
		linear_velocity = Vector3.ZERO
		angular_velocity = Vector3.ZERO

		print(position)
		get_parent().get_node("Node/Label").visible = false
		get_parent().get_node("Node/Button").visible = false
		get_parent().get_node("Node/TextureRect").visible = false
		get_parent().get_node("Node/ProgressBar").visible = false
	
