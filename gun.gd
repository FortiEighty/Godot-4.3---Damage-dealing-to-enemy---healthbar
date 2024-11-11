extends Node2D

# Loading scene of the bullet to instantiate it when needed
@export var bulletScene : PackedScene

func _physics_process(delta: float) -> void:
	# Rotating object towards mouse cursor
	look_at(get_global_mouse_position())
	
	# Flipping sprite if needed
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1

func _unhandled_input(event: InputEvent) -> void:
	# Handling left mouse click to shoot
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		# Creating a bullet scene and adding it to a tree
		var new_bullet = bulletScene.instantiate()
		get_tree().root.add_child(new_bullet)
		# Setting correct position and rotation to bullet
		new_bullet.global_position = global_position
		new_bullet.rotation = rotation
