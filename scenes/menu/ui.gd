extends Control
 
@onready var coinCounter = $CoinCounter;
@onready var healthContainer = $HealthContainer;

func _process(_delta):
	coinCounter.text = str(Globals.COIN_ORE_COUNT);
	
	for i in range(5):
		var child = healthContainer.get_child(i)
		child.visible = i < Globals.PLAYER_HEALTH
