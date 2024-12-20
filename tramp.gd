extends StaticBody2D




func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "move_up":
		get_node("AnimationPlayer").play("move_down")
	elif anim_name =="move_down":
		get_node("AnimationPlayer").play("move_up")
	elif anim_name == "move_left":
		get_node("AnimationPlayer").play("move_right")
	elif anim_name == "move_right":
		get_node("AnimationPlayer").play("move_left")
