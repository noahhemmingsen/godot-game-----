extends VehicleBody3D

# Initialize all of the variables
var driving_time = Timer 
var speed
var time = 0.0
var finalTime
var seconds
var fastest_times = []
var continue_
var startRotation = Vector3(-0.2, 110.7, 1.5)
var startPosition = Vector3(-195.009, 82.451, 75.518)
var computerStartRotation = Vector3(0.084, 0.633, -0.462)
var computerStartPosition = Vector3(0.4, -11.9, 6)
var count = 0
var finished
var left_start
var finishLine = 0
var checkpoint = 0

# Set all of the nodes to "null" so that the are defined
var colorRect = null
var menuButton = null
var helpButton = null
var fastestTimes = null
var smallTitle = null
var bigTitle = null
var pathFollow = null
var click = null
var countdown = null
var carSound = null
var bigTimeInterface = null
var smallTimeInterface = null
var bigSpeedometer = null
var smallSpeedometer = null
var deathSound = null
var play = null
var help = null
var buzzer = null
var helpText = null
var counting = null
var userCar = null
var speedBar = null
var computerCar = null

func _ready() -> void:
	
	# Give paths to all the nodes as soon as the game loads
	colorRect = get_parent().get_node("menuElements/colorRect")
	menuButton = get_parent().get_node("menuElements/menuButton")
	helpButton = get_parent().get_node("menuElements/help")
	fastestTimes = get_parent().get_node("menuElements/fastestTimes")
	smallTitle = get_parent().get_node("menuElements/smallTitle")
	bigTitle = get_parent().get_node("menuElements/bigTitle")
	pathFollow = get_parent().get_node("track/trackPath/pathFollow")
	click = get_parent().get_node("Click")
	countdown = get_parent().get_node("menuElements/countdown")
	carSound = get_parent().get_node("sounds/carSound")
	smallTimeInterface = get_parent().get_node("userInterface/smallTimeInterface")
	bigTimeInterface = get_parent().get_node("userInterface/bigTimeInterface")
	bigSpeedometer = get_parent().get_node("userInterface/bigSpeedometer")
	smallSpeedometer = get_parent().get_node("userInterface/smallSpeedometer")
	deathSound = get_parent().get_node("sounds/deathSound")
	play = get_parent().get_node("menuElements/play")
	help = get_parent().get_node("menuElements/help")
	buzzer = get_parent().get_node("sounds/buzzer")
	helpText = get_parent().get_node("menuElements/helpText")
	counting = get_parent().get_node("sounds/counting")
	userCar = get_parent().get_node("userCar")
	speedBar = get_parent().get_node("userInterface/speedBar")
	computerCar = get_parent().get_node("track/trackPath/pathFollow/computerCar")

func _on_button_pressed():
	# Adjust variables
	click.playing = true
	time = 0
	continue_ = true
	pathFollow.progress_ratio = 0
	checkpoint = 0
	finishLine = 0
	
	# Hide the menu elements
	speedBar.visible = true
	colorRect.visible = false
	menuButton.visible = false
	helpButton.visible = false
	fastestTimes.visible = false
	smallTitle.visible = false
	bigTitle.visible = false
	fastestTimes.visible = false
	
	# Start the countdown
	countDown()

