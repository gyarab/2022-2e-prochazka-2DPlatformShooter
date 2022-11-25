extends Node2D
class_name Projectile

var damge
var speed
var hitParticleScene

var velocity:Vector2

#triggers when instance is put into the tree
#transform.x is direction bullets right side is pointing to, meaning where it is pointing
func _ready()->void:								
	velocity = transform.x * speed					

func _physics_process(_delta:float)->void:
	translate(velocity*_delta)
	
func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_Area2D_body_entered(body: Node) -> void:
	print (body.get_name())
	if (body.get_name() != "Player"):
		var hitParticle = hitParticleScene.instance()
		queue_free()
		hitParticle.global_position = global_position
		get_tree().get_root().add_child(hitParticle)
		if (body.has_method("take_damage")):
			body.take_damage(damge)
