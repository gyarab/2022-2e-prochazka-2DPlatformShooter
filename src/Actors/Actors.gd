extends KinematicBody2D
class_name Actors

export var gravity: = 2000.0
const FLOOR_NORMAL: = Vector2.UP #what direction is floor
var velocity: = Vector2.ZERO

func calculate_gravity():
	var new_gravity = gravity * get_physics_process_delta_time()
	if (new_gravity > 5000):
		return 5000
	else:
		return new_gravity 