func _physics_process(delta):
	# Check if the user is playing
	if countdown.visible != true:
		speedBar.visible = true
		
		# Allow the user to break depending on their input
		brake = Input.get_action_strength("forward") - Input.get_action_strength("backward") * 1500
		
		# Allow the user to accelerate depending on their input
		engine_force = Input.get_action_strength("backward") - Input.get_action_strength("forward") * -1500
		
		# Allow the user to steer with the left and right keys
		steering = Input.get_action_strength("left") - Input.get_action_strength("right") * 0.6
		
		# Adjust the sound of the engine to match the strength of the engine force
		if Input.get_action_strength("forward") > 0:
			carSound.pitch_scale = Input.get_action_strength("forward")
		elif Input.get_action_strength("backward") > 0:
			carSound.pitch_scale = Input.get_action_strength("backward")
			
		# Update the displayed time
		smallTimeInterface.text = str(time)
		bigTimeInterface.text = str(time)
	
	# Check if the car is stationary and continue the countdown
	if linear_velocity.x == 0:
		count += delta
	
	# Allow the user to drive backwards
	if count > 5 and Input.get_action_strength("backward") > 0:
		engine_force = Input.get_action_strength("backward") * 10
		count = 0
	# Update the speed so that it can be displayed
	speed = linear_velocity.length()
	
	# Check if the car has not finished and continue updating the time if so
	if finishLine <= 1:
		time += delta
	
	# Truncate the time value so it can be displayed
	time = snapped(time, 0.001)
	
	# Check if the car is moving and play a sound if so
	if linear_velocity.x != 0:
		carSound.playing = true
	
	# Truncate the speed value for display purposes
	speed = snapped(speed, 0)
	
	# Update the text of the speedometers to match the car's speed
	bigSpeedometer.text = (str(speed * 3) + "km/h")
	smallSpeedometer.text = (str(speed * 3) + "km/h")
	
	# Check if the car had fallen off
	if position.y > 10:
		
		# Play the death sound if the car has fallen off
		deathSound.playing = true
	
	# Check if the player has finished
	if finishLine > 1 and checkpoint >= 1:
		finalTime = time
		finished = true
		
		# Check if the user's time was less than the computer's
		if finalTime < 53:
			
			# Inform the user they have won
			bigTitle.text = "You Won!"
			smallTitle.text = "You Won!"
			bigTitle.visible = true
			smallTitle.visible = true
		else:
			
			# Inform the user that they have lost
			bigTitle.text = "You Lost"
			smallTitle.text = "You Lost"
			bigTitle.visible = true
			smallTitle.visible = true
	
	# Check if the menu needs to be displayed
	if position.y < 5 or Input.is_action_pressed("menu"):
		
		# Display all of the menu elements and remove the UI elements
		colorRect.visible = true
		play.visible = true
		smallTitle.text = "The game is stopped"
		bigTitle.text = "The game is stopped"
		smallTitle.visible = true
		bigTitle.visible = true
		speedBar.visible = false
		menuButton.visible = true
		countdown.visible = false
	else:
		continue_ = false
		
		# Update the value of the visual speedometer
		speedBar.value = speed
		
	# Check if the user has chosen to respawn
	if continue_ == true:
		# Respawn the user's car in the correct position
		position = startPosition
		rotation = startRotation
		
		# Respawn the computer car in the correct position
		computerCar.position = computerStartPosition
		computerCar.rotation = computerStartRotation
		
		# Hide all the menu elements
		bigTitle.visible = false
		smallTitle.visible = false
		play.visible = false
		colorRect.visible = false
		speedBar.visible = true
		
	# Make the menu button invisibl
	if fastestTimes.visible == true or help.visible == true:
		menuButton.visible = false
	if colorRect.visible == false:
		menuButton.visible = false
		
	# Check if the countdown is still ongoing
	if countdown.visible == true:
		
		# Slow the countdown to match the sound and truncate the time
		countdown.text = str(5 - snapped(time*0.8, 1))
		smallTimeInterface.visible = false
		bigTimeInterface.visible = false
		
		# Check if the countdown is less than one and make it invisible
		if countdown.text < str(1):
			countdown.visible = false
			smallTimeInterface.visible = true
			bigTimeInterface.visible = true
			time = 0
			buzzer.playing = true
	
	# Check if the game is in full screen mode
	if DisplayServer.window_get_mode() == 3:
		
		# Make all the menu elements larger
		play.size.x = 900
		play.size.y = 400
		help.size.x = 900
		help.size.y = 400
		fastestTimes.size.x = 900
		fastestTimes.size.y = 400
		play.position.y = 400
		help.position.y = 900
		fastestTimes.position.y = 1400
		play.position.y = 400
		help.position.y = 1400
		fastestTimes.position.y = 900
		menuButton.position.y = 900
		menuButton.position.x = play.position.x
		menuButton.size.x = 900
		menuButton.size.y = 400
		
		# Check if the speedometer is visible
		if smallSpeedometer.visible == true or bigSpeedometer.visible == true:
			
			# Only display the larger speedometer
			bigSpeedometer.visible = true
		smallSpeedometer.visible = false
		
		# Check if the timer is visible
		if smallTimeInterface.visible == true or bigTimeInterface.visible == true:
			
			# Only display the larger timer
			bigTimeInterface.visible = true
		smallTimeInterface.visible = false

	else:
		
		# Make all of menu elements smaller
		play.size.x = 200
		play.size.y = 100
		help.size.x = 200
		help.size.y = 100
		fastestTimes.size.x = 200
		fastestTimes.size.y = 100
		play.position.y = 172
		help.position.y = 482
		fastestTimes.position.y = 333
		
		# Check if the speedometer is visible
		if smallSpeedometer.visible == true or bigSpeedometer.visible == true:
			
			# Only show the smaller speedometer
			smallSpeedometer.visible = true
		bigSpeedometer.visible = false
		
		# Check if the timer is visible
		if smallTimeInterface.visible == true or bigTimeInterface.visible == true:
			
			# Only display the smaller timer
			smallTimeInterface.visible = true
		bigTimeInterface.visible = false
	
	# Check if the game is in full screen mode and the title is visible
	if DisplayServer.window_get_mode() == 3 and smallTitle.visible == true:
		
		# Only show the larger title
		bigTitle.visible = true
		smallTitle.visible = false
	
	# Check if the game is not in full screen mode and the title is visible
	elif DisplayServer.window_get_mode() < 3 and bigTitle.visible == true:
		
		# Only show the smaller title
		bigTitle.visible = false
		smallTitle.visible = true

# Check if the help button has been pressed
func _on_help_pressed():
	
	# Display all the menu elements
	click.playing = true
	colorRect.visible = true
	play.visible = false
	smallTitle.visible = true
	bigTitle.visible = true
	speedBar.visible = false
	helpText.visible = true
	menuButton.visible = true
	fastestTimes.visible = false
	menuButton.position = play.position
	menuButton.position.y = play.position.y + 250
	help.visible = false
	
# Check if the menu button has been pressed
func _on_menu_button_pressed():
	
	# Display all of the menu elements
	click.playing = true
	colorRect.visible = true
	play.visible = true
	smallTitle.visible = true
	bigTitle.visible = true
	speedBar.visible = false
	menuButton.visible = false
	fastestTimes.visible = true
	help.visible = true
	helpText.visible = false

# countDown variable
func countDown():
	# Start the countdown
	countdown.visible = true
	counting.playing = true

# Run the function if a body has collided with the finish line
func _on_finish_area_body_entered(body: Node3D) -> void:
	
	# Check if the body was the user's car
	if body == userCar:
		
		# Update the finishLine variable to account for the car's progress
		finishLine += 1
		
		# Carry out a validity check to see if the code is working
		print("finish line: " + str(finishLine))

# Run the function if a body has collided with the checkpoint
func _on_checkpoint_body_entered(body: Node3D) -> void:
	
	# Check if the body was the user's car
	if body == userCar:
		
		# Update the checkpoint variable to reflect the car's progress
		checkpoint += 1
		
		# Carry out a validity check to test the code
		print("checkpoint: " + str(checkpoint))
