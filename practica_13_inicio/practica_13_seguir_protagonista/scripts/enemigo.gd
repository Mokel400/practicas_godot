extends CharacterBody2D

@export var objetivo: Node2D
@export var velocidad := 50.0
var distancia_minima := 25.0
var animatedSprite = "$SpriteEnemigo"


func _physics_process(_delta: float) -> void:
	if objetivo == null:
		return
	var destino := objetivo.global_position
	if global_position.distance_to(destino) > distancia_minima:
		if global_position.distance_to(destino) < 100:
			velocity = global_position.direction_to(destino) * velocidad
		else:
			velocity = Vector2.ZERO
		
	else:
		velocity = Vector2.ZERO
	move_and_slide()
