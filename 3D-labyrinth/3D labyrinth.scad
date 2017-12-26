// DRAW LABYRINTH

// These module is defined below all other configuration details
//labyrinth(cube8x8level4);
labyrinthLevels(cube8x8level4, cube8x8level3);


// DRAWING SYMBOLS
WALL_VERTICAL = "|";
WALL_HORIZONTAL = "─";

CORNER_PLUS="+";

CORNER_TOP_LEFT="┌";
CORNER_TOP_RIGHT= "┐";
CORNER_BOTTOM_RIGHT="┘";
CORNER_BOTTOM_LEFT="└";

CORNER_T="┬";
CORNER_T_DOWN="┴";
CORNER_T_LEFT="├";
CORNER_T_RIGHT="┤";

SPACE = " ";
HOLE = "X";


// LEVEL DRAWING TEMPLATE

LEVEL0 = concat(
"┌─────┐",
"|     |",
"| ┌┬┐ |",
"| ├+┤ |",
"| └┴┘ |",
"|     |",
"└─────┘");


// LEVEL DRAWINGS

LEVEL1 = concat(
"┌─────┐",
"|     |",
"├───┐ |",
"|  X| |",
"| ──┘ |",
"|     |",
"└─────┘");

LEVEL2 = concat(
"┌─────┐",
"|    X|",
"| ┌───┤",
"| |O  |",
"| └── |",
"|     |",
"└─────┘");

cube8x8level1 = concat(
"┌───────────────┐",
"|O              |",
"├─────────────┐ |",
"|             | |",
"|  ┌──────  ──┤ |",
"|  |          | |",
"|  └┐ ┌────── | |",
"|   | |X      | |",
"├── └─┴───────┘ |",
"|               |",
"├─────────────┐ |",
"|             | |",
"| ┌────────── | |",
"| |           | |",
"| └───────────┘ |",
"|               |",
"└───────────────┘");
cube8x8level2 = concat(
"┌───────────────┐",
"|X              |",
"├─────────────┐ |",
"|             | |",
"|  ┌──────  ──┤ |",
"|  |          | |",
"|  └┐ ┌────── | |",
"|   | |O      | |",
"├── └─┴───────┘ |",
"|               |",
"├─────────────┐ |",
"|             | |",
"| ┌────────── | |",
"| |           | |",
"| └───────────┘ |",
"|               |",
"└───────────────┘");
cube8x8level3 = concat(
"┌───────────────┐",
"|O              |",
"├─────────────┐ |",
"|             | |",
"|  ┌──────  ──┤ |",
"|  |          | |",
"|  └┐ ┌────── | |",
"|   | |       | |",
"├── └─┴───────┘ |",
"|               |",
"├─────────────┐ |",
"|             | |",
"| ┌────────── | |",
"| |X          | |",
"| └───────────┘ |",
"|               |",
"└───────────────┘");
cube8x8level4 = concat(
"┌───────────────┐",
"|               |",
"├─────────────┐ |",
"|             | |",
"|  ┌──────  ──┤ |",
"|  |          | |",
"|  └┐ ┌────── | |",
"|   | |X      | |",
"├── └─┴───────┘ |",
"|               |",
"├─────────────┐ |",
"|             | |",
"| ┌────────── | |",
"| |O          | |",
"| └───────────┘ |",
"|               |",
"└───────────────┘");



// PARAMETERS
ballSize = 6;

levelOverlap = 2; // how much below level should go into the bottom plate
bpt = levelOverlap+1; // bottom plate thickness
wallThickness = 0.8; // wall thickness
wh = ballSize+bpt; // wall height


// VARIABLES
w = ballSize/2+wallThickness/2; // width of the cell


// HELPER METHODS
module labyrinthLevels(currentLevel, levelBelow) {
    difference() {
        labyrinth(currentLevel);
        translate([0,0,-wh+levelOverlap])
            labyrinth(levelBelow, wallThickness*1.5);
    }
}

module labyrinth(lab, wallThickness = wallThickness) {
    bottom(lab);
    walls(lab, wallThickness);
}

