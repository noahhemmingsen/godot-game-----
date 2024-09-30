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
var count = 0

func _on_button_pressed():
	get_parent().get_node("Click").playing = true
	print("hello")
	time = 0
	continue_ = true
	print(position)
	get_parent().get_node("Node/ProgressBar").visible = true
	get_parent().get_node("Node/ColorRect").visible = false
	get_parent().get_node("Node/Menu Button").visible = false
	get_parent().get_node("Node/Help").visible = false
	get_parent().get_node("Node/Fastest Times").visible = false
	countdown()

	
func _physics_process(delta):
	if get_parent().get_node("Node/Countdown").visible != true:
		brake = Input.get_action_strength("forward") - Input.get_action_strength("backward") * 1500
		engine_force = Input.get_action_strength("backward") - Input.get_action_strength("forward") * -1500
		steering = Input.get_action_strength("left") - Input.get_action_strength("right") * 0.6
		if Input.get_action_strength("forward") > 0:
			get_node("Sound").pitch_scale = Input.get_action_strength("forward")
		elif Input.get_action_strength("backward") > 0:
			get_node("Sound").pitch_scale = Input.get_action_strength("backward")
		get_parent().get_node("Time_UI").text = str(time)
	if linear_velocity.x == 0:
		count += delta
	if count > 5 and Input.get_action_strength("backward") > 0:
		engine_force = Input.get_action_strength("backward") * 10
		count = 0
	speed = linear_velocity.length()
	if position != start_position:
		time += delta
	time = snapped(time, 0.001)
	if linear_velocity.x != 0:
		get_node("Sound").playing = true
	print("Vector3"+str(position)+",")
	speed = snapped(speed, 0)
	get_parent().get_node("Speedometer").text = (str(speed * 3) + "km/h")
	if position.y > 10:
		get_parent().get_node("Node/deathsound").playing = true
	if start_position.x - position.x < 10 or start_position.x - position.x > -10:
		final_time = time
		fastest_times.append(final_time)
		get_parent().get_node("Time_UI").text = str(final_time)
	if position.y < 5 or rotation_degrees.y > 180:
		get_parent().get_node("Node/ColorRect").visible = true
		get_parent().get_node("Node/Play").visible = true
		get_parent().get_node("Node/Title").text = "You fell off"
		get_parent().get_node("Node/Title").visible = true
		get_parent().get_node("Node/ProgressBar").visible = false
		get_parent().get_node("Node/Menu Button").visible = true
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
		get_parent().get_node("Node/Title").visible = false
		get_parent().get_node("Node/Play").visible = false
		get_parent().get_node("Node/ColorRect").visible = false
		get_parent().get_node("Node/ProgressBar").visible = true
		
	if get_parent().get_node("Node/Fastest Times").visible == true or get_parent().get_node("Node/Help").visible == true:
		get_parent().get_node("Node/Menu Button").visible = false
	if get_parent().get_node("Node/ColorRect").visible == false:
		get_parent().get_node("Node/Menu Button").visible = false
		
		
	if get_parent().get_node("Node/Countdown").visible == true:
		get_parent().get_node("Node/Countdown").text = str(5 - snapped(time*0.8, 1))
		get_parent().get_node("Time_UI").visible = false
		if get_parent().get_node("Node/Countdown").text < str(1):
			get_parent().get_node("Node/Countdown").visible = false
			get_parent().get_node("Time_UI").visible = true
			time = 0
			get_parent().get_node("Node/BUZZER").playing = true
	
func _on_help_pressed():
	get_parent().get_node("Click").playing = true
	get_parent().get_node("Node/ColorRect").visible = true
	get_parent().get_node("Node/Play").visible = false
	get_parent().get_node("Node/Title").visible = true
	get_parent().get_node("Node/ProgressBar").visible = false
	get_parent().get_node("Node/HelpText").visible = true
	get_parent().get_node("Node/Menu Button").visible = true
	get_parent().get_node("Node/Fastest Times").visible = false
	get_parent().get_node("Node/Menu Button").position = get_parent().get_node("Node/Play").position
	get_parent().get_node("Node/Menu Button").position.y = get_parent().get_node("Node/Play").position.y + 250
	get_parent().get_node("Node/Help").visible = false
	
func _on_menu_button_pressed():
	get_parent().get_node("Click").playing = true
	get_parent().get_node("Node/ColorRect").visible = true
	get_parent().get_node("Node/Play").visible = true
	get_parent().get_node("Node/Title").visible = true
	get_parent().get_node("Node/ProgressBar").visible = false
	get_parent().get_node("Node/Menu Button").visible = false
	get_parent().get_node("Node/Fastest Times").visible = true
	get_parent().get_node("Node/Help").visible = true
	get_parent().get_node("Node/HelpText").visible = false

func countdown():
	get_parent().get_node("Node/Countdown").visible = true
	get_parent().get_node("Node/COUNTING").playing = true
