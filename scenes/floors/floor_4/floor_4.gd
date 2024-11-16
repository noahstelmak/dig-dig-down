extends Floor

const shopItems = [
	'Dano+',
	'Velocidade+',
	'Mineracao+',
]

func _ready():
	Globals.PLAYER_HEALTH = 5
	var items = $ItemSpawn.get_children();
	for i in range(3):
		var item = shopItems[randi_range(0, 2)]
		var random_value = randi_range(0, 10)
		
		var price = null;
		
		if random_value <= 1:
			price = 5
		elif random_value <= 6: 
			price = 10
		else:  
			price = 15
		
		items[i].our_set_price(price)
		items[i].our_set_name(item)


func _on_exit_exit_entered() -> void:
	next_floor.emit()
