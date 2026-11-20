extends CharacterBody2D

@onready var sprite :AnimatedSprite2D = $SpritePersonaje

const velocidad = 300.0
const JUMP_VELOCITY = -400.0
const gravedad := 1100
var saltos_restantes := 2
var fuerza_salto := 550.0

func _physics_process(delta: float) -> void:
	velocity.y += gravedad * delta

	if Input.is_action_just_pressed("saltar") and saltos_restantes > 0:
		saltos_restantes -= 1
		velocity.y = -fuerza_salto
	if Input.is_action_just_released("saltar") and velocity.y < 0:
		if velocity.y < 100:
			velocity.y *= 0.65
			
	var direccion := Input.get_axis("mover_izquierda", "mover_derecha")
	velocity.x = direccion * velocidad

	move_and_slide()
	actualizar_animacion(direccion)
	position.x = clamp(position.x, 25, 1000000)
	
	if is_on_floor():
		saltos_restantes = 2

	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func actualizar_animacion(direccion: float) -> void:
	if not is_on_floor():
		if velocity.y < 0:
			sprite.play("jump")
		else:
			sprite.play("fall")
	elif direccion != 0.0:
		sprite.play("walk")
	else:
		sprite.play("idle")
	if direccion != 0.0:
		sprite.flip_h = direccion < 0.0

func morir() -> void:
	queue_free()
