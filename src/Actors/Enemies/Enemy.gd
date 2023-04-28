extends Actors
class_name Enemy

var maxHp 
var score
var player = null
var id = get_name()

func _ready() -> void:
	for child in get_children():
		if child.has_method("set_id"):
			child.set_id(id)
			
func _physics_process(delta: float) -> void:
	velocity.y += calculate_gravity()
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
	
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
	if (maxHp == 0):
		death()
func get_id():
	return id
	
func death():
	var player_global
	player_global = get_tree().get_root().get_child(0).get_node("Player")
	player_global.add_score(score)
	queue_free()
