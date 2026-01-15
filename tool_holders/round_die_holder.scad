include <BOSL2/std.scad>

$fn=360;

height = 22/2;
diameter = 47+.5;
radius=diameter/2;
width = (diameter+1>29)?diameter+1:29;

render()
{
	difference(){
		//translate([0,0,-2]) cylinder(height+2,radius+1,radius+.5);
		translate([0,0,-2]) cube([width,diameter+1,height+1.9],anchor=CENTER+BOTTOM);
		cylinder(height,radius,radius,$fn=6);
	}
}
//translate([0,-radius,-2]) cube([width,13,2],anchor=CENTER+BACK+BOTTOM);
translate([0,-radius-.5,-2])rotate([90,0,0]) prismoid([width,height],[width,2],13,shift=[0,-(height-1.5-5)], anchor=BOTTOM+FRONT);
