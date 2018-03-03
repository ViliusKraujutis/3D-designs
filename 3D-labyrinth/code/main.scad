include <enclosing-box.scad>;

// DRAWING SYMBOLS
WALL_VERTICAL = "|";
WALL_VERTICAL_TOP = "╹";
WALL_VERTICAL_BOTTOM = "╻";
WALL_HORIZONTAL = "─";
WALL_HORIZONTAL2 = "-";
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

// PARAMETERS
ballSize = 12;

levelOverlap = 2; // how much below level should go into the bottom plate
bpt = levelOverlap + 1.5; // bottom plate thickness
nozzleDiameter = 0.4;
layerHeight = 0.2;
wallThickness = nozzleDiameter*2; // wall thickness
wh = ballSize+levelOverlap; // wall height


// VARIABLES
w = ballSize/2+wallThickness/2; // width of the cell


// HELPER METHODS
module labyrinthLevels(currentLevel, levelBelow) {
    difference() {
        labyrinth(currentLevel);
        translate([0,0,-wh+levelOverlap-bpt])
            labyrinth(levelBelow, wallThickness+nozzleDiameter*2); // add extra two lines space for walls' overlap
    }
}

module labyrinth(lab, wallThickness = wallThickness) {
    wt2=wallThickness/2;
    sw=len(lab[0]);
    insideSize = (sw-1)*w-wallThickness;
    
    rotate([0,0,90]) {
        bottom(lab);
        difference() {
            walls(lab, wallThickness);
            // minus no overlap inside
            translate([wt2,wt2, wh+bpt-levelOverlap])
                cube([insideSize, insideSize, levelOverlap]);
        }
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
            translate([tx*w, ty*w, bpt]) {
                if (cell == WALL_VERTICAL) {
                    wallVertical(wallThickness);
                } else if (cell == WALL_VERTICAL_TOP) {
                    wallVerticalTop(wallThickness);
                } else if (cell == WALL_VERTICAL_BOTTOM) {
                    wallVerticalBottom(wallThickness);
                } else if (cell == WALL_HORIZONTAL || cell == WALL_HORIZONTAL2) {
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

module holes(lab, holeSymbol = HOLE, sizeScale=[1,1,1]) {
    sw=len(lab[0]);
    for(x=[0:sw-1]) {
        for(y=[0:sw-1]) {
            cell = lab[x][y];
            if (cell == holeSymbol) {
                tx=sw-x-1; ty=sw-y-1;
                translate([tx*w, ty*w, 0]) {
                    hole(sizeScale);
                }
            }
        }
    }
}

module hole(sizeScale=[1,1,1]) {
    s=w+w-wallThickness;
    translate([0,0, bpt/2-1])
       scale(sizeScale) cube([s, s, bpt+2], center = true);
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