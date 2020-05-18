extends Sprite

# Selects a random goods sprite.

func _ready():
    var maxSprites = hframes

    if randi() % 100 < 40:
        frame = 0 # empty frame
        return

    frame = randi() % maxSprites
