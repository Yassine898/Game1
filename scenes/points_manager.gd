extends Node

onready var text_label = $"%nb_points"

var points:int = 0


func increment_points():
	points+=1
	text_label.text=str(points)

func get_points():
	return points
