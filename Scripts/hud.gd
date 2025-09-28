extends CanvasLayer

@onready var health_bar: TextureProgressBar = $HealthBar

func connect_to_player(player):
	player.health_change.connect(update_health)
	

func update_health(new_health: int):
	health_bar.value = new_health
