extends ParallaxLayer

var CLOUD_SPEED = -30

func _process(delta: float) -> void:
	self.motion_offset.x += CLOUD_SPEED*delta
