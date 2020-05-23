extends Resource
class_name AnimationStateBindings

# This simple resource allows to declaratively
# specify which animation states map to which
# animation names in AnimationPlayer.

# TODO: this cannot currently be AnimationStateBinding :'(
# https://github.com/godotengine/godot-proposals/issues/18
export(Array, Resource) var bindings
