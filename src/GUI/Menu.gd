extends Node2D


func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://src/Levels/Level1.tscn")


func _on_ExitButton_pressed() -> void:
	get_tree().quit()


func _on_FullScreenButton_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
