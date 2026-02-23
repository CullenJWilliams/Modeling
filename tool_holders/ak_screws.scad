include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

length=154;
height=12;
thickness=1.5;
width=2*24+thickness;

#difference()
{
	translate([0,-18,-thickness/2])
		box(length,width,height,thickness);
	for(x=[+10,-10])
	{
		for(y=[+10,-10,+30,-30]){
			translate([x,y,0])
				three_eighths_screws();
		}
	}
	for(x=[+11,-11])
	{
		translate([x,+50,0])
			half_inch_screws();
	}
	translate([0,-55,0])
		big_press_screw();

	translate([0,-80,0])
		ring();
}

module three_eighths_screws(){
	translate([0,0,24]){
		cylinder(7.25,19/2,19/2,anchor=BOTTOM);
		cylinder(24,10/2,10/2,anchor=TOP);
	}
}

module half_inch_screws(){
	translate([0,0,63]){
		rotate([0,0,30]) cylinder(8,22/2,22/2,anchor=BOTTOM,$fn=6);
		cylinder(63,13/2,13/2,anchor=TOP);
	}
}

module big_press_screw(){
	translate([0,0,29]){
		rotate([0,0,00]) cylinder(13,32/2,32/2,anchor=BOTTOM,$fn=6);
		cylinder(29,19.5/2,19.5/2,anchor=TOP);
	}
}

module ring()
{
	difference()
	{
		cylinder(16,22/2,22/2);
		cylinder(16,15/2,15/2);
	}
}

module box(length,width,height,thickness)
{
	render()
		difference()
		{
			cuboid([width,length,height],anchor=BOTTOM+CENTER,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}

}
