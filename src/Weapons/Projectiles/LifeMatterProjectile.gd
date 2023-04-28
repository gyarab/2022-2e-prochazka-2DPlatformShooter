extends Projectile

func _init() -> void:
	speed = 1600
	damge = 100
	hitParticleScene = preload("res://src/Particles/GreenLaserParticle.tscn")
	
