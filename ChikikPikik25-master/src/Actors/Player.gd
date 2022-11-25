extends Actors
export var playerSpeed: = Vector2(500.0, 700.0)

var directionX
var directionY = 0.0
var doublejumpState = 0
var hp = 1000

func _physics_process(delta: float) -> void:
	
	var direction: = get_directoin()
	velocity = calculate_move_velocity(velocity,direction,playerSpeed)
	velocity = move_and_slide(velocity,FLOOR_NORMAL)

func get_directoin() ->Vector2:
	
	directionX = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	directionY = 0.0
	if(is_on_floor()):
		doublejumpState = 1
	if( Input.is_action_just_pressed("jump")):
		if (is_on_floor()):
			directionY = -1.0 
		elif(doublejumpState == 1):
			directionY = -1.0
			doublejumpState = 0
	return Vector2(directionX , directionY)

func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	playerSpeed: Vector2
) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = playerSpeed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = playerSpeed.y * direction.y
	return new_velocity
		
func take_damage(damge):
	hp = hp - damge
	if (hp < 1):
		pass
