extends CharacterBody2D


var velocidad := 100.0
var gravedad := 600.0
var fuerza_salto := 250.0


func _physics_process(delta: float) -> void:
	velocity.y += gravedad * delta

	
	if Input.is_action_just_pressed("saltar"):
		velocity.y = -fuerza_salto
	if Input.is_action_just_released("saltar"):
		velocity.y = move_toward(velocity.y, 0, delta)

	var direction := Input.get_axis("mover_izquierda", "mover_derecha")
	velocity.x = direction * velocidad
	move_and_slide()
