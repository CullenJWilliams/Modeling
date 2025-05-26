include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=360;

difference(){
	color("green"){
		cap();
		shaft();
	}
	tube();
}

module cap()
{
	height = 8;
	top_di = 11.5;
	top_r = top_di/2;
	bottom_di = 14;
	bottom_r = bottom_di/2;

	difference(){
		cylinder(height,bottom_r,top_r);
		color("tomato")
			translate([0,0,-.2]) cylinder(height,bottom_r-.4,top_r-.4);
	}
	cylinder(1,bottom_r-.2,bottom_r-.2);
}

module flat_cap()
{
	height = 8;
	top_di = 11.5;
	top_r = top_di/2;
	bottom_di = 14;
	bottom_r = bottom_di/2;

	cylinder(1,bottom_r,bottom_r);

}

module  shaft()
{
	length = 20;
	threaded_length = 10;
	color("teal")
	{
		translate([0,0,1]) screw("M10x.75", length=threaded_length+1, anchor=TOP);
		translate([0,0,-18]) cylinder(10,8.8/2,8.8/2);
	}
}

module tube()
{
	translate([0,0,6]) cylinder(26,7.2/2,7.2/2, anchor=TOP);
}
