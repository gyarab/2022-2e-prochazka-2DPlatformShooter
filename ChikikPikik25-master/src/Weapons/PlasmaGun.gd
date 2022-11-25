extends Weapon
func _ready() -> void:
	projectile_scene = preload("res://src/Weapons/Projectiles/PlasmaGunProjectile.tscn")
	fire_rate = 6
	spread_bottom = -10.0
	spread_top = 10.0
