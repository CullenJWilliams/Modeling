include <BOSL2/std.scad>

$fn=360;


material_thickness= 4;
hole_size=7.75;
inner_hole_d = 6;

height = 13;
od = 25;

mid_h=3.5;
mid_id=20;

or=(1.75*hole_size)/2;
ir=inner_hole_d/2;
mid_ir=mid_id/2;

translate([20,0,0])
difference(){
	cylinder(4,or,or,anchor=BOTTOM);
	cylinder(4,ir,ir,anchor=BOTTOM);
}

render()
difference(){
	cylinder(material_thickness+4,or,or,anchor=BOTTOM);
	cylinder(material_thickness+4,ir,ir,anchor=BOTTOM);

	difference(){
		cylinder(material_thickness,or+1,or+1,anchor=BOTTOM);
		cylinder(material_thickness,hole_size/2,hole_size/2,anchor=BOTTOM);
	}
}

