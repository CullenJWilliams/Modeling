include <../../BOSL2/std.scad>
$fn=5;

inch = 25.4;

thickness = 2.7;
side_width = 60.5;
side_length = 68.2;
segment_width = 11;
bezel_width = 5;

big_foot_width = 43.5; 
big_foot_length = 48.3; 
big_foot_height = 5.7; 

small_foot_length = 28; 
small_foot_width = 23.18; 
small_foot_height = 4.85; 

screw_hole_dia = 4.4;
screw_hole_r=screw_hole_dia/2;
screw_boss_dia = 8.86;
screw_boss_r=screw_boss_dia/2;

side1_y=sin(22.5)*segment_width;
side1_x=cos(22.5)*segment_width;

path = [
	[0,0],
	[side_length,0],
	[side_length+side1_x,side1_y],
	[side_length+side1_x+side1_y,side1_y+side1_x],
	[side_length+side1_x+side1_y,side_length+side1_x+side1_y]
];
stroke(path);
zpath = [
	[0,0],
	[0,side_width],
	[side1_y,side_width+side1_x],
	[side1_y+side1_x,side_width+side1_x+side1_y],
	[side1_y+side1_x+bezel_width,side_width+side1_x+side1_y],

	[side1_y+side1_x+bezel_width,thickness+side_width+side1_x+side1_y],
	[side1_y+side1_x-(thickness*tan(11.25)),thickness+side_width+side1_x+side1_y],
	[-2+side1_y,2+side_width+side1_x],
	[-thickness,(tan(11.25)*thickness)+side_width],
	[-thickness,thickness+0],
	[0,0]
];
total_length=side_length+side1_y+side1_x;

translate([side_length+side1_x+side1_y+small_foot_height+thickness,
		side1_x+side1_y+14+(small_foot_width/2),
		side_width/2])
rotate([0,-90,0])
	foot( small_foot_width, small_foot_length, small_foot_height);

translate([big_foot_length/2+16,
		-1*(big_foot_height+thickness),
		side_width/2])
rotate([-90,90,0])
	embossed_foot(
			big_foot_width,
			big_foot_length,
			big_foot_height
			);

profile();

module profile()
{
	difference()
	{
		path_sweep(zpath,path);

		translate([3/8*inch,-2,3/8*inch])
		rotate([90,0,0]) {
			translate([0,0,-20])cylinder(20,screw_hole_r,screw_hole_r,$fn=360);
			cylinder(20,screw_boss_r,screw_boss_r,$fn=360);
		}

		translate([9.5,-2,2*inch])
		rotate([90,0,0]) {
			translate([0,0,-20]) cylinder(20,screw_hole_r,screw_hole_r,$fn=360);
			cylinder(20,screw_boss_r,screw_boss_r,$fn=360);
		}

		translate([total_length+2,total_length-(3/8)*inch,2*inch])
		rotate([90,0,90]) {
			translate([0,0,-20]) cylinder(20,screw_hole_r,screw_hole_r,$fn=360);
			cylinder(20,screw_boss_r,screw_boss_r,$fn=360);
		}

		translate([total_length+2,total_length-(3/8)*inch,3/8*inch])
		rotate([90,0,90]) {
			translate([0,0,-20]) cylinder(20,screw_hole_r,screw_hole_r,$fn=360);
			cylinder(20,screw_boss_r,screw_boss_r,$fn=360);
		}

	}

		
}

/// a pyramid like foot
module foot(length,width,height)
{
	prismoid([length*.8,width*.8],[length,width],height);
}

/// foot with the center cut out
module embossed_foot(length,width,height)
{
	render()
		difference(){
			prismoid([length*.8,width*.8],[length,width],height);
			prismoid([length*.6,width*.6],[length*.4,width*.4],height);
		}
}
