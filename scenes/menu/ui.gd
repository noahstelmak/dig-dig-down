extends Control
 
@onready var coinCounter = $CoinCounter;

func _process(_delta):
	coinCounter.text = str(Globals.COIN_ORE_COUNT)
