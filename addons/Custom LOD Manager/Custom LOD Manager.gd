@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type(
		"Custom LOD Manager",
		"Node3D",
		preload("./lod_manager.gd"),
		Texture2D.new()
	)
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	remove_custom_type("Custom LOD Manager")
	# Clean-up of the plugin goes here.
	pass
