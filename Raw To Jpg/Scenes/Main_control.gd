extends Control

var folder
@onready var label = $PanelContainer/Background/Panel2/Label

@onready var png=$PanelContainer/Background/PanelContainer/Png
@onready var jpg= $PanelContainer/Background/PanelContainer/Jpg
@onready var bmp= $PanelContainer/Background/PanelContainer/BMP


var DIR = OS.get_executable_path().get_base_dir()

#var script_path = ProjectSettings.globalize_path("res://Python-Files/RawToJpg/python_scripts/test.py")

#var path = ProjectSettings.globalize_path("res://Python-Files/RawToJpg/python_scripts/test.sh")

var output = []

var svg = "res://icon.svg"
#var result = OS.execute("python", [script_path])
#var interprteter = DIR.pluss_file("Python-Files/RawToJpg/Scripts/python.exe")
var script_path = DIR.path_join("Python-Files/RawToJpg/python_scripts/test.sh")
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	get_tree().get_root().borderless = true



func t():
	OS.execute("sh" ,["Python-Files/RawToJpg/python_scripts/test.sh"] )
	
	#var result = OS.execute("python", [script_path, "convert_cr3_to_image",folder,"png", "owo", "this should be a message"])
	#if result == OK:
	#	print("Script executed successfully!")
	#else:
	#	print("Script failed to execute.")
	#print(result)

func _ready():
	get_tree().get_root().files_dropped.connect(_on_files_dropped)
	#path = ProjectSettings.globalize_path("res://Python-Files/RawToJpg/python_scripts/")
	#var result = OS.execute("python", [script_path, "show_notification", "owo", "this should be a message"])
	t()
	
func _on_files_dropped(files):
	folder = files
	label.text = str(folder)
	print(folder)


func _on_close_button_down():
	get_tree().quit()


func _on_minemise_button_down():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MINIMIZED)


func _on_start_convert_button_down():
	print("convert")
	t()

func _on_bmp_toggled(button_pressed):
	jpg.toggled = false
	png.toggled = false


func _on_jpg_toggled(button_pressed):
	bmp.toggled = false
	png.toggled = false


func _on_png_toggled(button_pressed):
	jpg.toggle_mode = false
	bmp.toggle_mode = false
	
