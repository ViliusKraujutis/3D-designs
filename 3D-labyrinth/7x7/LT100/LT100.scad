include <../../code/main.scad>

labyrinthLevels(level1, level2);
//labyrinthLevels(level2, level3);
//labyrinthLevels(level3, level4);
//labyrinthLevels(level4, level5);
//labyrinthLevels(level5, level6);
//labyrinthLevels(level6, level7);
//labyrinthLevels(level7, level8);
//labyrinthLevels(level8, level9);
//labyrinthLevels(level9, level10);
//labyrinthLevels(level10, level11);
//labyrinthLevels(level11, level12);
//labyrinthLevels(level12, level13);
//labyrinthLevels(level13, level14);
//labyrinthLevels(level14, level15);
//labyrinthLevels(level15, level16);
//labyrinthLevels(level16, level17);
//labyrinthLevels(level17, level18);
//labyrinthLevels(level18, level19);
//labyrinthLevels(level19, level20);
//labyrinthLevels(level20, level21);
//labyrinthLevels(level21, level22);
//labyrinthLevels(level22, level23);
//labyrinthLevels(level23, level24);
//labyrinthLevels(level24, level25);
//labyrinthLevels(level25, level26);
//labyrinthLevels(level26, level27);
//labyrinthLevels(level27, level28);
//labyrinthLevels(level28, level29);
//labyrinthLevels(level29, level30);
//labyrinthLevels(level30, level31);
//labyrinthLevels(level31, level32);
//labyrinthLevels(level32, level33);
//labyrinthLevels(level33, level34);
//labyrinthLevels(level34, level35);
//labyrinthLevels(level35, level36);
//labyrinthLevels(level36, level37);
//labyrinthLevels(level37, level38);
//labyrinthLevels(level38, level39);
//labyrinthLevels(level39, level40);
//labyrinthLevels(level40, level41);
//labyrinthLevels(level41, level42);
//labyrinthLevels(level42, level43);
//labyrinthLevels(level43, level44);
//labyrinthLevels(level44, level45);
//labyrinthLevels(level45, level46);
//labyrinthLevels(level46, level47);
//labyrinthLevels(level47, level48);
//labyrinthLevels(level48, level49);
//labyrinthLevels(level49, level50);
//labyrinthLevels(level50, level51);
//labyrinthLevels(level51, level52);
//labyrinthLevels(level52, level53);
//labyrinthLevels(level53, level54);
//labyrinthLevels(level54, level55);
//labyrinthLevels(level55, level56);
//labyrinthLevels(level56, level57);
//labyrinthLevels(level57, level58);
//labyrinthLevels(level58, level59);
//labyrinthLevels(level59, level60);
//labyrinthLevels(level60, level61);
//labyrinthLevels(level61, level62);
//labyrinthLevels(level62, level63);
//labyrinthLevels(level63, level64);
//labyrinthLevels(level64, level65);
//labyrinthLevels(level65, level66);
//labyrinthLevels(level66, level67);
//labyrinthLevels(level67, level68);
//labyrinthLevels(level68, level69);
//labyrinthLevels(level69, level70);
//labyrinthLevels(level70, level71);
//labyrinthLevels(level71, level72);
//labyrinthLevels(level72, level73);
//labyrinthLevels(level73, level74);
//labyrinthLevels(level74, level75);
//labyrinthLevels(level75, level76);
//labyrinthLevels(level76, level77);
//labyrinthLevels(level77, level78);
//labyrinthLevels(level78, level79);
//labyrinthLevels(level79, level80);
//labyrinthLevels(level80, level81);
//labyrinthLevels(level81, level82);
//labyrinthLevels(level82, level83);
//labyrinthLevels(level83, level84);
//labyrinthLevels(level84, level85);
//labyrinthLevels(level85, level86);
//labyrinthLevels(level86, level87);
//labyrinthLevels(level87, level88);
//labyrinthLevels(level88, level89);
//labyrinthLevels(level89, level90);
//labyrinthLevels(level90, level91);
//labyrinthLevels(level91, level92);
//labyrinthLevels(level92, level93);
//labyrinthLevels(level93, level94);
//labyrinthLevels(level94, level95);
//labyrinthLevels(level95, level96);
//labyrinthLevels(level96, level97);
//labyrinthLevels(level97, level98);
//labyrinthLevels(level98, level99);
//labyrinthLevels(level99, level100);
//labyrinth(level100);

