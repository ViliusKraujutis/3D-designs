include <../../code/main.scad>

// These module is defined below all other configuration details
//labyrinth(template3x3);
//
//labyrinthLevels(maze3x3level1, maze3x3level2);
//labyrinthLevels(maze3x3level2, maze3x3level3);
//labyrinth(maze3x3level3);
//box([maze3x3level1,maze3x3level2,maze3x3level3]);

level1 = [
"┌───┬─┐",
"|   |X|",
"| ╻ ╹ |",
"| |   |",
"| └───┤",
"|    O|",
"└─────┘"];

level2 = [
"┌─┬───┐",
"|X|  O|",
"| | ╺─┤",
"| |   |",
"| └─╸ |",
"|     |",
"└─────┘"];

level3 = [
"┌─────┐",
"|O    |",
"├───┐ |",
"|  X| |",
"| ╺─┘ |",
"|     |",
"└─────┘"];
