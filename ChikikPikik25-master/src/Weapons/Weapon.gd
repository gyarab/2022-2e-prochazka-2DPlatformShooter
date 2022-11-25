extends Sprite
class_name Weapon

#variables that are declared by child
var projectile_scene
var fire_rate
var spread_bottom
var spread_top

#variables that are NOT declared by child
var rng = RandomNumberGenerator.new()
var spread_angle
var acutal_fire_state = 0
onready var SpawnPosition: = $Position2D

func _process(delta: float) -> void: #weapon rotation and ability to shoot
	
	var mouse_pos = get_global_mouse_position() #seek mouse position
	look_at(mouse_pos) #make weapon look at mousposition
	global_rotation = (mouse_pos - global_position).angle() #calculates rotation of weapon
	if (global_rotation < PI/2 and global_rotation > -PI/2): #flips weapon
		scale.y = 1
	else:
		scale.y = -1	
	if Input.is_action_pressed("fire"): #calls shoot if is pressed fire action
			shoot()
			
func shoot()->void: #function shooting: spawns bullet and sets it rotation
	acutal_fire_state = acutal_fire_state + 1 #adds value of 1 to actual_fire_state
	if acutal_fire_state == fire_rate : #when it reaches given fire rate it will fire
		acutal_fire_state = 0 #sets acutal_fire_state to 0 so the cycle can happen agian
		rng.randomize() #prepare rng for randomization
		spread_angle = rng.randf_range(spread_bottom,spread_top) #randomize the spread angle in given range
		var rad = deg2rad(spread_angle) #converts degrees to radians
		var projectile = projectile_scene.instance() #spawns the projectile	
		projectile.global_position = SpawnPosition.global_position #sets it to spawn location
		projectile.global_rotation = global_rotation + rad #sets it's rotation and spread angle
		get_tree().get_root().add_child(projectile) #adds it to the scene


	
