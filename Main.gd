extends Node2D



export (PackedScene) var Enemy
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemyTimer_timeout():
	var enemy = Enemy.instance()
	add_child(enemy)
	# TODO get width/height from enemy instead.
	var x = rand_range(32, screen_size.x - 32)
	var y = -32
	enemy.position = Vector2(x, y)
	enemy.linear_velocity = Vector2(0, 400)
