extends Node2D

@onready var marcador: Label = $Interfaz/Vidas
@onready var contador : Label = $Interfaz/Contador
@onready var personaje: CharacterBody2D = $Personaje

var vidas_iniciales := 2
var contador_segundos := 0	
var tiempo_acumulado := 0.0

func _process(delta: float) -> void:
	contador_segundos += delta
	print(contador_segundos)
	contador.text = "Tiempo: " + str(contador_segundos)

func _ready() -> void:
	_on_personaje_vidas_cambiadas(personaje.vidas)
	
func _on_personaje_vidas_cambiadas(vidas_actuales: int) -> void:
	marcador.text = "Vidas: " + str(vidas_actuales) + "/" + str(vidas_iniciales)
	if vidas_actuales <= 1: 
		marcador.add_theme_color_override("font_color", Color(1,0,0))
