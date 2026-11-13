extends Timer


func esperar(tiempo_espera: float) -> void:
	wait_time = tiempo_espera
	one_shot = true
	start()
	await timeout
