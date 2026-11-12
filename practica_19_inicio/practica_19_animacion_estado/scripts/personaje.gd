extends CharacterBody2D

var velocidad := 100.0
var gravedad := 600.0
var fuerza_salto := 250.0

@onready var imagen: AnimatedSprite2D = $Imagen


func _physics_process(delta: float) -> void:
	velocity.y += gravedad * delta

	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = -fuerza_salto

	var direccion := Input.get_axis("mover_izquierda", "mover_derecha")
	if Input.is_action_pressed("correr"):
		velocidad = 200
	else:
		velocidad = 100
	velocity.x = direccion * velocidad

	move_and_slide()
	actualizar_animacion(direccion)

func actualizar_animacion(direccion: float) -> void:
	if not is_on_floor():
		if velocity.y < 0:
			imagen.play("saltar")
		else:
			imagen.play("caer")
	elif direccion != 0.0:
		imagen.play("caminar")
	else:
		imagen.play("quieto")
	if direccion != 0.0:
		imagen.flip_h = direccion > 0.0
