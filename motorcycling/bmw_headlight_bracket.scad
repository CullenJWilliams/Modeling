include <BOSL2/std.scad>


$fn=360;

hose_clamp_height=12.75+.5;
fork_diameter = 36;
fork_radius = fork_diameter/2;
headlight_bracket();
module left_headlight_bracket()
{
	difference()
	{
		mirror([0,1,0]) headlight_bracket();
		ignition_hole();
	}
}

module headlight_bracket(){
	//fork()
	//translate([150,0,40]) cuboid([40,15,15],anchor=RIGHT+FRONT);
	difference(){
		union(){
			translate([0,22,0]) clamp();
			hull(){
				cuboid([fork_diameter+10,5,95],anchor=BACK);
				translate([15,0,-50+2.5])rotate([0,-15,0]) cuboid([107.7,5,60],anchor=BOTTOM+LEFT+BACK);
			}
			translate([15,0,0])rotate([0,0,0]) cuboid([107.7,5,47.5],      anchor=BOTTOM+LEFT+BACK);
			translate([65,0,0])rotate([0,-30,0]) cuboid([100,5,35],        anchor=BOTTOM+LEFT+BACK);
			translate([119,0,-22+2.5])rotate([0,-60,0]) cuboid([110 ,5,40],anchor=BOTTOM+LEFT+BACK);
		}
		headlightahole();
		turnsignalhole();
		translate([175,0,76]) rotate([90,180,0]) fillet(l=20, r=20,spin=-30);
		translate([139,0,96]) rotate([90,180,0]) fillet(l=20, r=20,spin=60);
		translate([-23,-5,0]) rotate([0,0,0]) fillet(l=100, r=fork_radius+6,spin=0);
	}
}


module headlightahole()
{
	translate([110,0,0]) rotate([90,0,0]) cylinder(40,5,5,anchor=CENTER);
}

module ignition_hole()
{
	translate([110,0,0]) rotate([90,0,0]) cylinder(40,10,10,anchor=CENTER);
}

module turnsignalhole()
{
	hull()
	{
		translate([152,0,69]) rotate([90,0,0]) cylinder(40,5,5,anchor=CENTER);
		translate([132,0,79]) rotate([90,0,0]) cylinder(40,5,5,anchor=CENTER);
	}
}

module clamp()
{
	difference()
	{
		cuboid([fork_diameter+10,fork_radius+6,95],anchor=BACK);
		translate([0,0,20]) hose_clamp();
		translate([0,0,-20]) hose_clamp();
		fork();
	}
}
module hose_clamp()
{
	difference()
	{
		cylinder(hose_clamp_height,fork_radius+4,fork_radius+4);
		cylinder(hose_clamp_height,fork_radius+2,fork_radius+2);
	}
}

module fork()
{
	cylinder(300,fork_radius,fork_radius,anchor=CENTER);

}