module bottom(lab) {
    sw=len(lab[0]);
    boardSize = sw*w;
    difference() {
        translate([-w/2,-w/2,0])
            cube([boardSize, boardSize, bpt]);
        holes(lab);
    }
}

module walls(lab, wallThickness=wallThickness) {
    sw=len(lab[0]);
    for(x=[0:sw-1]) {
        for(y=[0:sw-1]) {
            cell = lab[x][y];
            tx=sw-x-1; ty=sw-y-1;
            translate([tx*w, ty*w, 0]) {
                if (cell == WALL_VERTICAL) {
                    wallVertical(wallThickness);
                } else if (cell == WALL_HORIZONTAL) {
                    wallHorizontal(wallThickness);
                } else if (cell == CORNER_TOP_LEFT) {
                    cornerTopLeft(wallThickness);
                } else if (cell == CORNER_TOP_RIGHT) {
                    cornerTopRight(wallThickness);
                } else if (cell == CORNER_BOTTOM_RIGHT) {
                    cornerBottomRight(wallThickness);
                } else if (cell == CORNER_BOTTOM_LEFT) {
                    cornerBottomLeft(wallThickness);
                } else if (cell == CORNER_T) {
                    cornerT();
                } else if (cell == CORNER_T_RIGHT) {
                    cornerTRight(wallThickness);
                } else if (cell == CORNER_T_DOWN) {
                    cornerTDown(wallThickness);
                } else if (cell == CORNER_T_LEFT) {
                    cornerTLeft(wallThickness);
                } else if (cell == CORNER_PLUS) {
                    cornerPlus(wallThickness);
                }
            }
        }
    }
}

module holes(lab) {
    sw=len(lab[0]);
    for(x=[0:sw-1]) {
        for(y=[0:sw-1]) {
            cell = lab[x][y];
            if (cell == HOLE) {
                tx=sw-x-1; ty=sw-y-1;
                translate([tx*w, ty*w, 0]) {
                    hole();
                }
            }
        }
    }
}

module hole() {
    s=w+w-wallThickness;
    translate([-s/2,-s/2, -1])
        cube([s, s, bpt+2]);
}

module wallHorizontal(wallThickness) {
    rotate([0,0,90])
        wall(wallThickness);
}

module wallVertical(wallThickness) {
    wall(wallThickness);
}

module wall(wallThickness) {
    translate([-w/2,-wallThickness/2, 0])
        cube([w, wallThickness, wh]);
}

module cornerTopLeft(wallThickness) {
    rotate([0,0,180])
        corner(wallThickness);
}
module cornerTopRight(wallThickness) {
    rotate([0,0,90])
        corner(wallThickness);
}
module cornerBottomRight(wallThickness) {
    corner(wallThickness);
}
module cornerBottomLeft(wallThickness) {
    rotate([0,0,270])
        corner(wallThickness);
}

module corner(wallThickness) {
    translate([-wallThickness/2,-wallThickness/2,0])
        cube([wallThickness, w/2+wallThickness/2, wh]);
    translate([-wallThickness/2,-wallThickness/2, 0])
        cube([w/2+wallThickness/2, wallThickness, wh]);
}

module cornerPlus(wallThickness) {
    translate([-w/2,-wallThickness/2, 0])
        cube([w, wallThickness, wh]);    
    translate([-wallThickness/2,-w/2,0])
        cube([wallThickness, w, wh]);
}

module cornerT(wallThickness) {
    rotate([0,0,90]) {
        translate([-w/2,-wallThickness/2, 0])
            cube([w, wallThickness, wh]);    
        translate([-wallThickness/2,-wallThickness/2,0])
            cube([wallThickness, w/2+wallThickness/2, wh]);
    }
}

module cornerTRight(wallThickness) {
    rotate([0,0,270])
        cornerT(wallThickness);
}

module cornerTDown(wallThickness) {
    rotate([0,0,180])
        cornerT(wallThickness);
}

module cornerTLeft(wallThickness) {
    rotate([0,0,90])
        cornerT(wallThickness);
}