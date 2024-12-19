extends Area2D

onready var animation = $"%AnimatedSprite"
onready var progress_bar=get_parent().get_parent().get_node("ui/ProgressBar")
onready var tween = get_parent().get_parent().get_node("ui/Tween")


func _ready():
	animation.play("default")
	progress_bar.max_value=20

func _on_energe_body_entered(body):
	if body.name == "player":
		body.increment_jump()
		body.time_jump()
		progress_bar.value=20
		decrement_bar()
		queue_free()


func decrement_bar():
	if progress_bar:
		tween.interpolate_property(
			progress_bar, "value", progress_bar.value, 0, 20.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()
