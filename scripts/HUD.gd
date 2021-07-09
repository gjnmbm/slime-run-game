extends CanvasLayer

#Note: Cherry Blue Font is by Four Lines

signal start_game
export var score = 0
#export(Texture) var replayIcon
#signal restart_game

# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.visible = false

func _process(delta):
	#Process goes as long as the game is running
	$Score.text = "Score: " + str(score)

func game_over():
	$Button.visible = true
	$Button.text = "Replay"
	$Label.visible = true
	$Label.text = "Game Over"
	$Score.visible = false
	#$Button.set_button_icon(replayIcon) 
	#emit_signal("restart_game")

func start_game():
	score = 0
	$Button.hide()
	$Label.hide()
	$Score.visible = true
	$Score.text = "Score: " + str(score)
	emit_signal("start_game")
