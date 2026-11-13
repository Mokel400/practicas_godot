extends CharacterBody2D

var velocidad := 100.0
var vidas := 2
var invulnerable := false
@onready var imagen: Sprite2D = $Imagen
@onready var temporizador: Timer = $TemporizadorPersonaje

func _physics_process(_delta: float) -> void:
	var direccion := Input.get_vector(
		"mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	velocity = direccion * velocidad
	move_and_slide()

func recibir_danio(danio: int) -> void:
	if not invulnerable: 
		invulnerable = true
		vidas -= danio
		print("Vidas: ", vidas)
		if vidas == 0:
			queue_free()
		else:
			imagen.modulate = Color(1,1,1,0.4)
			await temporizador.esperar(0.5)
			imagen.modulate = Color(1,1,1,1)
		invulnerable = false
