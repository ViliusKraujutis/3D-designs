$fn=90;

h=18;

h1=9;
h2=6;
h3=2;

d=29;

nozzleD=0.4;
wall=nozzleD*4;

cap(d, wall, h3, h);

module cap(d1, wallThickness, h1, h2) {
    difference() {
        cylinderAngled(d=d1,h=h1+h2, wall=wallThickness);
        translate([0,0,h1]) cylinder(d=d1,h=h2);
    }
    cylinder(d=d+h1*3+wallThickness*2,h=h1);
}

module cylinderAngled(d,h,wall){
    h1=h*0.6;
    h2=h-h1;
    cylinder(d=d+wall*2,h=h1);
    translate([0,0,h1]) cylinder(d=d+wall,h=h2);
}