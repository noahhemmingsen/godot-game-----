extends PathFollow3D

func _physics_process(delta):
	if get_parent().get_parent().get_parent().get_node("Node/ColorRect").visible == false and get_parent().get_parent().get_parent().get_node("Node/Countdown").visible == false: 
		progress_ratio -= delta * 0.012
