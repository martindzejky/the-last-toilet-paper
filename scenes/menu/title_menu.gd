extends Control


var scene_to_load


func _on_Quit_Btn_pressed():
    get_tree().quit()


func _on_Start_Btn_pressed():
    scene_to_load="res://scenes/main.tscn"
    $FadeOut.show()
    $FadeOut.fade_out()


func _on_FadeOut_fade_out_finished():
    get_tree().change_scene(scene_to_load)
