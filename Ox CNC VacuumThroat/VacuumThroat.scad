
nozzleWidth=0.4;
wall=nozzleWidth*8;
wall2=wall*2;
e=0.001;
e2=e*2;

vacuumThroat();

module vacuumThroat() {
    vacuumPipe();
    blockHolder();
}

module vacuumPipe() {
    pipeD = 36; 
    pipeH = 50;
    cylinderThick(pipeD, pipeH, wall2*2);
}

module cylinderThick(diameter, height, wall) {
    difference() {
        cylinder(d=diameter+wall, h=height);
        translate([0,0,-e]) cylinder(d=diameter, h=height+e2);
    }
}

motorEdgeH=5+1; // how much does the motor extend below the holder
motorEdgeD=43+3;
motorEdgeFromFront=23-1;
motorEdgeFromBack=22-2;
motorEdgeFromSides=8-1;
motorSpiningAxis=17+5;
motorSpindelKnut=22+5;
motorSpindelKnutBottom=30+1;

aluminumBlockX=60+1;
aluminumBlockY=88;
aluminumBlockZ=21;
module aluminumBlock() {
    x=aluminumBlockX; // aluminum holder for the motor
    
    cube([aluminumBlockX,aluminumBlockY,aluminumBlockZ]);
}

module blockHolder() {
    w=wall;
    topHangY=10;
    difference() {
        cube([aluminumBlockX+w*2,aluminumBlockY+w,aluminumBlockZ+w*2]);
        translate([w,w+e,w]) aluminumBlock();
        translate([-e,topHangY+w,aluminumBlockZ+w-e]) cube([aluminumBlockX+w*2+e2,aluminumBlockY-topHangY+e,w+e2]);
        translate([aluminumBlockX/2+w,motorEdgeFromFront+motorEdgeD/2,w-motorEdgeH+e]) cylinder(h=motorEdgeH,d=motorEdgeD);
    }
}



vacuumeHoseD=36+2;

