extends AnimatedSprite2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("animacion_1"):
		play("quieto")
	if Input.is_action_just_pressed("animacion_2"):
		play("caminar")
	if Input.is_action_just_pressed("animacion_3"):
		play("correr")
	if Input.is_action_just_pressed("animacion_4"):
		play("saltar")
	if Input.is_action_just_pressed("mirar_derecha"):
		flip_h = true
	if Input.is_action_just_pressed("mirar_izquierda"):
		flip_h = false
