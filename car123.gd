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
var finished
var left_start

func _on_button_pressed():
	get_parent().get_node("Click").playing = true
	time = 0
	continue_ = true
	get_parent().get_node("Node/ProgressBar").visible = true
	get_parent().get_node("Node/ColorRect").visible = false
	get_parent().get_node("Node/Menu Button").visible = false
	get_parent().get_node("Node/Help").visible = false
	get_parent().get_node("Node/Fastest Times").visible = false
	get_parent().get_node("Node/smallTitle").visible = false
	get_parent().get_node("Node/bigTitle").visible = false
	get_parent().get_node("Node/Fastest Times").visible = false
	position = start_position
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
	if position.x != start_position.x - 100 or position.x != start_position + 100:
		time += delta
		left_start = true
	time = snapped(time, 0.001)
	if linear_velocity.x != 0:
		get_node("Sound").playing = true
	speed = snapped(speed, 0)
	get_parent().get_node("Speedometer").text = (str(speed * 3) + "km/h")
	if position.y > 10:
		get_parent().get_node("Node/deathsound").playing = true
	if start_position.x - position.x < 100 or start_position.x - position.x > -100 and start_position.y - position.y < 100 or start_position.y - position.y > 100 and left_start == true:
		final_time = time
		fastest_times.append(final_time)
		get_parent().get_node("Time_UI").text = str(final_time)
		finished = true
	if position.y < 5 or Input.is_action_pressed("menu"):
		get_parent().get_node("Node/ColorRect").visible = true
		get_parent().get_node("Node/Play").visible = true
		get_parent().get_node("Node/smallTitle").text = "The game is stopped"
		get_parent().get_node("Node/bigTitle").text = "The game is stopped"
		get_parent().get_node("Node/smallTitle").visible = true
		get_parent().get_node("Node/bigTitle").visible = true
		get_parent().get_node("Node/ProgressBar").visible = false
		get_parent().get_node("Node/Menu Button").visible = true
		get_parent().get_node("Node/Countdown").visible = false
	else:
		continue_ = false
	get_parent().get_node("Node/ProgressBar").value = speed
		
	if continue_ == true:
		
		position = start_position
		rotation = start_rotation

		# Reset linear and angular velocity to stop residual movement
		linear_velocity = Vector3.ZERO
		angular_velocity = Vector3.ZERO

		get_parent().get_node("Node/bigTitle").visible = false
		get_parent().get_node("Node/smallTitle").visible = false
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
			
	if DisplayServer.window_get_mode() == 3:
		get_parent().get_node("Node/Play").size.x = 900
		get_parent().get_node("Node/Play").size.y = 400
		get_parent().get_node("Node/Help").size.x = 900
		get_parent().get_node("Node/Help").size.y = 400
		get_parent().get_node("Node/Fastest Times").size.x = 900
		get_parent().get_node("Node/Fastest Times").size.y = 400
		get_parent().get_node("Node/Play").position.y = 400
		get_parent().get_node("Node/Help").position.y = 900
		get_parent().get_node("Node/Fastest Times").position.y = 1400
		get_parent().get_node("Node/Play").position.y = 400
		get_parent().get_node("Node/Help").position.y = 1400
		get_parent().get_node("Node/Fastest Times").position.y = 900
		get_parent().get_node("Node/Menu Button").position.y = 900
		get_parent().get_node("Node/Menu Button").position.x = get_parent().get_node("Node/Play").position.x
		get_parent().get_node("Node/Menu Button").size.x = 900
		get_parent().get_node("Node/Menu Button").size.y = 400

	else:
		get_parent().get_node("Node/Play").size.x = 200
		get_parent().get_node("Node/Play").size.y = 100
		get_parent().get_node("Node/Help").size.x = 200
		get_parent().get_node("Node/Help").size.y = 100
		get_parent().get_node("Node/Fastest Times").size.x = 200
		get_parent().get_node("Node/Fastest Times").size.y = 100
		get_parent().get_node("Node/Play").position.y = 172
		get_parent().get_node("Node/Help").position.y = 482
		get_parent().get_node("Node/Fastest Times").position.y = 333
	if DisplayServer.window_get_mode() == 3 and get_parent().get_node("Node/smallTitle").visible == true:
		get_parent().get_node("Node/bigTitle").visible = true
		get_parent().get_node("Node/smallTitle").visible = false
	elif DisplayServer.window_get_mode() == 0 and get_parent().get_node("Node/bigTitle").visible == true:
		get_parent().get_node("Node/bigTitle").visible = false
		get_parent().get_node("Node/smallTitle").visible = true
func _on_help_pressed():
	get_parent().get_node("Click").playing = true
	get_parent().get_node("Node/ColorRect").visible = true
	get_parent().get_node("Node/Play").visible = false
	get_parent().get_node("Node/smallTitle").visible = true
	get_parent().get_node("Node/bigTitle").visible = true
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
	get_parent().get_node("Node/smallTitle").visible = true
	get_parent().get_node("Node/bigTitle").visible = true
	get_parent().get_node("Node/ProgressBar").visible = false
	get_parent().get_node("Node/Menu Button").visible = false
	get_parent().get_node("Node/Fastest Times").visible = true
	get_parent().get_node("Node/Help").visible = true
	get_parent().get_node("Node/HelpText").visible = false

func countdown():
	get_parent().get_node("Node/Countdown").visible = true
	get_parent().get_node("Node/COUNTING").playing = true
