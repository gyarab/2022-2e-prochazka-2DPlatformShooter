extends MultiPosWeapon

func _ready() -> void:
	projectile_scene = preload("res://src/Weapons/Projectiles/LifeMatterProjectile.tscn")
	fire_rate = 3
	spread_bottom = -15.0
	spread_top = 15.0
	pos_count = 9
