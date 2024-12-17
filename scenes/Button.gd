extends Button


export (PackedScene) var new_scene :PackedScene

func _on_Button_pressed():
	get_tree().change_scene_to(new_scene)
