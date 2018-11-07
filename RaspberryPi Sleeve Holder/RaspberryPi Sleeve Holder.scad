// RaspberryPi Sleeve Holder

thickness=3;
thickness2=thickness*2;
width=10;

e=0.001;
e2=e*2;

sleeveW=62;
sleeveH=17.5;
ventilationSpace=10;

module rpiSleeveHolder() {
    difference() {
        union() {
            frame();
            translate([-screwBox,ventilationSpace,0]) screw();
            translate([sleeveW+thickness2,ventilationSpace,0]) screw();
        }
        translate([-25,sleeveH,0]) cube([50,2,50]);
    }
}
module frame() {
    difference() {
        cube([sleeveW+thickness2, sleeveH+thickness2, width]);
        translate([thickness, thickness, -e])cube([sleeveW, sleeveH, width+e2]);
    }
}

screwBox=10;
screwD=4;
module screw() {
    difference() {
        cube([screwBox, sleeveH+thickness2, screwBox]);
        translate([screwBox/2,-e,screwBox/2]) rotate([-90,0,0])
            cylinder($fn=60,d=screwD, h=sleeveH+thickness2+e2);
    }
}

rpiSleeveHolder();