$fn=90;

d1=110;
d2=102;
h=69;

nozzleD=0.4;
wallCount=4;
wallThickness=wallCount*nozzleD;

wallD1=d1+wallThickness*2;
wallD2=d2+wallThickness*2;

holder();

module holder() {
    difference() {
        cylinder(d1=wallD1, d2=wallD2, h=h);
        cylinder(d1=d1, d2=d2, h=h);
        translate([-wallD2,0,0]) cube([2*wallD2,2*wallD2,h*2]);
        rotate([90,30,0]) cylinder($fn=3,d=30,h=2*d2);
    }

    screwD=5;
    screwD2=screwD+nozzleD*2*8;
    screwH=13;
    translate([d1/2+screwD2/2,0,0]) screwHole(screwD,screwD2,screwH);
    translate([-d1/2-screwD2/2,0,0]) screwHole(screwD,screwD2,screwH);
}

module screwHole(d=5,dOutside=8,h=10) {
    difference() {
        cylinder(d=dOutside,h=h);
        cylinder(d=d,h=h);
    }
}


