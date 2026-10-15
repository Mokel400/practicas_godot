extends Node2D

var puntos := 0

@onready var marcador: Label = $Interfaz/Puntos


func _ready() -> void:
	actualizar_marcador()


func _on_moneda_recogida() -> void:
	puntos += 1
	actualizar_marcador()


func actualizar_marcador() -> void:
	marcador.text = "Puntos: " + str(puntos)
