@tool
extends Node3D
@export var meshes : Array[GeometryInstance3D] ## individual meshes, where 0 is the high poly
@export var lod_bias : float ## how far each load mesh disappears from camera, in meters

func _ready() -> void:
	for instance:int in range(meshes.size() -1, -1, -1):
		var current_mesh : GeometryInstance3D = meshes[instance]
		current_mesh.visibility_range_begin = 0
		current_mesh.visibility_range_begin_margin = 0
		current_mesh.visibility_range_end = 0
		current_mesh.visibility_range_end_margin = 0
		current_mesh.visibility_parent = ^""
		
		current_mesh.visibility_range_begin = instance * lod_bias
		if instance != meshes.size() -1:
			current_mesh.visibility_parent = meshes[instance+1].get_path()
		
