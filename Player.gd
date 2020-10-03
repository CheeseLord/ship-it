extends Area2D

signal hit


# Declare member variables here. Examples:
export var speed  = 600 # pixels/sec
export var radius_x = 64 / 2
export var radius_y = 64 / 2
var screen_size # size of game window


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#hide()


#func start(pos):
#	position = pos
#	show()
#	$CollisionShape2D.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Figure out velocity vector
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	# Update position
	position += velocity * delta
	position.x = clamp(position.x, radius_x, screen_size.x - radius_x)
	position.y = clamp(position.y, radius_y, screen_size.y - radius_y)


func _on_Player_body_entered(_body):
#	hide()
	emit_signal("hit")
#	$CollisionShape2D.set_deferred("disabled", true)