//box([level1, level2, level3, level4, level5, level6]);

ballSize = 8; // mm

/*
First mazes starts with "#LT100" pattern.
It's a hashtag of Lithuania's celebration of it's 100th anniversarry of restored independence on 2018-02-16.
This 3D maze is dedicated to 100th anniversary of the restored State of @Lithuania 🇱🇹
*/

level1 = [
"┌─┬─┬─┬─┬─┬─┬─┐",
"| | | | | | | |",
"├─┴─┘ └─┘ └─┴─┤",
"|X            |",
"├─┬─┐ ┌─┐ ┌─┬─┤",
"| | | | | | | |",
"├─+─┤ ├─┤ ├─+─┤",
"| | | | | | | |",
"├─+─┤ ├─┤ ├─+─┤",
"| | | | | | | |",
"├─┴─┘ └─┘ └─┴─┤",
"|             |",
"├─┬─┐ ┌─┐ ┌─┬─┤",
"| | | | |O| | |",
"└─┴─┴─┴─┴─┴─┴─┘"];
level2 = [
"┌─┬───────────┐",
"| |           |",
"| |           |",
"|O|           |",
"| |           |",
"| |           |",
"| |           |",
"| |           |",
"| |           |",
"| |           |",
"| |           |",
"| |           |",
"| └───────────┤",
"|      X      |", 
"└─────────────┘"];
level3 = [
"┌─────────────┐",
"|    X        |",
"├─────┐ ┌─────┤",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     |O|     |",
"└─────┴─┴─────┘"];
level4 = [
"┌───┬───┬─────┐",
"|   |O  |     |",
"|   └─┐ |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"|     | |     |",
"| ┌───┘ └───┐ |",
"| |        X| |",
"└─┴─────────┴─┘"];
level5 = [
"┌─────────────┐",
"|             |",
"|   ┌─────┐   |",
"|   |     |   |",
"|  X|     |   |",
"|   |     |   |",
"|   |     |   |",
"|   |     |   |",
"|   |     |X  |",
"|   |     |   |",
"|   |     |   |",
"|   |     |   |",
"|   └─────┘   |",
"|          O  |",
"└─────────────┘"];
level6 = [
"┌─────────────┐",
"|             |",
"|   ┌─────┐   |",
"|   |     |   |",
"|   |     |   |",
"|   |     |   |",
"|   |     |   |",
"|   |     |   |",
"|  X|     |O  |",
"|   |     |   |",
"|   |     |   |",
"|   |     |   |",
"|   └─────┘   |",
"|             |",
"└─────────────┘"];
template3x3 = [
"┌───────┐",
"|X      |",
"| ┌─┬─┐ |",
"| | ╹ | |",
"| ├╸+╺┤ |",
"| | ╻ | |",
"| └─┴─┘ |",
"|      O|",
"└───────┘"];
level7 = [
"┌─────────────┐",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"└─────────────┘"];
level8 = [
"┌─────────────┐",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"└─────────────┘"];
level9 = [
"┌─────────────┐",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"└─────────────┘"];
level10 = [
"┌─────────────┐",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"└─────────────┘"];
level11 = [
"┌─────────────┐",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"└─────────────┘"];
levelTemplate = [
"┌─────────────┐",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"|             |",
"└─────────────┘"];
level100 = [
"┌─────────────┐",
"|             |",
"├───────────┐ |",
"|  ┌───╸  ╺─┤ |",
"|  └┐ ┌───╸ | |",
"|   | |X    | |",
"├─╸ └─┴─────┘ |",
"|             |",
"├───────────┐ |",
"|           | |",
"| ┌───────╸ | |",
"| |O        | |",
"| └─────────┘ |",
"|             |",
"└─────────────┘"];