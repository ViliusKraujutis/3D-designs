// Cylindrical washer for CityBirds' Pigeon Handle

$fn=90;

washer();

d1=26.8;
d2=29.5;
d3=34.5;
d4=28.7;


h2=45;
h3=15.5;
h4=9;
h=h2+h3+h4;

e=0.001;
e2=0.002;

module washer() {
    difference() {
        washerOutside();
        translate([0,0,-e]) 
            cylinder(d=d1, h=h+e2);
        cube([2,h,h]);
    }
}

module washerOutside() {
    cylinder(d=d2, h=h2);
    translate([0,0,h2]) cylinder(d=d3, h=h3);
    translate([0,0,h2+h3]) cylinder(d=d4, h=h4);
}