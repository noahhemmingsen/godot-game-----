extends Button

@export var timing = 0

func _on_pressed():
	visible = false
	
func _physics_process(delta):
	timing += delta
