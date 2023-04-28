extends Node2D
class_name EnemyProjectile

var damage
var speed
var hitParticleScene
var id

var velocity:Vector2

	
#triggers when instance is put into the tree
#transform.x is direction bullets right side is pointing to, meaning where it is pointing
func _ready()->void:								
	velocity = transform.x * speed * -1
func _physics_process(_delta:float)->void:
	translate(velocity*_delta)
	scale.x = scale.x * -1
	scale.y = scale.y * -1
func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_Area2D_body_entered(body: Node) -> void:
	if !(body.has_method("get_id") and body.get_id() == id):
		var hitParticle = hitParticleScene.instance()
		queue_free()
		hitParticle.global_position = global_position
		get_tree().get_root().get_child(0).add_child(hitParticle)
		if (body.get_name() == "Player"):
			body.take_damage(damage)

func set_id(name):
	id = name


	
