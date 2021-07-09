extends TileMap #Changed from TileMap to Node

#I don't know why, but sometimes the ground 
#deletes itself, which means that begxCellPos
#is increasing rapidly for some reason
#Why?
export var moveGround = true
var tileSet = tile_set
#var grassTileId = tileSet.find_tile_by_name("Grass.png 0")
#var dirtTileId = tileSet.find_tile_by_name("Dirt.png 1")
#var spikeTileId = tileSet.find_tile_by_name("Spike.png 2")
var screen_size
var endCellxPos = 49
var cellyPosDirt = 1
var cellyPosGrass = 0
#var bottomCellPosY
var begCellxPos = -5 #Change to -4 when I can see
#That cells are being deleted
#var begPos = position.x
#var spikeNum = 0
#var setSpikes = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#spikeNum = randi() % 3
	#print(grassTileId) Now works, tiles were named
	#Differently from how I thought they were
	#Apparently the IDs are 0, 1, and 2 respectively


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#This speed allows me to jump over 2 spikes
	if moveGround:
		position.x -= 6
		set_cell(endCellxPos,cellyPosGrass,0)
		set_cell(endCellxPos,cellyPosDirt, 1)
		#endCellxPos += 1
		set_cell(begCellxPos,cellyPosGrass,-1)
		set_cell(begCellxPos, cellyPosDirt, -1)
	#set_cell(begCellxPos, cellyPosSpike, -1)
	#When should obstacles be generated?
	#if spikeNum > 0:
		#This should add spikes when ground 
		#is generated
		#set_cell(endCellxPos, (cellyPosGrass - 1), 2)
		#spikeNum -= 1


func on_bound_hit():
	#print("hit") Changing boundary 
	#to a kinematic body works splendidly
	#when checking for collisions with tilemaps
	#Figure out when and how to add the obstacles
	#Making sure to add when player hits spikes
	#the game ends
	#Maybe set spikes as a seperate collision 
	#object
	begCellxPos += 1
	endCellxPos += 1
	set_cell(endCellxPos,cellyPosGrass,0)
	set_cell(endCellxPos,cellyPosDirt, 1)
	#if spikeNum > 0:
		#This should add spikes when ground 
		#is generated
		#set_cell(endCellxPos, cellyPosSpike, 2)
		#spikeNum -= 1
	endCellxPos += 1 #Helps regenerate tiles
	#At higher speeds
	#Figure out a way to add spikes
	#Only a certain number of times
	#Randomize when timer goes off...?
	#if spikeNum == 0:
		#spikeNum = randi() % 4
