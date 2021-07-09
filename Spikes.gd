extends TileMap


var spikeNum = 0
export var setSpikes = false
var cellyPosSpike = -1
var endCellxPos = 50 #Or viewport.x...?
var begCellxPos = -5
var screen_size

#Fixed...?
func _ready():
	screen_size = get_viewport().get_visible_rect()


func _process(delta):
	if setSpikes:
		position.x -= 6
		if spikeNum > 0:
			set_cell(endCellxPos, cellyPosSpike, 0)
			spikeNum -= 1

func _on_SpikeTimer_timeout():
	spikeNum = randi() % 4


func _on_boundary_hit():
	set_cell(begCellxPos, cellyPosSpike, -1)
	begCellxPos += 1
	endCellxPos += 1
