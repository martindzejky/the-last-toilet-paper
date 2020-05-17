extends AnimatedSprite

var previousPosition = Vector2.ZERO
var body

func _ready():
    body = get_parent()
    previousPosition = body.global_position


func _process(_delta):
    # are we running or pushing?
    var pushing = 'wasPushingLastFrame' in body and body.wasPushingLastFrame
    var animName = 'push' if pushing else 'run'

    var positionDelta = body.global_position - previousPosition

    if positionDelta.length() < 0.0001:
        playing = false
        return

    positionDelta = positionDelta.normalized()

    # get the vector's angle (in RADIANS!) and use it to set the correct animation
    var angle = positionDelta.angle() + 2*PI
    var animation

    # the + 0.1 is there to better handle "perfect" diagonal movement
    if angle < PI*5/4 + 0.05:
        animation = (animName+'_left')
    elif angle < PI*7/4 + 0.05:
        animation = (animName+'_up')
    elif angle < PI*9/4 + 0.05:
        animation = (animName+'_right')
    elif angle < PI*11/4 + 0.05:
        animation = (animName+'_down')
    else:
        animation = (animName+'_left')

    play(animation)

    # update the previous position
    previousPosition = body.global_position
