function input() {
	// Player 1
	global.up1 = keyboard_check(ord("W"))
	global.down1 = keyboard_check(ord("S"))

	// Player 2
	global.up2 = keyboard_check(vk_up)
	global.down2 = keyboard_check(vk_down)

	global.confirmKey = keyboard_check_pressed(vk_enter)
	global.cancelKey = keyboard_check_pressed(vk_escape)
	global.restartKey = keyboard_check_pressed(ord("R"))
    
    // Input
    //rollback_define_input({
        //up:     [global.up1, global.up2],
        //down: [global.down1, global.down2],
        //confirm: global.confirmKey,
        //cancel: global.cancelKey,
        //restart: global.restartKey
    //});
}