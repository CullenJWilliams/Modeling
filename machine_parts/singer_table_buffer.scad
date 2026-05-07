include <BOSL2/std.scad>

$fn=360;

height = 3.5;
od = 11;
id = 1.5;

mid_h=3.5;
mid_id=20;

or=od/2;
ir=id/2;
mid_ir=mid_id/2;

render()
difference(){
	cylinder(height,or,or,anchor=CENTER);
	cylinder(height,ir,ir,anchor=CENTER);
	cylinder(height,3.5,3.5,anchor=CENTER+BOTTOM);
}

