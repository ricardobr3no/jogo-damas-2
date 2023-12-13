extends Area2D

var valor := 1.2
var ocupado := false


func _on_mouse_entered() -> void:
	# aumenta tamanho quando mouse fica emcima
	$sprite.scale *= valor

func _on_mouse_exited() -> void:
	# diminui tamanho quando mouse sai de cima
	$sprite.scale /= valor

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# atualiza target_position qunado clica emcima
	if event.is_action_pressed("click") and not ocupado:
		Global.target_position = global_position
		ocupado = true


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("detect"):
		visible = true

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("detect"):
		visible = false


func _on_body_entered(_body: CharacterBody2D) -> void:
	ocupado = true
		
func _on_body_exited(_body: CharacterBody2D) -> void:
	ocupado = false
		
