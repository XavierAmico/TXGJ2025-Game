extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = $Player
	HUD.connect_to_player(player)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = $Player
	player.take_damage(3)
	pass
