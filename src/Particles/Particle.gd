extends Particles2D
class_name Particle

func _ready() -> void:
	set_one_shot(true)
	
func _process(delta: float) -> void:
	if (emitting == false):
		queue_free()
