include <BOSL2/std.scad>

base_diameter=16;
top_diameter=9;
height=5;
recess_diameter=8.01;
hole_diameter=4.2;

base_r = base_diameter/2;
top_r = top_diameter/2;
hole_r = hole_diameter/2;
recess_r = recess_diameter/2;

render()
difference(){
	cylinder(height,base_r,top_r,$fn=360);
	cylinder(height-2,hole_r,hole_r,$fn=360);
	translate([0,0,height-2]) cylinder(2,recess_r,recess_r,$fn=360);
}
