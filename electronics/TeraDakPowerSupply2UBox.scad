include <BOSL2/std.scad>
$fn=360;


twou=89;
length= 155;
width= 108+4;
height= 57+4;
thickness=2;

render(){
	amp_frame(length,width,height);
}

module top_box(h)
{
	r=8;
	color("coral")
	difference(){
		cuboid([width,h,length],anchor=FRONT+RIGHT+BOTTOM);
		for(i=[0:2*r+2:width-r])
		{
			translate([-i-r-2,r+2,0]) cylinder(length,r,r);
		}
	}
}

module amp_frame(length,width,height)
{
	foot_height=4;
	translate([-15,0,0]){
		translate([0,height+foot_height,0]) top_box(twou-height-foot_height);
		difference()
		{
			color("coral"){
				difference(){
					cuboid([width,height+foot_height,length],anchor=FRONT+RIGHT+BOTTOM);
					translate([-thickness,thickness+foot_height,0]) cuboid([width-2*thickness,height-2*thickness,length],anchor=FRONT+RIGHT+BOTTOM);
				}
			}
			translate([-4,thickness,0]) foot_slot(17,foot_height,length);
			translate([-91,thickness,0]) foot_slot(17,foot_height,length);
		}
	}
}

module foot_slot(l,w,h)
{
	cuboid([l,w,h],anchor=FRONT+RIGHT+BOTTOM);
}

module two_u_bracket()
{
	translate([-12,0,0]) prismoid(size1=[6,89], size2=[0,89], shift=[-3,0], h=8,anchor=FRONT+BOTTOM);
	linear_extrude(2)
		difference(){
			rect([22,89],anchor=FRONT);
			translate([0,6,0]) color("teal") rect([13,7],rounding=3.5);
			translate([0,6+(76.2),0]) color("teal") rect([13,7],rounding=3.5);
		}
}


