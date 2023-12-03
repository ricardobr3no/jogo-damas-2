extends Node2D

func _ready() -> void:
	$BG.visible = true
	deixar_verdes_invisiveis()
	

func deixar_verdes_invisiveis():
	for node in $coordenates.get_children():
		node.visible = false

