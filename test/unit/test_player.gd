extends 'res://addons/gut/test.gd'

var Player = load('res://scripts/player.gd')

func test_can_create_player():
	var player = Player.new()
	assert_not_null(player)

func test_get_set_speed():
	var player = Player.new()
	assert_accessors(player, 'speed', 300, 300)

func test_get_set_direction():
	var player = Player.new()
	assert_accessors(player, 'direction', Vector2(0, 0), Vector2(1, 1).normalized())

func test_player_moves_on_process():
	var player = Player.new()
	player.screen_size = Vector2(200,200)
	player.set_speed(100)
	Input.action_press("ui_right")
	Input.action_press("ui_down")
	simulate(player, 1, 1)
	assert_eq(player.get_position(), Vector2(100, 100))
