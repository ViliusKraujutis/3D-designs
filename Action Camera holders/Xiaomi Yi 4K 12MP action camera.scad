// Holder for Xiaomi Yi 4K action camera for Zhiyun Smooth Q

$fn=90;

nozzleD=0.4;
wallCount=4;
wallThickness=wallCount*nozzleD;
wallThickness2=wallThickness*2;
e=0.1; // epsilon
e2=e*2;

cameraHolder();

module cameraHolder() {
    difference() {
        cube(holderBody);
        translate([-e,wallThickness,wallThickness])
            cameraBody();
        cameraLenseCut();
        screenCut();
        okButtonCut();
        powerButtonCut();
    }
    hook();
    lensProtection();
    holderPlate();
}

cameraBodyX=65;
cameraBodyY=22;
cameraBodyZ=43;
cameraBody=[cameraBodyX+e,cameraBodyY,cameraBodyZ];
holderBody=[cameraBodyX+wallThickness,cameraBodyY+wallThickness2,cameraBodyZ+wallThickness2];

module cameraBody() {
    cube(cameraBody);
}

cameraLenseD=24+1;
cameraLenseR=cameraLenseD/2;
cameraLenseX=3+cameraLenseR;
cameraLenseZ=9.5+wallThickness+cameraLenseR;
cameraLenseY=wallThickness2+cameraBodyY+e;

module cameraLense() {
    translate([cameraLenseX,cameraLenseY+30,cameraLenseZ])
        rotate([90,0,0])
            cylinder(d=cameraLenseD,h=wallThickness2+30);
}

module cameraLenseCut() {
    hull() {
        cameraLense();
        translate([-100,0,0]) cameraLense();
    }
}

module screenCut() {
    translate([4,-e,6])
        cube([53,wallThickness+e2,33]);
}

module okButtonCut() {
    hull() {
        translate([10, 10+wallThickness, cameraBodyZ+wallThickness-e])
            cylinder(d=13,wallThickness+e2);
        translate([56, 10+wallThickness, cameraBodyZ+wallThickness-e])
            cylinder(d=13,wallThickness+e2);
    }
}

module powerButtonCut() {
    translate([54,cameraBodyY+wallThickness2+e,21+wallThickness])
    rotate([90,0,0])
        cylinder(d=7,h=wallThickness+e2);
}

module hook() {
    x=2;
    y=1.5;
    z=17;
    translate([-x,0,cameraBodyZ/2-z/2+wallThickness])
        cube([x,y+wallThickness,z]);
}

module lensProtection() {
    h=10;
    d=28;
    difference() {
        hull() {
            translate([cameraLenseX,cameraLenseY+h-2*e,cameraLenseZ])
                rotate([90,0,0])
                    cylinder(d=d,h=h);
            translate([-100,cameraLenseY+h,cameraLenseZ])
                rotate([90,0,0])
                    cylinder(d=d,h=h);            
        }
        cameraLenseCut();
        translate([-200,0,0]) cube([200,200,200]);
    }
}

module holderPlate() {
    x=45;
    y=6;
    z=65;
    difference() {
        translate([cameraBodyX+wallThickness-y/3,wallThickness-0.9,0])
            rotate([0,0,-20])
                cube([x,y,z]);
        cube([cameraBodyX+wallThickness,cameraBodyY,cameraBodyZ*2]);
    }
}

