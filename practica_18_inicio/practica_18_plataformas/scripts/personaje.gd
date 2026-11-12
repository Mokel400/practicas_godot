extends CharacterBody2D

var velocidad := 100.0
var gravedad := 600.0
var fuerza_salto := 250.0
var saltos_restantes := 2


func _physics_process(delta: float) -> void:
	velocity.y += gravedad * delta

	if Input.is_action_just_pressed("saltar") and saltos_restantes > 0:
		saltos_restantes -= 1
		velocity.y = -fuerza_salto
			
	var direccion := Input.get_axis("mover_izquierda", "mover_derecha")
	velocity.x = direccion * velocidad

	move_and_slide()
	
	if is_on_floor():
		saltos_restantes = 2
