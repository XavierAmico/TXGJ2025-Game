extends Button

@onready var button = $Button
var firstScene = "game" # This is the Scene to be loaded on play 


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(_on_button_pressed)
	pass # Replace with function body.

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/" + firstScene + ".tscn")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#pass
