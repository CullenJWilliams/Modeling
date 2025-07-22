include <BOSL2/std.scad>

$fn=360;

bumper_thickness = 2;
tab_thickness = 1;
tab_length = 50;
tab_width = 20;


plug_width = tab_width/2;
plug_length = tab_length;

hole_d = 8;
hole_r = hole_d/2;
hole_length = 17-hole_d;

difference()
{
	color("coral"){
		//translate([0,0,-tab_thickness]) tab(tab_length,tab_width,tab_thickness);
		plug(plug_length,plug_width,bumper_thickness);
		//translate([0,0,bumper_thickness]) tab(tab_length,tab_width,tab_thickness);
	}
	translate([tab_width/2,(tab_length-hole_length)/2,-4]) rotate([0,0,90]) hole(hole_r,hole_length);
}

module tab(length,width,thickness)
{
	linear_extrude(thickness)
		polygon( points=[[0,0],[0,length],[width,length-5],[width,5]]);

}

module plug(length,width,thickness)
{
	linear_extrude(thickness)
		polygon( points=[[0,0],[0,length],[width,length-10],[width,10]]);
}

module hole(radius,length)
{
	linear_extrude(10)
		hull()
		{
			circle(radius);
			translate([length,0,0]) circle(radius);
		}
}
