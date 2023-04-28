extends Node2D

onready var dash_timer = $Dash_timer
onready var dash_particle = $Dash_particle
func _ready() -> void:
	dash_particle.one_shot = true
	dash_particle.emitting = false
func start_dash(duration):
	dash_timer.set_one_shot(true)
	dash_timer.set_wait_time(duration)
	dash_timer.start()
	
	
func emit_particles (var x) -> void:
	dash_particle.emitting = x
	
func is_dashing():
	return !dash_timer.is_stopped()
	
