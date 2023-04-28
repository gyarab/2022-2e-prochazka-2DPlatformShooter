extends Node2D

var STORM_SPEED = 200
var damage = 15
var player
var player_entered = false

func _process(delta: float) -> void:
	position.x += STORM_SPEED*delta
	if player_entered:
		player.take_damage(damage)
	
func _on_Area2D_body_entered(body: Node) -> void:
	if (body.get_name() == "Player"):
			player = body
			player_entered = true

func _on_Area2D_body_exited(body: Node) -> void:
	if (body.get_name() == "Player"):
			player = body
			player_entered = false
