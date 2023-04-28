extends KinematicBody2D
class_name EnemyWeapon

var fire_rate
var spread_bottom
var spread_top
var projectile_scene

var id
var rng = RandomNumberGenerator.new()
var acutal_fire_state = 0
var spread_angle
var player = null
onready var spawn_position = $Position2D
func _ready():
	scale.x = scale.x * -1
	scale.y = scale.y * -1

func _process(delta: float) -> void: #weapon rotation and ability to shoot
	if (player != null):
		look_at(player.position)
		shoot()
			
func shoot()->void: #function shooting: spawns bullet and sets it rotation
	acutal_fire_state = acutal_fire_state + 1 #adds value of 1 to actual_fire_state
	if acutal_fire_state == fire_rate : #when it reaches given fire rate it will fire
		acutal_fire_state = 0 #sets acutal_fire_state to 0 so the cycle can happen agian
		rng.randomize() #prepare rng for randomization
		spread_angle = rng.randf_range(spread_bottom,spread_top) #randomize the spread angle in given range
		var rad = deg2rad(spread_angle) #converts degrees to radians
		var projectile = projectile_scene.instance() #spawns the projectile	
		projectile.set_id(id)
		projectile.global_position = spawn_position.global_position #sets it to spawn location
		projectile.global_rotation = global_rotation + rad #sets it's rotation and spread angle
		get_tree().get_root().get_child(0).add_child(projectile) #adds it to the scene

func take_damage(damge):
	get_parent().take_damage(damge)

func set_target(target):
	player = target
func set_id(name):
	id = name
func get_id():
	return id
