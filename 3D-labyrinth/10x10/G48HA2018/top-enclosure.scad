include <Baltics100.scad>

topEnclosure();

screenW=39;
screenH=32;

spaceH=20;
topH=0.8;

switchH=13; // power Switch
switchW=21;

buttonD=12.5;
buttonH=10;

// calculations
    sw=len(lvl1[0]);
    boardSize=sw*w;
    borderW=w/2-wallThickness/2;
    insideSize=(sw-1)*w-2*(wallThickness);
    height=wh+spaceH+topH;
    space1=insideSize+2*wallThickness+1;

echo("Params:");
echo(boardSize);
echo(space1);

module topEnclosure() {
    topH=borderW+wallThickness+spaceH;
    screenBottom=boardSize/4-screenH/2;
    screenLeft=boardSize/2-screenW/2;
    
    difference() {
        cube([boardSize, boardSize, height]);
        
        translate([borderW,borderW,0]) 
            cube([space1, space1, wh]);
        translate([borderW+wallThickness,borderW+wallThickness,wh]) 
            cube([insideSize, insideSize, spaceH]);
        translate([screenLeft,screenBottom,topH])
            cube([screenW,screenH,topH]);
        translate([screenLeft-20,screenBottom+screenH,topH])
            cylinder(d=buttonD,h=topH);
        translate([screenLeft+screenW+20,screenBottom+screenH,topH])
            cylinder(d=buttonD,h=topH);
        translate([boardSize-10,boardSize-10-switchW,wh+3])
            cube([20,switchW,switchH]);
        translate([borderW+wallThickness+2*w,boardSize-borderW-wallThickness-2*w,topH])
            cube([2*w,2*w,topH]);
    }
}

