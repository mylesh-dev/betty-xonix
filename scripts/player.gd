extends Area2D

var screen_size = Vector2.ZERO;

export var _speed = 300
export var _direction = Vector2.ZERO

func get_speed():
	return _speed

func set_speed(speed):
	_speed = speed

func get_direction():
	return _direction

func set_direction(direction):
	if (direction.is_normalized()):
		_direction = direction
	else:
		_direction = direction.normalized()

func _process(delta):
	_direction = Vector2.ZERO;
	if Input.is_action_pressed('ui_right'):
		_direction.x += 1;
	if Input.is_action_pressed('ui_left'):
		_direction.x -= 1;
	if Input.is_action_pressed('ui_down'):
		_direction.y += 1;
	if Input.is_action_pressed('ui_up'):
		_direction.y -= 1;
	
	position += _direction * _speed * delta;
	position.x = clamp(position.x, 0, screen_size.x);
	position.y = clamp(position.y, 0, screen_size.y);

func _ready():
	screen_size = get_viewport_rect().size;
	print('screen_size: ', screen_size);
