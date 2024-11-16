extends Area2D
class_name Item

var isPlayerOn: bool = false;
var _price: int = 0;
var _name: String = ""

func _process(_delta):
	if isPlayerOn and Input.is_action_just_pressed("dig") and Globals.COIN_ORE_COUNT > _price:
		Globals.COIN_ORE_COUNT = Globals.COIN_ORE_COUNT - _price;
		match _name:
			'Dano+':
				Globals.DANO_NIVEL += 1
			'Velocidade+':
				Globals.VELOCIDADE_NIVEL += 1
			'Mineracao+':
				Globals.MINERACAO_NIVEL += 1
				
		queue_free()

func our_set_name(name: String):
	_name = name;
	$Name.text = name;

func our_set_price(price: int):
	_price = price
	$Price.text = str(price);

func _on_body_entered(body):
	if body is Player:
		isPlayerOn = true;
		$Name.modulate = Color.BROWN

func _on_body_exited(body):
	if body is Player:
		isPlayerOn = false;
		$Name.modulate = Color.WHITE
