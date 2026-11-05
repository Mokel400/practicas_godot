extends Node2D

var puntos := 0

@onready var marcador: Label = $Interfaz/Puntos
@onready var camara: Camera2D = $Personaje/Camara
@onready var personaje: CharacterBody2D = $Personaje

func _ready() -> void:
	actualizar_marcador()


func _on_moneda_recogida() -> void:
	puntos += 1
	agitar_camara()
	actualizar_marcador()


func actualizar_marcador() -> void:
	marcador.text = "Puntos: " + str(puntos)

func agitar_camara() -> void:
	camara.offset.x = randf_range(1, 5)
	camara.offset.y = randf_range(1, 5)
	camara.offset.x = 0
	camara.offset.y = 0
