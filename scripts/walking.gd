extends AnimatedSprite

var previousPosition = Vector2.ZERO

func _ready():
    previousPosition = global_position


func _process(_delta):
    var positionDelta = global_position - previousPosition

    if positionDelta.length() < 0.001:
        play('idle')
        return

    positionDelta = positionDelta.normalized()

    # get the vector's angle (in RADIANS!) and use it to set the correct animation
    var angle = positionDelta.angle() + 2*PI
    print(angle)

    # the + 0.1 is there to better handle "perfect" diagonal movement
    if angle < PI*5/4 + 0.05:
        play('run_left')
    elif angle < PI*7/4 + 0.05:
        play('run_up')
    elif angle < PI*9/4 + 0.05:
        play('run_right')
    elif angle < PI*11/4 + 0.05:
        play('run_down')
    else:
        play('run_left')

    # update the previous position
    previousPosition = global_position
