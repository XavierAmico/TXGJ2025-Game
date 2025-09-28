extends CharacterBody2D

@export var SPEED = 500
@onready var sprite = $Sprite2D
@onready var airHitbox = $AirHitBox
@onready var stuckHitbox = $StuckHitBox

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
var dir : Vector2
var spawnPos : Vector2
var spawnRot : float
var stuck := false
var arc : float


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = spawnRot
	arc = 0.4
	global_position = spawnPos
	velocity = dir * SPEED
	
	if dir.x < 0:
		scale.y = -1
		arc *= -1
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if stuck: 
		return
	
	velocity.y += GRAVITY/2 * delta
	rotation += arc * delta
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		_on_hit(collision)
	#move_and_slide()
func _on_hit(collision: KinematicCollision2D):
	var collider = collision.get_collider() # this checks if the collision was an enemy or if it was terrain
	if collider.is_in_group("Terrain"):
		stuck = true
		airHitbox.disabled = true
		stuckHitbox.disabled = false
		collision_layer = 1
		
		velocity = Vector2.ZERO
		#global_position = collision.get_position()
		#global_rotation = collision.get_normal().angle() + PI/2
	if collider.is_in_group("Enemy"):
		if collider.has_method("take_damage"):
			collider.take_damage(25)
		queue_free()
	
