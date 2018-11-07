// Spool bearings axel
$fn=60;

lenMax=115;
dMin=45;
hEdge=3;
dEdge=50;
dEdgeMax=60;
dAxis=10;
dBearings1=19.5;
dBearings2=25;
hBearings=20;


difference() {
    union() {
        cylinder($fn=13,d=dMin, h=lenMax);
        cylinder(d=dEdgeMax, h=hEdge);
        translate([0,0,lenMax-hEdge*2]) cylinder(d1=dMin, d2=dEdge, h=hEdge*2);
    }
    cylinder(d=dAxis, h=lenMax);
    cylinder(d1=dBearings2, d2=dBearings1, h=hBearings);
    translate([0,0,lenMax-hBearings]) cylinder(d1=dBearings1, d2=dBearings2, h=hBearings);
    
}