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
                level = levels[i-1];
                marginX =     b1Ys/count   - extraSpace;
                marginY = (i*(b1Ys/count)) - extraSpace;
                translate([b1Xs-marginX, b1Ys-marginY, 0])
                levelContour(level, count);
            }
        }
    }   
}


module levelContour(level, count) {
    // scale down to fit all mazes into one row on top of the box
    scale(1/count) {
        // count is used in wallThickness multiplication here to compensate scale down factor
        // also, to make walls visible better, increasing adding additional multiplication factor
        walls(level, count*wallThickness); 
        holes(level, sizeScale=[0.8,0.8,2]);
    }
}
