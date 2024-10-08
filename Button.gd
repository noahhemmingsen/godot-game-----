extends Button

@export var timing = 0

# Check if the button has been pressed and hide it if so
func _on_pressed():
	visible = false
	
# Add to the time
func _physics_process(delta):
	timing += delta
