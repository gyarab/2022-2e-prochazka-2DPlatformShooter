extends Node2D
var current_level

func set_current_level(level):
	current_level = level

func _input(event): #function which will load level in which player died after pressing any key
	if event is InputEventKey:
		if event.pressed and event.is_echo() == false:
			get_tree().change_scene("res://src/Levels/Level1.tscn")
			#var root = get_tree().get_root()
			#var death_screen = root.get_node("DeathScreen")
			#root.remove_child(death_screen)
			#root.add_child(current_level)
