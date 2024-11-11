extends StaticBody2D


# Health bar
@onready var health_bar = $ProgressBar

# Health
@export var health_points : int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Setting maximum and current value to fill the health bar
	health_bar.max_value = health_points
	health_bar.value = health_points

# Triggered when a damage dealer enters an area
func get_damage(amount):
	# Updating health
	health_points -= amount
	
	# Updating health bar
	health_bar.value = health_points
	
	# If enemy has 0 or less health points > delete from scene.
	if health_points <= 0:
		queue_free()
