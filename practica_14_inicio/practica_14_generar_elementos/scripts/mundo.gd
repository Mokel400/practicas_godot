extends Node2D
const ESCENA_MONEDA := preload("res://escenas/moneda.tscn")
var puntos := 0

@onready var marcador: Label = $Interfaz/Puntos


func _ready() -> void:
	actualizar_marcador()


func _on_moneda_recogida() -> void:
	puntos += 1
	actualizar_marcador()


func actualizar_marcador() -> void:
	marcador.text = "Puntos: " + str(puntos)


func _on_temporizador_timeout() -> void:
	var moneda := ESCENA_MONEDA.instantiate()
	moneda.position = Vector2(randf_range(20, 300), randf_range(20, 160))
	moneda.recogida.connect(_on_moneda_recogida)
	add_child(moneda)
