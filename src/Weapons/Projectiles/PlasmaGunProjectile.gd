extends Projectile

func _init() -> void:
	speed = 1200
	damge = 100
	hitParticleScene = preload("res://src/Particles/PlasmaParticle.tscn")
	
