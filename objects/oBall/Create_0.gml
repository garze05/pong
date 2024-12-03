// Create position (center of screen)
x = room_width/2
y = room_height/2

maxAngle = 5
spd = 5 // Initial speed
maxSpd = 12 // Ball's maximum move speed
ballSpdMultiplier = 1.05 // By how much ball should multiply it's speed

// Movement
// Ball will start to move as soon as it is created
hspeed = choose(-spd, spd) // Choose random between left and right
vspeed = random_range(-maxAngle, maxAngle) // Choose random within 45 degrees