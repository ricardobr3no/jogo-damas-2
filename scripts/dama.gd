extends CharacterBody2D


var speed := 350.0

var is_selected := false
var can_move := false

var distance_axis = 0.95

func _ready() -> void:
	$Detector.process_mode = Node.PROCESS_MODE_DISABLED
	
	for axi in $Detector.get_children():
		axi.position *= distance_axis


func _physics_process(_delta: float) -> void:
	# detector and is_select
	if is_selected:
		$Detector.process_mode = Node.PROCESS_MODE_INHERIT
		$Detector.monitorable = true
	else:
		$Detector.process_mode = Node.PROCESS_MODE_DISABLED
		$Detector.monitorable = false
		
	# click-move
	if can_move:
		if Global.target_position != Vector2.ZERO:
			velocity = position.direction_to(Global.target_position) * speed
		if position.distance_to(Global.target_position) > 4:
			move_and_slide()
		else:
			can_move = false
			

func _input(event: InputEvent) -> void:
	# can move condicao
	if event.is_action_pressed("click") and is_selected:
		can_move = true
		is_selected = false


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# seleciona piece
	if event.is_action_pressed("click") and not is_selected:
		is_selected = true
		print(is_selected)


func _on_mouse_entered() -> void:
	# aumenta tamanho quando mouse fica emcima
	$sprite.scale *= 1.2

func _on_mouse_exited() -> void:
	# diminui tamanho quando mouse sai de cima
	$sprite.scale /= 1.2



