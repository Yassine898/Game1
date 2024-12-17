extends Area2D

onready var  manager = get_parent().get_node("points_manager")
onready var animation = $"%AnimatedSprite"

func _on_collectable_body_entered(body):
	if body.name=="player":
		animation.play("default")
		yield(animation,"animation_finished")
		manager.increment_points()
		queue_free()
		
