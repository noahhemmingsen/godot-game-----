extends PathFollow3D

var colorRect = null
var countdown = null
var userCar = null

func _ready() -> void:
	colorRect = get_parent().get_parent().get_parent().get_node("menuElements/colorRect")
	countdown = get_parent().get_parent().get_parent().get_node("menuElements/countdown")
	userCar = get_parent().get_parent().get_parent().get_node("userCar")

func _physics_process(delta):
	if colorRect.visible == false and countdown.visible == false:
		if userCar.time < 5:
			progress_ratio -= delta * 0.008
		else:
			progress_ratio -= delta * 0.020
