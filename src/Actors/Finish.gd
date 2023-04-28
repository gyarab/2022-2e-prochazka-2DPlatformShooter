extends Node2D

func go_to_menu():
	get_tree().change_scene("res://src/GUI/Menu.tscn")
	
func _on_Area2D_body_entered(body: Node) -> void:
	if (body.get_name() == "Player"):
		go_to_menu()
