// CityBirds Pigeon cup holder
// 2018-04-14
// Vilius Kraujutis

cupHolder();

$fn=220;
nt = 0.4; // nozzle thickness
wt = 5*nt; // wall thickness
wt2 = wt*2;

module cupHolder() {
    cup();
    horizontalHandleFixation();
    verticalPoleFixation();
}

handleD = 29; // horizontal wooden steering handle diameter
hookD = 45; // hook diameter
hookW = 30; // hook width
hookT = 3; // hook tightness - how strong is should the hook clip
module horizontalHandleFixation() {
    difference() {
        union() {
            connectionHHF();
            hookOutside();
        }
        hookInside();
    }
}

module hookOutside() {
    translate([cupD2/2+hookD/2,0,cupH-hookD/2+wt2])
        rotate([-90,0,0])
            cylinder(d=hookD, h=hookW);
}
module hookInside() {
    translate([cupD2/2+hookD/2,-e,cupH-hookD/2+wt2])
        rotate([-90,0,0])
            cylinder(d=handleD, h=hookW+e2);
}

// connection for horizontalHandleFixation module
module connectionHHF() {
    difference() {
        hull() {
            intersection() {
                translate([0,0,cupH-hookD+wt2])
                    cube([cupD2/2+hookD/2,hookW,hookD]);
                cup();
            }
            hookOutside();
        }
        cupInside();
    }
}




poleW1 = 20.3; // vertical steering pole width
poleD = 30.3; // vertical steering pole depth
poleH = 23;
poleT = wt2;
poleT2= poleT*2;
poleW2 = poleW1+poleT2;
poleShift=40;

module verticalPoleFixation() {
    difference() {
        union() { 
            vpfOutside(); 
            connectionVPF();
        }
        vpfInside();
        cupInside();
        vpfMagnets();
    }
}

module vpfOutside() {
    translate([cupD2/2+hookD/2,-poleShift-poleW2+poleT,0])
        cube([poleD,poleW2,poleH]);
}

module vpfInside() {
    translate([cupD2/2+hookD/2-e,-poleShift-poleW2+poleT2,-e])
        cube([poleD+e2,poleW1,poleH+e2]);
}

// connection for verticalPoleFixation
module connectionVPF() {
    difference() {
        hull() {
            // shape of a cup
            intersection() {
                cup();
                translate([0,-cupD2/2,0])
                    cube([cupD2/2, cupD2/2, poleH*2]);        
            }
            // outside connection cube
            translate([cupD2/2+hookD/2,-poleShift-poleW2+poleT,0]) 
                cube([poleD,poleW2,poleH]);        
        }
        translate([cupD2/2+hookD/2,0,cupH-hookD/2+wt2])
            rotate([90,0,0])
                cylinder(d=hookD+2, h=100);       
        translate([cupD2/2+hookD/2,-100,poleH]) 
            cube([poleD,100,poleH*2]);        
    }
}

module vpfMagnets() {
    hull() {
        vpfMagnet();
        translate([0,0,magD+2])
            vpfMagnet();
    }
}

magH=3;
magD=10.5;
module vpfMagnet() {
    translate([cupD2/2+hookD/2-magH+e,-poleShift-poleW2+poleT2+poleW1/2,magD/2])
        rotate([0,90,0])
            cylinder(d=magD, h=magH);
}

cupD1=75; // cup diameter bottom
cupD2=85; // cup diameter top
cupH=65; // cup height
cupTopExtension=40; // additional cup height above the hook
module cup() {
    difference() {
        cupOutside();
        cupInside();
    }
}
module cupOutside() {
    cylinder(d1=cupD1+wt2,d2=cupD2+wt2,h=cupH+wt2+cupTopExtension);
}

module cupInside() {
    translate([0,0,wt2+e]) 
        cylinder(d1=cupD1,d2=cupD2,h=cupH+cupTopExtension);
}

e = 0.001; // epsilon; required due to OpenSCAD's rendering bug when using Preview rendering (F5)
e2= e*2;