include <BOSL2/std.scad>

$fn=360;
inch=25.4;

projection()
render()
difference(){
	cuboid([16*inch,23.25*inch,10]);
	cuboid([12.5*inch,38.5*inch,10]);
}

