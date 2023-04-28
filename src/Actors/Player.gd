extends Actors
export var playerSpeed: = Vector2(1000.0, 1000.0)

var directionX
var directionY = 0.0
var doublejump_charge = 0
var hp = 1000

onready var slot = $Slot
onready var weapon1 = $Slot/Weapon1
onready var weapon2 = $Slot/Weapon2
onready var healthbar = $HealthBar
onready var scorebar = $ScoreBar
var score = 0

#dash
var dashspeed = Vector2(2000.0, 2000.0 )
var dashlength = 0.3
var dash_velocity = Vector2.ZERO
var after_dash = false
var dash_charge = 0
onready var dash = $Dash

var root 
var level

func _ready():
	slot.remove_child(weapon2)
	#root = get_tree().get_root()
	#var level_resource = load("res://src/Levels/" + root.get_child(0).get_name() + ".tscn")
	#level = level_resource.instance()
func _physics_process(delta: float) -> void:
	var direction: = get_directoin()
	velocity = calculate_move_velocity(velocity,direction,playerSpeed)
	velocity = move_and_slide(velocity,FLOOR_NORMAL)
	
	swap_weapon()
func get_directoin() ->Vector2:
	
	directionX = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	return Vector2(directionX , directionY)

func calculate_move_velocity(
	velocity: Vector2,
	direction: Vector2,
	playerSpeed: Vector2
) -> Vector2:
	var new_velocity = velocity
	if (is_on_floor()):
		dash_charge = 1
		doublejump_charge = 1
	if (Input.is_action_just_pressed("dash") and dash_charge == 1):
		dash.start_dash(dashlength)
		dash_velocity = calculate_dash_velocity()
		after_dash = true
		dash_charge = 0
	if (dash.is_dashing() == true):
		new_velocity = dash_velocity
	else:
		new_velocity.x = playerSpeed.x * direction.x
		if (after_dash == true):
			after_dash = false
			new_velocity.y = 0.0
			dash.emit_particles(false)
		if( Input.is_action_just_pressed("jump")):
			if (is_on_floor()):
				new_velocity.y = calculate_jump_velocity(playerSpeed.y)
			elif(doublejump_charge == 1):
				new_velocity.y = calculate_jump_velocity(playerSpeed.y)
				doublejump_charge = 0
		new_velocity.y += calculate_gravity()
	return new_velocity
		
func take_damage(damge):
	hp = hp - damge
	healthbar.set_value(hp)
	if (hp < 1):
		death()
		#get_tree().change_scene("res://src/Levels/DeathScreen.tscn")
func calculate_jump_velocity(Height):
	return Height * -1
func swap_weapon():
	if (Input.is_action_just_pressed("weapon_swap_1")):
		slot.remove_child(weapon2)
		slot.add_child(weapon1)
	if (Input.is_action_just_pressed("weapon_swap_2")):
		slot.remove_child(weapon1)
		slot.add_child(weapon2)
		
func calculate_dash_velocity():
	dash.emit_particles(true)
	dash.look_at(get_global_mouse_position())
	return dashspeed * (get_global_mouse_position() - global_position).normalized()
	
func death():# changes scene to death screen
	get_tree().change_scene("res://src/Levels/DeathScreen.tscn")
	#var level_node = root.get_child(0)
	#var death_screen_resource = load("res://src/Levels/DeathScreen.tscn")
	#var death_screen = death_screen_resource.instance()
	#death_screen.set_current_level("res://src/Levels/" + root.get_child(0).get_name() + ".tscn")# passes data in what level is player in
	#root.remove_child(level_node)
	#root.add_child(death_screen)
	
func add_score(value):
	score += value
	scorebar.bbcode_text = str(score)
