extends Node2D

# Speed of the bullet
@export var speed : int = 500

# Damage
@export var damage : int = 25

# Change position towards rotation
func _process(delta: float) -> void:
	position += transform.x * speed * delta

# When object leaves the screen > delete it from tree
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

# Triggered when another Area2D enters bullet's area
func _on_area_2d_area_entered(area: Area2D) -> void:
	# If entered area has funciton 'Get Damage' then calling this function
	# And passing amount of damage done by bullet
	if area.get_parent().has_method("get_damage"):
		area.get_parent().get_damage(damage)
		# If bullet did damage > deleting it from scene immediately
		queue_free()
