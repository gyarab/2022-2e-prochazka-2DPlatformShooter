extends Projectile

func _init() -> void:
	speed = 2600
	damge = 500
	hitParticleScene = preload("res://src/Particles/GreenLaserParticle.tscn")
	
