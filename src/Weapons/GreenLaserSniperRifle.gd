extends Weapon

func _ready() -> void:
	projectile_scene = preload("res://src/Weapons/Projectiles/GreenLaserProjectile.tscn")
	fire_rate = 20
	spread_bottom = -2.0
	spread_top = 2.0
