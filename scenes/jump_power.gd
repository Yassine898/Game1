extends Area2D


onready var animation = $"%AnimatedSprite"
func _ready():
	animation.play("default")
	
	

func _on_energe_body_entered(body):
	if body.name=="player":
		body.increment_jump()
		body.time_jump()
		queue_free()
		
		
