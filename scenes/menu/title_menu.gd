extends Control


export(PackedScene) var sceneToLoad


func _on_Quit_Btn_pressed():
    get_tree().quit()


func _on_Start_Btn_pressed():
    $FadeOut.show()
    $FadeOut.fade_out()


func _on_FadeOut_fade_out_finished():
    get_tree().change_scene_to(sceneToLoad)
