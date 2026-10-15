extends CharacterBody2D


var SPEED := 150.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	#Correr
	if Input.is_action_just_pressed("correr"):
		SPEED == 10000.0
	
	#Aplicar gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	#Gestionar salto
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direccion := Input.get_axis("mover_izquierda", "mover_derecha", )
	
	if direccion:
		velocity.x = direccion * SPEED
		animated_sprite.play("caminar")
		animated_sprite.flip_h = (direccion < 0)
	else:
		#Aplica desaceleración suave al parar el movimiento
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("quieto")
		
	position.x = clamp(position.x, 20, 1132)
	move_and_slide()



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		

	move_and_slide()
