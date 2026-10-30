extends CharacterBody2D


var velocidad = 300.0
const distancio_minima = 6
const distancia_maxima = 100
const distancia_reducir_velocidad = 50

func _physics_process(delta: float) -> void:
	var objetivo := get_global_mouse_position()
	look_at(objetivo)
	if global_position.distance_to(objetivo) > distancio_minima:
		if global_position.distance_to(objetivo) < distancia_reducir_velocidad:
			velocidad = move_toward(300, 0, 30)
		else:
			velocidad = 300
		velocity = global_position.direction_to(objetivo)
	else:
		velocity = Vector2.ZERO
	
	position.x = clamp(position.x, 0, 320)
	position.y = clamp(position.y, 0, 180)
	move_and_slide()
