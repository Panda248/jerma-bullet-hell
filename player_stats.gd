extends Node

@export var max_lives : int = 3
@export var max_bombs : int = 3

var lives = max_lives
var bombs = max_bombs

func take_damage():
	lives-=1

func reset():
	lives = max_lives
	bombs = max_bombs
	
