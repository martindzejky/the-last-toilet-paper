extends Resource
class_name AnimationStateBinding

# This simple resource allows to declaratively
# specify which animation states map to which
# animation names in AnimationPlayer.

export(String) var name
export(int, 10) var priority = 0

# see the possible states in animState.gd
export(int, FLAGS, 'Left', 'Up', 'Right', 'Down', 'Move', 'Push', 'Search') var states = 0
