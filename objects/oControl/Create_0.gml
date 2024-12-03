// Input
upKey = 0
downKey = 0
confirmKey = 0
cancelKey = 0
restartKey = 0

keyCooldown = 15
keyTimer = 0

global.points = {
    Player1: 0,
    Player2: 0
};
global.menu = true // Are we in the menu
global.local = false // Are we playing against someone on the same keyboard
global.online = false // Are we playing in online mode

// Menu specific variables
menu_options = 
[
	"Play VS. Friend",
	"Play VS. A.I",
	"Play VS. Online Friend",
]
menuSize = array_length(menu_options)
optionSelected = 0

// count of the times we have pressed the reset button, lol
resetCount = 0

// Create the draw object after me (to make sure we dont encounter any unknown reference exceptions)
draw = instance_create_depth(x,y,depth, oDraw)

// Set my create variable references for oDraw
with (draw) 
{ 
	menu_options = other.menu_options; 
	menuSize = other.menuSize
}