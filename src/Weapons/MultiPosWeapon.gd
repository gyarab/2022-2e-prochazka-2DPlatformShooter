extends Weapon
class_name MultiPosWeapon

var pos_count

onready var pos_arr =[$Position2D, $Position2D2, $Position2D3, $Position2D4, $Position2D5, $Position2D6, $Position2D7, $Position2D8, $Position2D9]

func shoot()->void: #function shooting: spawns bullet and sets it rotation
	for n in pos_count:
		rng.randomize() #prepare rng for randomization
		spread_angle = rng.randf_range(spread_bottom,spread_top) #randomize the spread angle in given range
		var rad = deg2rad(spread_angle) #converts degrees to radians
		var projectile = projectile_scene.instance() #spawns the projectile	
		projectile.global_position = pos_arr[n].global_position #sets it to spawn location
		projectile.global_rotation = global_rotation + rad #sets it's rotation and spread angle
		get_tree().get_root().add_child(projectile) #adds it to the scene
