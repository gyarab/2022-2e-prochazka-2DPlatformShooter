extends Projectile

func _init() -> void:
	speed = 2000
	damge = 200
	hitParticleScene = preload("res://src/Particles/NormalBulletParticle.tscn")
	
