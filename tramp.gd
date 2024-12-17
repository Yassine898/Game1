extends StaticBody2D




func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "move_up":
		get_node("AnimationPlayer").play("move_down")
	elif anim_name =="move_down":
		get_node("AnimationPlayer").play("move_up")
