include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

height = 1*inch;
od = 1.5*inch;
id = 6;

mid_h=7;
mid_id=12;

or=od/2;
ir=id/2;
mid_ir=mid_id/2;

render()
difference(){
	cylinder(height,or-5,or,anchor=BOTTOM);
	cylinder(height,ir,ir,anchor=BOTTOM);
	cylinder(mid_h,mid_ir,mid_ir,anchor=BOTTOM);
}

