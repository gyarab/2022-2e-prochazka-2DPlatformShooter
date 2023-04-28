extends Weapon
func _ready() -> void:
	projectile_scene = preload("res://src/Weapons/Projectiles/NormalBullet.tscn")
	fire_rate = 12
	burst_shots = 2
	burst_delay = 4
	spread_bottom = -5.0
	spread_top = 5.0
	
