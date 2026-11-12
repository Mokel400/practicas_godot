extends CharacterBody2D

var velocidad := 100.0
var gravedad := 600.0
var fuerza_salto := 250.0


func _physics_process(delta: float) -> void:
	velocity.y += gravedad * delta

	
	if Input.is_action_just_pressed("saltar"):
		velocity.y = -fuerza_salto
	if Input.is_action_just_released("saltar") and velocity.y < 0:
		if velocity.y < 100:
			velocity.y *= 0.65
	if velocity.y >= 0:
		velocity.y += 10

	var direction := Input.get_axis("mover_izquierda", "mover_derecha")
	velocity.x = direction * velocidad
	move_and_slide()
