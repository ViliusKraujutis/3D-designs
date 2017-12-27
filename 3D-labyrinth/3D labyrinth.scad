// DRAW LABYRINTH

// These module is defined below all other configuration details
labyrinth(template3x3);

labyrinthLevels(maze3x3level1, maze3x3level2);
labyrinthLevels(maze3x3level2, maze3x3level3);
labyrinth(maze3x3level3);
box([maze3x3level1,maze3x3level2,maze3x3level3]);

labyrinthLevels(maze8x8level1, maze8x8level2);
labyrinthLevels(maze8x8level2, maze8x8level3);
labyrinthLevels(maze8x8level3, maze8x8level4);
labyrinth(maze8x8level4);
!box([maze8x8level1,maze8x8level2,maze8x8level3,maze8x8level4]);


// DRAWING SYMBOLS
WALL_VERTICAL = "|";
WALL_VERTICAL_TOP = "╹";
WALL_VERTICAL_BOTTOM = "╻";
WALL_HORIZONTAL = "─";
WALL_HORIZONTAL_LEFT = "╸";
WALL_HORIZONTAL_RIGHT = "╺";

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
STARTING_POINT = "O";


// LEVEL DRAWING TEMPLATE

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


// LEVEL DRAWINGS

maze3x3level1 = [
"┌───┬─┐",
"|   |X|",
"| ╻ ╹ |",
"| |   |",
"| └───┤",
"|    O|",
"└─────┘"];

maze3x3level2 = [
"┌─┬───┐",
"|X|  O|",
"| | ╺─┤",
"| |   |",
"| └─╸ |",
"|     |",
"└─────┘"];

maze3x3level3 = [
"┌─────┐",
"|O    |",
"├───┐ |",
"|  X| |",
"| ╺─┘ |",
"|     |",
"└─────┘"];

maze8x8level1 = [
"┌───────────────┐",
"|               |",
"├─────────────┐ |",
"|             | |",
"|  ┌─────╸  ╺─┤ |",
"|  |          | |",
"|  └┐ ┌─────╸ | |",
"|   | |X      | |",
"├─╸ └─┴───────┘ |",
"|               |",
"├─────────────┐ |",
"|             | |",
"| ┌─────────╸ | |",
"| |O          | |",
"| └───────────┘ |",
"|               |",
"└───────────────┘"];
maze8x8level2 = [
"┌───────────────┐",
"|X              |",
"├─────────────┐ |",
"|             | |",
"|  ┌─────╸  ╺─┤ |",
"|  |          | |",
"|  └┐ ┌─────╸ | |",
"|   | |O      | |",
"├─╸ └─┴───────┘ |",
"|               |",
"├─────────────┐ |",
"|             | |",
"| ┌─────────╸ | |",
"| |           | |",
"| └───────────┘ |",
"|               |",
"└───────────────┘"];
maze8x8level3 = [
"┌───────────────┐",
"|O              |",
"├─────────────┐ |",
"|             | |",
"|  ┌─────╸  ╺─┤ |",
"|  |          | |",
"|  └┐ ┌─────╸ | |",
"|   | |       | |",
"├─╸ └─┴───────┘ |",
"|               |",
"├─────────────┐ |",
"|             | |",
"| ┌─────────╸ | |",
"| |X          | |",
"| └───────────┘ |",
"|               |",
"└───────────────┘"];
maze8x8level4 = [
"┌───────────────┐",
"|               |",
"├─────────────┐ |",
"|             | |",
"|  ┌─────╸  ╺─┤ |",
"|  |          | |",
"|  └┐ ┌─────╸ | |",
"|   | |X      | |",
"├─╸ └─┴───────┘ |",
"|               |",
"├─────────────┐ |",
"|             | |",
"| ┌─────────╸ | |",
"| |O          | |",
"| └───────────┘ |",
"|               |",
"└───────────────┘"];



// PARAMETERS
ballSize = 12;

levelOverlap = 2; // how much below level should go into the bottom plate
bpt = levelOverlap + 1; // bottom plate thickness
nozzleDiameter = 0.4;
layerHeight = 0.2;
wallThickness = nozzleDiameter*2; // wall thickness
wh = ballSize+bpt+levelOverlap; // wall height


