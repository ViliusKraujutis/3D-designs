$fn=60;
h=14;

module body() {
    difference() {
        union() {
            hull() {
                cylinder(d=15, h=h);
                translate([47,0,0]) cylinder(d=13, h=h); 
            }
            translate([0,0,-1]) cylinder(d=10,h=1);
            translate([0,0,-4]) cylinder(d=6.8,h=4);
        }
    
        translate([0,0,-4]) cylinder(d=5.3, h=h+4);
        translate([0,0,h-5]) cylinder($fn=6,d=9.2,h=5);
        
        translate([47,0,0]) cylinder(d=4.2, h=h); 
        translate([47,0,0]) cylinder($fn=6.2,d=8, h=5); 
        
        translate([18,0,0]) cylinder(d=4.2, h=h); 
        translate([18,0,0]) cylinder($fn=6.2,d=8, h=5); 
    }
}

body();