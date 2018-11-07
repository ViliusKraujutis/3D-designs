$fn=90;

gimbalHolder();

wall=2.4;
wall2=wall*2;
e=0.01;
e2=e*2;

gHD=46; // gimbalHolder diameter
gHL=86; // gimbalHolder length

hVD=35; // holderVertical diameter
hVL=25;

hFD=34; // holderForward diameter
hBD=30; // holderBar diameter

spaceBottom=5;

module gimbalHolder() {
    verticalPipe();
    fixationConnections();
    fixationHolders();
}
module verticalPipe() {
    pipe(gHD, gHL, wall);
    pipe(10, 5, 18+wall);
}

module fixationConnections() {
    difference(){
        hull() {
            intersection(){
                cylinder(d=75,h=30);
                verticalPipe();
            }                
            intersection(){
                cylinder(d=75,h=gHL);
                fixationHolderVertical();
            }
        }
        hull() verticalPipe();
        hull() fixationHolderVertical(false);
    }
    difference(){
        hull() {
            intersection(){
                translate([0,0,35]) cylinder(d=75,h=40);
                verticalPipe();
            }   
            intersection(){
                cylinder(d=65,h=gHL);
                fixationHolderForward();
            }
        }
        hull() verticalPipe();
        hull() fixationHolderForward(false);
    }
    difference(){
        hull() {
            intersection(){
                translate([0,0,50]) cylinder(d=75,h=50);
                verticalPipe();
            } 
            intersection(){
                cylinder(d=77,h=gHL);
                fixationHolderBar();
            }
        }
        hull() verticalPipe();
        hull() fixationHolderBar(false);
    }
}
module fixationHolders() {
    fixationHolderVertical();
    fixationHolderForward();
    fixationHolderBar();
}
module fixationHolderVertical(includeBoltHolders=true) {
    holderVertical(hVD, hVL,includeBoltHolders);
}
module fixationHolderForward() {
    holderForward(hFD, 38);
}
module fixationHolderBar() {
    holderBar(hBD, 37);
}

module pipe(diameter, length, wall) {
    difference() {
        cylinder(d=diameter+wall*2, h=length);
        translate([0,0,-e]) cylinder(d=diameter, h=length+e2);
    }
}

cubeX=10;
cubeY=10;
cubeZ=10;
module pipeSplit(diameter, length, wall,includeBoltHolders=true) {
    difference() {
        union() {
            cylinder(d=diameter+wall*2, h=length);
            if(includeBoltHolders) {
                translate([diameter/2+cubeX/2,0,cubeZ/2]) cubeBolt([cubeX, cubeY, cubeZ], true);
                translate([-diameter/2-cubeX/2,0,cubeZ/2]) cubeBolt([cubeX, cubeY, cubeZ], true);
                translate([diameter/2+cubeX/2,0,length-cubeZ/2]) cubeBolt([cubeX, cubeY, cubeZ], true);
                translate([-diameter/2-cubeX/2,0,length-cubeZ/2]) cubeBolt([cubeX, cubeY, cubeZ], true);
            }
        }
        translate([0,0,-e]) cylinder(d=diameter, h=length+e2);
        cube([length*3, 2,length*3],true);
    }
}
boltD=4;
module cubeBolt(size, center) {
    difference() {
        cube(size, center);
        rotate([90,0,0]) cylinder(d=boltD,h=100, center=true);
    }
    
}

spaceRight=2;
spaceFront=13;
module holderVertical(diameter, length,includeBoltHolders=true) {
    spaceX=gHD/2;
    spaceY=gHD/2+diameter/2+wall2+spaceRight;
    spaceZ=spaceBottom;
    
    translate([spaceX,spaceY,spaceZ])
        rotate([0,14,0])
            pipeSplit(diameter, length, wall,includeBoltHolders);
}

module holderForward(diameter, length,includeBoltHolders=true) {
    spaceX=10;
    spaceY=gHD/2+diameter/2+wall2+spaceRight;
    spaceZ=hVL*1.4+spaceBottom+diameter/2;
    
    translate([spaceX,spaceY,spaceZ])
        rotate([0,20-90,0])
            pipeSplit(diameter, length, wall);
}

module holderBar(diameter, length,includeBoltHolders=true) {
    spaceX=-gHD/2-diameter/2-12;
    spaceZ=hVL*1.4+spaceBottom+diameter+10;
    translate([spaceX,length/2,spaceZ])
        rotate([90,90,0])
            pipeSplit(diameter, length, wall);
}
