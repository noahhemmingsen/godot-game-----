extends VehicleBody3D

var OUTSIDEBARRIER = get_parent().get_child("OUTSIDEBARRIER")

var INSIDEBARRIER = get_parent().get_node("INSIDEBARRIER")

var outside_distance = 0

var inside_distance = 0

func _physics_process(delta):
	outside_distance = OUTSIDEBARRIER.position - position
	inside_distance = INSIDEBARRIER.position - position
	print(outside_distance)
	print(inside_distance)
