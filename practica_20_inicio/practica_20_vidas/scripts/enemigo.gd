extends Area2D

@onready var temporizador: Timer = $Temporizador

func _on_body_entered(personaje: Node2D) -> void:
	while has_overlapping_bodies():
		personaje.recibir_danio(1)
		await temporizador.esperar(0.5)
