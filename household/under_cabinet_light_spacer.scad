include <BOSL2/std.scad>

$fn=360;

od=72;
id=35;
hd=3;
or=od/2;
ir=id/2;
hr=hd/2;
h=8;

render()
difference(){
	cylinder(h,or,or);
		cylinder(h,ir,ir);
		translate([45/2,0,0]) cylinder(h,hr,hr);
		translate([-45/2,0,0]) cylinder(h,hr,hr);
}
