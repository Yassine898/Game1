extends Area2D

onready var collectables=$"%collectables"
export (PackedScene) var new_scene :PackedScene

func _ready():
	get_node("AnimatedSprite").play("default")
func _on_Area2D_body_entered(body):
	var collectable_count = collectables.get_child_count() - 1
	print(collectable_count)
	if body.name=="player":
		if collectable_count ==0:
			get_tree().change_scene_to(new_scene)
			
