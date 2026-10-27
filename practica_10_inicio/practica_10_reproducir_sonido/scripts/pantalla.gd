extends Control

@onready var reproductor: AudioStreamPlayer2D = $Boton/Reproductor
@onready var reproductor2: AudioStreamPlayer2D = $Boton2/Reproductor2

func _on_boton_pressed() -> void:
	reproductor.max_polyphony = 100
	reproductor.play()


func _on_boton_2_pressed() -> void:
	reproductor2.max_polyphony = 100
	reproductor2.play()
