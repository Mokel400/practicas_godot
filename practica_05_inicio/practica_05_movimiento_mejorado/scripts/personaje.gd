extends Sprite2D

var velocidad := 100.0


func _process(delta: float) -> void:
	var direccion := Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	velocidad = lerp(0, 100, 1)
	position+= direccion * velocidad * delta
	position.x = clamp(position.x, 0, 320)
	position.y = clamp(position.y, 0, 180)
	
