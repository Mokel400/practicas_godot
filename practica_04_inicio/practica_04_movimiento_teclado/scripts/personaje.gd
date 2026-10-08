extends AnimatedSprite2D

var velocidad := 100.0

func _process(delta: float) -> void:

	if Input.is_action_pressed("mover_izquierda"):

		position.x -= velocidad * delta

		flip_h = false

	if Input.is_action_pressed("mover_derecha"):

		position.x += velocidad * delta

		flip_h = true

	if Input.is_action_pressed("mover_arriba"):

		position.y -= velocidad * delta

	if Input.is_action_pressed("mover_abajo"):

		position.y += velocidad * delta

	if Input.is_action_pressed("correr"):

		velocidad = 150.0

	#else:

		#velocidad = 90.0

	if Input.is_action_just_released("correr"):

		velocidad = 90.0

	if Input.is_anything_pressed():

		play("caminar")

	else:

		play("quieto")

 