// VARIABLES
w = ballSize/2+wallThickness/2; // width of the cell


// HELPER METHODS
module labyrinthLevels(currentLevel, levelBelow) {
    difference() {
        labyrinth(currentLevel);
        translate([0,0,-wh+levelOverlap])
            labyrinth(levelBelow, wallThickness+nozzleDiameter*2); // add extra two lines space for walls' overlap
    }
}

module labyrinth(lab, wallThickness = wallThickness) {
    bottom(lab);
    walls(lab, wallThickness);
}

module box(levels) {
    count = len(levels);
    l1 = levels[0];
    sw = len(l1);
    extraSpace = 3*nozzleDiameter;
    bt = nozzleDiameter*3; // box wall thickness
    
    b1Xs = sw*w + extraSpace; // box inside X size
    b1Ys = b1Xs;
    b1Zs = (wh-levelOverlap)*count+levelOverlap + extraSpace;
    
    
    echo("Box insides: ", b1Xs, b1Ys, b1Zs);
    rotate([180,0,0])
    difference() {
        translate([-bt, -bt, 0])
            cube([
                b1Xs+2*bt, 
                b1Ys+2*bt, 
                b1Zs+1*bt
            ]);
        cube([b1Xs, b1Ys, b1Zs]);

        
        // hole for ball entrance
        xy=extraSpace+w/2;
        translate([xy,xy,b1Zs+bt-2*layerHeight]) {
            holes(l1, STARTING_POINT);
        }

        
        translate([0,0,b1Zs+bt-2*layerHeight]) {
            // draw levels on box
            for(i = [1:count]) {
                marginX =     b1Ys/count   - extraSpace;
                marginY = (i*(b1Ys/count)) - extraSpace;
                translate([b1Xs-marginX, b1Ys-marginY, 0])
                levelContour(levels[i-1], count);
            }
        }
    }
    
    
}

module levelContour(level, count) {
    // scale down to fit all mazes into one row on top of the box
    scale(1/count) {
        // count is used in wallThickness multiplication here to compensate scale down factor
        // also, to make walls visible better, increasing adding additional multiplication factor
        walls(level, 2*count*wallThickness); 
    }
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
                } else if (cell == WALL_VERTICAL_TOP) {
                    wallVerticalTop(wallThickness);
                } else if (cell == WALL_VERTICAL_BOTTOM) {
                    wallVerticalBottom(wallThickness);
                } else if (cell == WALL_HORIZONTAL) {
                    wallHorizontal(wallThickness);
                } else if (cell == WALL_HORIZONTAL_LEFT) {
                    wallHorizontalLeft(wallThickness);
                } else if (cell == WALL_HORIZONTAL_RIGHT) {
                    wallHorizontalRight(wallThickness);
                } else if (cell == CORNER_TOP_LEFT) {
                    cornerTopLeft(wallThickness);
                } else if (cell == CORNER_TOP_RIGHT) {
                    cornerTopRight(wallThickness);
                } else if (cell == CORNER_BOTTOM_RIGHT) {
                    cornerBottomRight(wallThickness);
                } else if (cell == CORNER_BOTTOM_LEFT) {
                    cornerBottomLeft(wallThickness);
                } else if (cell == CORNER_T) {
                    cornerT(wallThickness);
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

module holes(lab, holeSymbol = HOLE) {
    sw=len(lab[0]);
    for(x=[0:sw-1]) {
        for(y=[0:sw-1]) {
            cell = lab[x][y];
            if (cell == holeSymbol) {
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
module wallVerticalTop(wallThickness) {
    wallHalf(wallThickness);
}
module wallVerticalBottom(wallThickness) {
    rotate([0,0,180])
        wallHalf(wallThickness);
}
module wallHorizontalLeft(wallThickness) {
    rotate([0,0,90])
        wallHalf(wallThickness);
}
module wallHorizontalRight(wallThickness) {
    rotate([0,0,270])
        wallHalf(wallThickness);
}

module wall(wallThickness) {
    translate([-w/2,-wallThickness/2, 0])
        cube([w, wallThickness, wh]);
}
module wallHalf(wallThickness) {
    translate([0,-wallThickness/2, 0])
        cube([w/2, wallThickness, wh]);
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