extends Node2D
export (PackedScene) var menu
export (PackedScene) var gros
export (PackedScene) var moyen
export (PackedScene) var petit
var gamestarted = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = $player



# Called when the node enters the scene tree for the first time.
func _ready():
	var m = preload("res://scenes/menu.tscn").instance()
	add_child(m)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") && gamestarted == false:
		player.visible = true
		for i in range(10):
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var dir = rng.randf_range(0, 359)
			var posx = rng.randf_range(512, 1024)
			var posy = rng.randf_range(0, 400)
			var a = gros.instance()
			a.creer(2,posx,posy,dir)
			add_child(a)
		gamestarted = true

	

func separe(nom,pos,dir):
	if nom == "gros@":
		var m = preload("res://scenes/moyen.tscn").instance()
		print(pos.x,pos.y,dir)
		m.creer(1.2,pos.x,pos.y,dir)
		add_child(m)
	if nom == "moyen":
		var p = preload("res://scenes/petit.tscn").instance()
		p.creer(Vector2(0.8,1),position.x,position.y,-90+dir)
		add_child(p)
		p.creer(Vector2(0.8,1),position.x,position.y,90+dir)
		add_child(p)

