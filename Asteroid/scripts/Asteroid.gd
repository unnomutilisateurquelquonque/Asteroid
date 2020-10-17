extends KinematicBody2D
signal separe

var vitesse = 100
var velocite = Vector2()


func creer(size,posx,posy,dir):
	print("oui")
	scale=Vector2(size,size)
	position.x = posx
	position.y = posy
	rotation = dir
	velocite = Vector2(vitesse,0).rotated(dir)
	

func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	if self.position.x < -10:
		self.position.x = get_viewport().size.x + 9
	elif self.position.x >= get_viewport().size.x + 10:
		self.position.x = -9
	
	if self.position.y < -10:
		self.position.y = get_viewport().size.y + 9
	elif self.position.y >= get_viewport().size.y + 10:
		self.position.y = -9
		




