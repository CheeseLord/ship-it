extends Area2D


var speed = 10
var direction = Vector2(0, -1)
var damage = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += delta * speed * direction


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
