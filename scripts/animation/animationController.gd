extends Node2D

# Controls an AnimationPlayer based on a state.
# The AnimationPlayer is assumed to be the parent.

# animation bindings
export(Resource) var bindings

# the state
export(NodePath) var stateNodePath

var previousState: int
var stateNode: AnimState
var player: AnimationPlayer

func _ready():
    assert(bindings is AnimationStateBindings)

    player = get_parent()
    assert(player is AnimationPlayer)

    stateNode = get_node(stateNodePath)
    assert(stateNode is AnimState)

    previousState = stateNode.state


func _process(_delta):
    if stateNode.state == previousState:
        return

    updateAnimation()


    # update the state
    previousState = stateNode.state


func updateAnimation():
    # find all available animations for the current state
    print(stateNode.state)
