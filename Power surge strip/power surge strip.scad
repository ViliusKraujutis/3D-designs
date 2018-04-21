w=54; // width
h=40; // height
d1=3; // depth of the border
d2=12; // depth of whole strap
t=2; // thickness of the strap
t2=t*2; // double thickness

strap();

module strap() {
    difference() {
        strapOutside();
        strapInside();
    }
    border();
    screwHolders();
}

module strapOutside() {
    cube([w+t2,h+t,d2]);
}

module strapInside() {
    translate([t,t,0])
        cube([w,h,d2]);
}

module border() {
    cube([w+t2,d1+t,d1]);
}

sd=d2;
module screwHolders() {
    translate([0,h+t,0])
        screwHolder();
    translate([w+t2,h+t-sd,0])
        rotate([0,0,180])
            screwHolder();
}

module screwHolder() {
    translate([-sd/2,0,sd/2])
    rotate([90,0,0])
    difference() {
        hull() {
            cylinder(h=d2,d=sd);
            translate([sd/2,-sd/2,0]) cube([t,sd,d2]);
        }
        cylinder(h=d2,d=5);
    }
}