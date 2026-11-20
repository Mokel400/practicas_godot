extends Area2D

@onready var personaje: CharacterBody2D = $"../Personaje"

func _on_body_entered(personaje: CharacterBody2D) -> void:
	personaje.morir()
