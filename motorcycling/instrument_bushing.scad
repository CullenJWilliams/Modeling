include <BOSL2/std.scad>

$fn=360;

height = 13;
od = 25;
id = 12;

mid_h=3.5;
mid_id=20;

or=od/2;
ir=id/2;
mid_ir=mid_id/2;

render()
difference(){
	cylinder(height,or,or,anchor=CENTER);
	cylinder(height,ir,ir,anchor=CENTER);

	difference(){
		cylinder(mid_h,or+1,or+1,anchor=CENTER);
		cylinder(mid_h,mid_ir,mid_ir,anchor=CENTER);
	}
}

