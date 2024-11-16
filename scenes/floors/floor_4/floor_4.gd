extends Node2D

const shopItems = [
	'Dano+',
	'Velocidade+',
	'Mineracao+',
]

func _ready():
	var items = $ItemSpawn.get_children();
	for i in range(3):
		var item = shopItems[randi_range(0, 2)]
		var random_value = randi_range(0, 10)
		
		var price = null;
		
		if random_value <= 1:
			price = 1
		elif random_value <= 6: 
			price = 2
		else:  
			price = 3
		
		items[i].our_set_price(price)
		items[i].our_set_name(item)
