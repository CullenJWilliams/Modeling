include <BOSL2/std.scad>

$fn=360;

height = 20;
diameter = 102;
radius=diameter/2;

render()
{
	difference(){
		//translate([0,0,-2]) cylinder(height+2,radius+1,radius+.5);
		translate([0,0,-2]) cube([diameter+1,diameter+.5,height+2],anchor=CENTER+BOTTOM);
		cylinder(height,radius,radius);
	}
}
