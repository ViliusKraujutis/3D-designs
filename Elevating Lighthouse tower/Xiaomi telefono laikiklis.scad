// Xiaomi telefono laikiklis
$fn=90;
h1=12;
h2=10;
d1=22;
d2=25;
w = 40;

difference() {
    hull() {
        translate([h1+h2-d2/2+d1/2,0,0]) cylinder(d=d2, h=w);
        translate([8,0,0]) cylinder(d=d2, h=w);
    }
    cylinder(d=d1, h=w);
}

cx=3;
cy=20;
cz=5;

translate([h1+d1/2,-1*cy/2,-1*cz]) cube([cx,cy,cz]);
