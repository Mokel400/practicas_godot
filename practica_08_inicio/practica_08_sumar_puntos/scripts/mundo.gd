extends Node2D

var puntos := 0

@onready var marcador: Label = $Interfaz/Puntos


func _ready() -> void:
	actualizar_marcador()
	
func _on_moneda_recogida() -> void:
	puntos += 1
	actualizar_marcador()
	
func actualizar_marcador() -> void:
	marcador.text = "Puntos: " + str(puntos) + " / 8"
	if (get_tree().get_nodes_in_group("monedas").size() == 0):
		marcador.text = "COMPLETADO!!!"
