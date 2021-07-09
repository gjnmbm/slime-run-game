extends KinematicBody2D

signal game_over
export var jumpSpeed = 200 
export var gravity = 9.8
export var game_running = false
var velocity = Vector2()
var screen_size
var is_jumping = false

func _ready():
	velocity.y = gravity

func _physics_process(delta): 
	#Jumping is not proportional to how long
	#the button was pressed for, but it works
	#how I want it to now.
	#Besides, I just didn't want the slime to fly
	#ANIMATIONS WORK
	#Slime no longer flies
	if game_running:
		var collision = move_and_collide(velocity * gravity)
		#Figure out how to detect spikes
		if collision:
			$AnimatedSprite.play("run")
			is_jumping = false
			if collision.collider.get_name() == "Spikes":
				emit_signal("game_over")
		if not collision:
			is_jumping = true
		#Sometimes the ground will still disapear
		#But this seems to happen very infrequently
		#This will mitigate the problem, but it is
		#Not a solution to it
		if position.y >= 320:
			emit_signal("game_over")

func _on_JumpTimer_timeout():
	$JumpTimer.stop()
	velocity.y = gravity

func _input(event):
	#Fixed
	if event.is_action_pressed("ui_up") and not is_jumping and game_running:
		$JumpTimer.start()
		$AnimatedSprite.play("jump")
		$JumpSound.play()
		velocity.y = -gravity

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed() and not is_jumping and game_running:
			$JumpTimer.start()
			$AnimatedSprite.play("jump")
			$JumpSound.play()
			velocity.y = -gravity
