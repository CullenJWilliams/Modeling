include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=360;

shaft_h = 70.5;
shaft_d = 26;
shaft_thickness=3;

ball_d = 51.5;
screw_d = 6+1; // 1/4-20 diameter + tolerance
screw_l = 30;

nut_d = 12.4+.2; // point-to-point+tolerance

shaft_r = shaft_d/2;
ball_r = ball_d/2;
nut_r = nut_d/2;
screw_r = screw_d/2;

rotate([180,0,0]) translate([50,0,0]) ball_top();
color("yellow")
render()
	difference(){
		color("teal")
		{
			translate([0,0,shaft_h+(5*ball_r/6)]) ball_base();
			shaft();
		}
		shaft_negative();
	}


module ball_half()
{
	difference()
	{
		sphere(ball_r);
		cube([ball_d,ball_d,ball_d],anchor=CENTER+BOTTOM);
	}
}

module ball_base()
{
	render()
		difference()
		{
			ball_half();
			cylinder(200,screw_r,screw_r,anchor=CENTER);
			color("coral") cylinder(6,nut_r,nut_r,anchor=TOP,$fn=6);
		}
}

module ball_top()
{
	difference(){
		ball_half();
		screw_hole("1/4-20,.25",anchor=TOP,thread=true,bevel1="reverse");
	}
}

module shaft(){
	cylinder(shaft_h,shaft_r,shaft_r);
	detent_button(7.5/2,0);
}

module shaft_negative()
{
		difference(){
			translate([0,0,-shaft_r+13]) cylinder(shaft_h,shaft_r+5,shaft_r+5);
			shaft();
		}
		translate([0,0,-screw_l])
			cylinder(shaft_h,shaft_r-shaft_thickness,shaft_r-shaft_thickness);
		cylinder(200,screw_r,screw_r,anchor=CENTER);
		difference(){
			detent_button(7.5/2,1);
			detent_button(7.5/2,0);
		}
}

module detent_button(r,gap)
{
	translate([0,0,20]) rotate([0,90,0]) cylinder(shaft_r,r+gap,r+gap);
	translate([shaft_r,0,20]) rotate([0,90,0]) sphere(r+gap);

intersection(){
	translate([shaft_r,0,10]) cuboid([5+gap,4+gap,16],anchor=RIGHT);
	cylinder(shaft_h-(2*(shaft_r/3)),shaft_r,shaft_r);
	}
}
