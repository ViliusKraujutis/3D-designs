include <Baltics100.scad>
$fn=30;

ballSize = 10;

sw=len(lvl10[0]);
boardSize = sw*w;

//labyrinth(lvl10);
translate([-boardSize+w,0,0]) ring(21*w);

wiringHoleW=21;
wiringHoleT=2.6;

tunnelThickness=6*nozzleDiameter;
tunnelW=wiringHoleW+tunnelThickness;
tunnelT=wiringHoleT+tunnelThickness;
tunnelH=ballSize+bpt;

translate([w/2,-w/2+boardSize/2-tunnelW/2,bpt]) 
    difference() {
        tunnel();
        wiringHole();
    }

module tunnel() {
    hull() {
        cube([tunnelT/2,tunnelW,tunnelH]);
        translate([tunnelT/2,tunnelT/5,0]) cylinder(R=tunnelT,h=tunnelH);
        translate([tunnelT/2,tunnelW-tunnelT/5,0]) cylinder(R=tunnelT,h=tunnelH);
    }
}

module wiringHole() {
    translate([0,tunnelThickness/2,0]) cube([wiringHoleT,wiringHoleW,tunnelH]);
}

