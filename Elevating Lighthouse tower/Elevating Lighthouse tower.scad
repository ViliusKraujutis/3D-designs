$fn=120;

tower();

towerScale=0.78;
nozzleWidth=0.4;

//towerAngle=0.8;
h1=120 * towerScale;
gap=24 * towerScale;
h2=128 * towerScale;
h3=15 * towerScale;
h4=15 * towerScale;
h5=40 * towerScale;
h6=6 * towerScale;
h7=13 * towerScale;
h8=41 * towerScale;
h9=8 * towerScale;

d1=150 * towerScale;
d2=110 * towerScale;
d3=104 * towerScale;
d4=69 * towerScale;
d5=99 * towerScale;
d6=86 * towerScale;
d7=105 * towerScale;
d8=97 * towerScale;
d9=10 * towerScale;
d10=10 * towerScale;

module tower() {
    base();
    levCover();
    topTower();
    towerBottom();
    windows();
    cap();
}

module base() {
    difference() {
        baseCylinder();
        baseCylinderHole();
        levHole();
    }
    levHolder();
}

module baseCylinder() {
    cylinder(d1=d1,d2=d2,h=h1);
}

module baseCylinderHole() {
    cylinder(d1=d1-5,d2=d2-5,h=h1);
}

topTowerMagnetSpaceH = 11;
module topTower() {
    towerWalls();
    h=h1+gap+topTowerMagnetSpaceH;
    towerBottomHolder(h);
}

towerWallsThickness = nozzleWidth*4;
module towerWalls() {
    t=towerWallsThickness;
    translate([0,0,h1+gap]) {
        cylinderT(d1=d3,d2=d4,h=h2,thickness=t);    
    }
    translate([0,0,h1+gap+h2]) {
        cylinderT(d1=d4,d2=d5,h=h3,thickness=t);
    }
    translate([0,0,h1+gap+h2+h3]) {
        cylinderT(d1=d5,d2=d5,h=h4,thickness=t);
    }
    translate([0,0,h1+gap+h2+h3]) {
        cylinderT(d1=d5,d2=d5,h=h4,thickness=t);
        cylinderT(d1=d5,d2=d5,h=h4-windowsPlateH,thickness=t*2);
    }
}

module towerInsideVolume(t=towerWallsThickness) {
    t2=t*2;
    translate([0,0,h1+gap]) {
        cylinder(d1=d3-t2,d2=d4-t2,h=h2);    
    }
}


// almost copy of towerWalls
module towerVolume() {
    translate([0,0,h1+gap]) {
        cylinder(d1=d3,d2=d4,h=h2);
    }
    translate([0,0,h1+gap+h2]) {
        cylinder(d1=d4,d2=d5,h=h3);
    }
    translate([0,0,h1+gap+h2+h3]) {
        cylinder(d1=d5,d2=d5,h=h4);
    }
}

magHolesR=d3/2-15;
module towerBottomHolder(h) {
    intersection() {
        translate([0,0,h]) towerBottomHolders();
        towerVolume();
    }
}

module towerBottomHolders() {
    for(angle=levHoles) {
        x = sin(angle)*magHolesR;
        y = cos(angle)*magHolesR;
        translate([x,y,0]) rotate(90-angle)
            levHolderLeg();
    }
}

/**
    Bottom part of the top tower.

    It holds:
    • a magnet 
    • holes for screws
*/
module towerBottom() {
    difference() {
        intersection() {
            translate([0,0,h1+gap]){
                cylinder(d=d3,h=topTowerMagnetSpaceH);
            }
            towerInsideVolume(towerWallsThickness+0.5);
        }
        translate([0,0,h1+gap-1])
            towerBottomHolderHoles(h=topTowerMagnetSpaceH+2); 
        translate([0,0,h1+gap+1])
            towerBottomMagnet();
    }
}

magD1=25;
magH1=3.5;
magD2=35.5;
magH2=8;

module towerBottomMagnet() {
    cylinder(d=magD1, h=magH1);
    translate([0,0,magH1])
        cylinder(d=magD2, h=magH2);
}

module towerBottomHolderHoles(h) {
        for(angle=levHoles) {
            x = sin(angle)*magHolesR;
            y = cos(angle)*magHolesR;
            translate([x,y,0]) rotate(90-angle)
                screwHole(h=h,holeHeadD=7);
        }
}

/**
* Provided diameters are of the outside
*/
module cylinderT(d1,d2,h,thickness) {
    difference() {
        cylinder(d1=d1,d2=d2,h=h);
        cylinder(d1=d1-2*thickness, d2=d2-2*thickness, h=h);
    }
}

windowsPlateH=2;
module windows() {
    D=d6;
    H=h5;
    d=7;
    R=(D-d)/2;
    translate([0,0,h1+gap+h2+h3+h4]) 
        for(angle=[0:25:360]) {
            x = sin(angle)*R;
            y = cos(angle)*R;
            translate([x,y,0])
                cylinder(d1=d,d2=d,h=h5);
        }
}

module cap() {
    translate([0,0,h1+gap+h2+h3+h4+h5]) {
        cylinder(d1=d6,d2=d6,h=h6);
    }
    translate([0,0,h1+gap+h2+h3+h4+h5+h6]) {
        cylinder(d1=d7,d2=d8,h=h7);
    }
    translate([0,0,h1+gap+h2+h3+h4+h5+h6+h7]) {
        cylinder(d1=d8,d2=d9,h=h8);
    }
    translate([0,0,h1+gap+h2+h3+h4+h5+h6+h7+h8]) {
        cylinder(d1=d9,d2=d10,h=h9);
    }
}



//////////// mag-lev parts
levD=75+5;
levH=18;

levHoleD=3.5;
levHoleHeadD=6.5;
levHoleDD=10;
levHoles=[0:90:360];
levHolesR=(59+3)/2;
levHoleH=10;

levPlateH=1.6;
levCoverH=11.5;
levCoverThickness=2;

module levHole() {
    translate([0,0,h1-levH]) cylinder(d=levD,h=levH);
}

module levCover() {
    h=h1-levCoverH-levCoverThickness;
    
    intersection() {
        translate([0,0,h]) levCoverHolders();
        levHole();
    }
    translate([0,0,h1-levCoverThickness]) cylinder(d=levD,h=levCoverThickness);
}

module levHolder() {
    h=h1-levPlateH-levCoverH-levCoverThickness-levHoleH;

    intersection() {
        translate([0,0,h]) levHolders();
        baseCylinder();
    }
}

module levHolders() {
     for(angle=levHoles) {
            x = sin(angle)*levHolesR;
            y = cos(angle)*levHolesR;
            translate([x,y,0])
                rotate(90-angle)
                    levHolderLeg();
        }
}

module levCoverHolders() {
     for(angle=levHoles) {
            x = sin(angle+45)*levHolesR;
            y = cos(angle+45)*levHolesR;
            translate([x,y,0])
                difference() {
                    cylinder(d=levHoleDD, levCoverH);
                    cylinder(d=levHoleD-1, levCoverH);
                }
        }
}

module levHolderLeg() {
    difference() {
        union() {
            translate([0,-(levHoleH/2),0]) cube([20,levHoleH, levHoleH]);
            cylinder(d=levHoleDD, levHoleH);
        }
        screwHole();
    }
}

module screwHole(holeD=levHoleD, h=levHoleH, headH=2.5, holeHeadD=levHoleHeadD) {
    cylinder(d=holeD, h);
    cylinder(d=holeHeadD, headH, $fn=6);
    translate([0,0,h-headH]) 
        cylinder(d=holeHeadD, headH, $fn=6);
}