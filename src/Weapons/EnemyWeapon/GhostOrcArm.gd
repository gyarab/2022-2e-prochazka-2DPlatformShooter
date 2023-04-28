extends EnemyWeapon

func _ready() -> void:
	projectile_scene = preload("res://src/Weapons/EnemyWeapon/EnemyProjectiles/RedLaserBullet.tscn")
	fire_rate = 10
	spread_bottom = -10.0
	spread_top = 10.0
