include <BOSL2/std.scad>
$fn=360;

render()
difference(){
	render(){
		rotate([0,-90,0])
		{
			clip();
			shank();
		}
		difference()
		{
			antirotationtabs();
			rotate([0,-90,0])
			{
				translate([0,0,10]){
					cylinder(80,35.75/2,35.75/2,anchor=TOP);
				}
			}
		}
		translate([0,40,-20]) cylinder(25,20,20,anchor=TOP+LEFT);
		translate([0,-40,-20]) cylinder(25,20,20,anchor=TOP+LEFT);
	}

	translate([20,-40,30]) rotate([0,180,0]) scale(1.1) hull() import("./Hercules_vacuum_inflator.stl");
	translate([20,40,30]) rotate([0,180,0]) scale(1.1) hull() import("./Hercules_vacuum_narrow.stl");
}

module antirotationtabs()
{
	radius = 225;
	difference()
	{
		cuboid([100,134,40]);
		cylinder(40,radius,radius,anchor=RIGHT);
	}
}

module shank()
{
	difference()
	{
		cylinder(20,40/2,40/2,anchor=TOP);
		translate([0,0,-5]) cylinder(20,35.75/2,35.75/2,anchor=TOP);
		intersection(){
			translate([0,0,0]) cylinder(20,35.75/2,35.75/2,anchor=TOP);
			cuboid([21,36,20],anchor=TOP,rounding=2,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
		}
	}
}

module clip()
{
	radius=35.75/2;
	tab_radius=radius+1;
	clip_depth=16;
	tab_depth=3;
	tab_width=15;
	crevice_height=21;
	difference()
	{
		union()
		{
			cylinder(clip_depth,radius,radius);
			translate([0,0,clip_depth]) prismoid([tab_radius*2,tab_width],[radius*2-5,tab_width],tab_depth);
		}
		cuboid([crevice_height,radius*2,clip_depth+tab_depth],anchor=BOTTOM);
	}
}
