include <Baltics100.scad>

ballSize = 10;

bottom = [
"┌───────────────────┐",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"|                   |",
"└ ╻                 |",
"  |                 |",
"  |                 |",
"  |                 |",
"  |                 |", 
"  └─────────────────┘"];

sw=len(bottom[0]);
boardSize = sw*w;

#labyrinth(bottom, wallThickness, false);
translate([-boardSize+w,0,0]) ring(21*w);