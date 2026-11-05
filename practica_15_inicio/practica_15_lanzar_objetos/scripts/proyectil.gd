extends Area2D

var direccion := Vector2.RIGHT

var velocidad := 220.0

func _physics_process(delta: float) -> void:
	position += direccion * velocidad * delta
	rotation = direccion.angle()

func _on_screen_exited() -> void:
	queue_free()
