include <BOSL2/std.scad>
$fn=360;


amp_l= 89;
amp_w= 89;
amp_h= 89;

amp_frame();
color("teal") two_u_bracket();

module amp_frame()
{
translate([-15,0,0]) cuboid([2,89,22],anchor=FRONT+BOTTOM);
translate([-12,0,0]) prismoid(size1=[6,89], size2=[0,89], shift=[-3,0], h=8,anchor=FRONT+BOTTOM);

}

module two_u_bracket()
{

linear_extrude(2)
	difference(){
		rect([22,89],anchor=FRONT);
		translate([0,6,0]) color("teal") rect([13,7],rounding=3.5);
		translate([0,6+(76.2),0]) color("teal") rect([13,7],rounding=3.5);
	}
}


