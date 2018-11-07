// Holder for action camera for Zhiyun Smooth Q

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
        screenLedCut();
        okButtonCut();
        upDownButtonCut();
        powerButtonCut();
        batteryCut();
        speakerCut();
    }
    lensHook();
    lensProtection();
    holderPlate();
}

cameraBodyX=60;
cameraBodyY=26;
cameraBodyZ=42;
cameraBody=[cameraBodyX+e,cameraBodyY,cameraBodyZ];
holderBody=[cameraBodyX+wallThickness,cameraBodyY+wallThickness2,cameraBodyZ+wallThickness2];

module cameraBody() {
    cube(cameraBody);
}

cameraLenseD=22;
cameraLenseR=cameraLenseD/2;
cameraLenseX=5+cameraLenseR;
cameraLenseZ=15+wallThickness+cameraLenseR;
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
    translate([7,-e,8])
        cube([42,wallThickness+e2,32]);
}

module screenLedCut() {
    translate([-e,-e,9])
        cube([3,wallThickness+e2,10]);
}

module okButtonCut() {
    translate([47, 13+wallThickness, cameraBodyZ+wallThickness-e])
        hull() {
            cylinder(d=13,wallThickness+e2);
            translate([-7.9,5.7,0]) cylinder(d=4,wallThickness+e2);
        }
}

module upDownButtonCut() {
    d=9;
    hull() {
        translate([cameraBodyX-e,8.3+wallThickness,30+wallThickness])
            rotate([0,90,0]) 
                cylinder(d=d,h=wallThickness+e2);
        translate([cameraBodyX-e,8.3+wallThickness,12+wallThickness])
            rotate([0,90,0]) 
                cylinder(d=d,h=wallThickness+e2);
    }
}

module powerButtonCut() {
    translate([47,cameraBodyY+wallThickness2+e,29+wallThickness])
    rotate([90,0,0])
        cylinder(d=15,h=wallThickness+e2);
}

module batteryCut() {
    translate([18,7.6+wallThickness,-e])
        cube([37,16,wallThickness+e2]);
}

module speakerCut() {
    translate([cameraBodyX-e,16+wallThickness,13+wallThickness])
        rotate([0,90,0]) 
            cylinder(d=5,h=wallThickness+e2);
}

module lensHook() {
    x=2;
    y=2;
    z=7;
    translate([-x,cameraBodyY+wallThickness-y,9.6])
        cube([x,y+wallThickness,z]);
}

module lensProtection() {
    h=7;
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
    x=60;
    y=6;
    z=65;
    translate([cameraBodyX+wallThickness-y/3,cameraBodyY+2*wallThickness-y,-z/2+cameraBodyZ/2+wallThickness])
        rotate([0,0,-10])
            cube([x,y,z]);
}

