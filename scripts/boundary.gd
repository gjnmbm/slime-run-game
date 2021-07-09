extends KinematicBody2D

signal hit
#Might be the reason for the mass deletion of tiles
var nullVel = Vector2(0,0)
#Works, but I am not certain if this will 
#stop the bugs with mass tile deletion
var forwardVel = Transform2D()

func _physics_process(delta):
	#Maybe don't use move_and_collide...?
	#var collision = move_and_collide(nullVel)
	var collision = test_move(forwardVel, nullVel)
	if collision:
		#print("hit")
		emit_signal("hit")
