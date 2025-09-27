
extends TextureProgressBar

func connect_to_player(player):
	player.health_change.connect(update_health)

func update_health(new_health: int):
	value = new_health
