extends KinematicBody2D

var vitesse = 200
var velocite = Vector2()
var canon1 = true
export (PackedScene) var bullet
var life = 3
onready var canon = $canon
onready var canon2 = $canon2

func _ready():
	pass


func _physics_process(delta):
	var vie = get_tree().get_root().get_node("Main/vie")
	vie.text = "lives : "+String(life)
	var collide = move_and_collide(velocite*delta)
	get_input()
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		velocite = move_and_slide(velocite)
	if self.position.x < -10:
		self.position.x = get_viewport().size.x + 9
	elif self.position.x >= get_viewport().size.x + 10:
		self.position.x = -9
	
	if self.position.y < -10:
		self.position.y = get_viewport().size.y + 9
	elif self.position.y >= get_viewport().size.y + 10:
		self.position.y = -9
	
	if collide:
		if(life>0):
			life=life-1
			self.position.x = 500
			self.position.y = 500
		else:
			queue_free()
			var m = preload("res://scenes/gameover.tscn").instance()
			get_parent().add_child(m)
		




func get_input():
	var avance = Input.is_action_pressed("forward")
	var shoot = Input.is_action_just_pressed("left_click")
	
	if avance:
		velocite = Vector2(vitesse, 0).rotated(rotation)
	if shoot:
		if canon1 == true:
			var b = bullet.instance()
			b.creer(canon.global_position, rotation)
			get_parent().add_child(b)
			canon1 = false
		else:
			var b = bullet.instance()
			b.creer(canon2.global_position, rotation)
			get_parent().add_child(b)
			canon1 = true
