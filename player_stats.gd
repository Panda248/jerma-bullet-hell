extends Node

@export var lives : int = 3
@export var bombs : int = 3

func take_damage():
	lives-=1
