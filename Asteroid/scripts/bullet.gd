extends KinematicBody2D
export (PackedScene) var gros
export (PackedScene) var moyen
export (PackedScene) var petit

var vitesse = 1500
var velocite = Vector2()
var main = load("res://scripts/Main.gd").new()
var scorev = 0


func creer(pos,dir):
	position = pos
	rotation = dir
	velocite = Vector2(vitesse,0).rotated(dir)
	

func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	if collision:
		var score = get_tree().get_root().get_node("Main/score")
		scorev = scorev + 50
		score.text = "score : "+String(scorev)
		#var nom = collision.collider.name[1]+collision.collider.name[2]+collision.collider.name[3]+collision.collider.name[4]+collision.collider.name[5]
		#main.separe(nom,self.position,self.rotation)
		collision.collider.queue_free()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
