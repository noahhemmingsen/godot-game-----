extends PathFollow3D

# Set all the nodes to "null" so that they are defined
var colorRect = null
var countdown = null
var userCar = null

func _ready() -> void:
	
	# Assign all of the nodes to their paths
	colorRect = get_parent().get_parent().get_parent().get_node("menuElements/colorRect")
	countdown = get_parent().get_parent().get_parent().get_node("menuElements/countdown")
	userCar = get_parent().get_parent().get_parent().get_node("userCar")

func _physics_process(delta):
	
	# Check if the game is in progress
	if colorRect.visible == false and countdown.visible == false:
		
		# Drive the AI car around the track
		if userCar.time < 5:
			progress_ratio -= delta * 0.008
		else:
			progress_ratio -= delta * 0.020
