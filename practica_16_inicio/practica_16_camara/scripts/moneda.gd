extends Area2D

signal recogida


func _on_body_entered(_cuerpo: Node2D) -> void:
	recogida.emit()
	queue_free()
