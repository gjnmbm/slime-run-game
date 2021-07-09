extends Node

#Need to fix to make this resizeable
#And get it to work on both android, HTML, 
#and windows
func _ready():
	$Spikes.hide()
	$Player.hide()
	$Spikes.setSpikes = false
	#$GroundPos.position.x = get_viewport().get_visible_rect()
	#$Player/CollisionShape2D.disabled = true
	randomize()

#Main game now works, time to work on 
#ASTHETICS
func _on_Player_game_over():
	#get_tree().paused = true
	$Ground.moveGround = false
	$Spikes.setSpikes = false
	$Player/AnimatedSprite.stop()
	$Player.game_running = false
	#$GroundPos.position.x = $Ground.position.x
	#$Spikes.hide()


#At least game starts...?
func start_game():
	#Figure out how to get player and ground 
	#to spawn at Pos point (Works?)
	$Ground.moveGround = true 
	#This should be false when game ends
	#$Ground.position.x = $GroundPos.position.x
	$Spikes.clear() 
	$Spikes.position.x = $Ground.position.x
	$Spikes.visible = true
	$Spikes.setSpikes = true
	$Player.visible = true
	$Player.game_running = true
	$Player.position = $PlayerPos.position
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	$HUD.score += 1
