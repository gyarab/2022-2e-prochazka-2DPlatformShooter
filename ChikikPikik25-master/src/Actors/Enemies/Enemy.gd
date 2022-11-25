extends Actors
class_name Enemy

var maxHp 
var player = null
var id = get_name()

func _ready() -> void:
	for child in get_children():
		if child.has_method("set_id"):
			child.set_id(id)

func _on_Area2D_body_entered(body: Node) -> void: #this method sets target for it's weapons as player if the player entered enemy's range
	if (body.get_name() == "Player"):
		player = body
		for child in get_children():
			if child.has_method("set_target"):
				child.set_target(player)
func _on_Area2D_body_exited(body: Node) -> void:#this method sets target for it's weapons as null if the player left enemy's range
	if (body.get_name() == "Player"):
		player = null
		for child in get_children():
			if child.has_method("set_target"):
				child.set_target(player)
func take_damage(damge):
	maxHp = maxHp - damge
	print(maxHp)
	if (maxHp < 1):
		queue_free()
func get_id():
	return id
