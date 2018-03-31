$fn=60;

//Main Samsung Galaxy S6 and IDTECH card reader holder module 

phoneHolder();

module phoneHolder() {
    difference() {
        union() {
            phoneCase();
            readerCase();
            connection();
        }
        phoneShape();
        readerShape();
        emvSlot();
        magStripSlot();
        screenSlot();
    }
}

// Parts of the holder

phoneX=70.5;
phoneY=70;
phoneZ=7.3;
phoneTranslateX=-15.5;
phoneTranslateY=0;
phoneTranslateZ=-2.9;

module phoneShape() {
    translate([phoneTranslateX,phoneTranslateY,phoneTranslateZ])
        cube([phoneX,phoneY,phoneZ]);
}



auxD=4.4;
spaceY=3.5;

readerX=49.3;
readerY=40;
//readerY=63.9;
readerZ=14.7;
readerTranslateX=-26.1;
readerTranslateY=-readerY-spaceY;
readerTranslateZ=-9;
module readerShape() {
    rotate([90,0,0]) cylinder(d=auxD, h=spaceY);
    translate([readerTranslateX,readerTranslateY,readerTranslateZ])
        cube([readerX,readerY,readerZ]);
}



// case border thickness
border=1.4;
border2=border*2;
roundiness=2;

module phoneCase() {
    translate([phoneTranslateX-border,phoneTranslateY,phoneTranslateZ-border])
        rcube([phoneX+border2,phoneY,phoneZ+border2]);
}


module readerCase() {
    translate([readerTranslateX-border,readerTranslateY,readerTranslateZ-border])
        rcube([readerX+border2,readerY,readerZ+border2]);
}


module emvSlot() {
    x=60; y=57; z=4;
    translate([0,-y-2.2-spaceY,-4.4-z])
        cube([x,y,z]);
}
    
module magStripSlot() {
    translate([readerTranslateX-border,-44-spaceY-20,2.53])
        cube([readerX+border2,20,7]);//actually z=2.7
}

screenBorder=2.5;
screenBorder2=screenBorder*2;
module screenSlot() {
    translate([phoneTranslateX+screenBorder,screenBorder,phoneZ-border2-0.1])
        cube([phoneX-screenBorder2,phoneY-screenBorder,border]);
}


module connection() {
    hull() intersection() {
        union() {
            phoneCase();
            readerCase();
        }
        translate([-33,-20+border,-10])
            cube([100,20,20]);
    }
}



// Rounded cube

module rcube(size, radius=roundiness, rounded=true, center=false) {
	l = len( size );
	if( l == undef )
		_cubeX( size, size, size, radius, rounded, center );
	else
		_cubeX( size[0], size[1], size[2], radius, rounded, center );
}

module _cubeX( x, y, z, r, rounded, center ) {
	if( rounded )
		if( center )
			translate( [-x/2, -y/2, -z/2] )
			__cubeX( x, y, z, r );
		else
			__cubeX( x, y, z, r );
	else
		cube( [x, y, z], center );
}

module __cubeX(	x, y, z, r ) {
	//TODO: discount r.
	rC = r;
	hull()
	{
		translate( [rC, rC, rC] )
			sphere( r );
		translate( [rC, y-rC, rC] )
			sphere( r );
		translate( [rC, rC, z-rC] )
			sphere( r );
		translate( [rC, y-rC, z-rC] )
			sphere( r );

		translate( [x-rC, rC, rC] )
			sphere( r );
		translate( [x-rC, y-rC, rC] )
			sphere( r );
		translate( [x-rC, rC, z-rC] )
			sphere( r );
		translate( [x-rC, y-rC, z-rC] )
			sphere( r );
	}
}