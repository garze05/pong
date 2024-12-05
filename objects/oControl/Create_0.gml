randomise();
// Create players
    instance_create_depth(x,y,depth,oPlayer)
    instance_create_depth(x,y,depth,oPlayer)
    
// Menu specific variables
    menu_options = 
    [
        "Play VS. Friend",
        "Play VS. A.I",
    ]

// Key buffer
    keyCooldown = 15
    keyTimer = 0

    optionSelected = 0

// count of the times we have pressed the reset button, lol
    resetCount = 0

// Online support set-up
// This needs to be made before anything else
// Rollback system is only supported on OperaGX
onlineInitialized = false // Is online initialized
if (os_type == os_gxgames) { array_push(menu_options, "Play VS. Online Friend") } // Make the online option available
menuSize = array_length(menu_options)

// Create the draw object after me (to make sure we dont encounter any unknown reference exceptions)
    draw = instance_create_depth(x,y,depth, oDraw)

// Set my create variable references for oDraw
    with (draw) 
    { 
        menu_options = other.menu_options; 
        menuSize = other.menuSize
    }