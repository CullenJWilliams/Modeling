include <BOSL2/std.scad>

$fn=360;

inch = 24.5;

handlebar_d = 1*inch;
handlebar_r = handlebar_d/2;

remote_h=40;
remote_w=20;
remote_l=30;
case_thickness=2;

bolt_d=2;
bolt_r=bolt_d/2;
bolt_head_d=4;
bolt_head_r=bolt_head_d/2;
nut_d=10;
nut_r=nut_d/2;
bolt_channel_width=10;

render()
difference()
{
	render()
	{
		difference()
		{
			cuboid([remote_w+case_thickness,remote_l+2*bolt_channel_width,remote_h+case_thickness],anchor=TOP+LEFT);
			cuboid([remote_w,remote_l,remote_h],anchor=TOP+LEFT);
			translate([remote_w/2,0,0]) cuboid([1,100,100]);
		}
		difference(){
			cuboid([remote_w+case_thickness+10,remote_l+2*bolt_channel_width,remote_h+case_thickness],anchor=TOP+RIGHT);
			translate([-handlebar_r-5,0,0])
			{
				cylinder(100,handlebar_r,handlebar_r,anchor=TOP);
				cuboid([1,100,100]);
			}
		}
	}

	translate([15,0,-20])
		rotate([0,90,0])
		for (i=[10,-10])
			for (j=[20,-20])
			{
				translate([i,j,0])
				{
					cylinder(100,bolt_r,bolt_r,anchor=CENTER+TOP);
					cylinder(10,bolt_head_r,bolt_head_r,anchor=CENTER+BOTTOM);
					translate([0,0,-40]) cylinder(10,nut_r,nut_r,anchor=CENTER+TOP,$fn=6);
				}
			}
}
