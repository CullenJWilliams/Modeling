include <BOSL2/std.scad>
$fn=360;


twou=89;

length= 65;
width= 170+4;
height= 57+4;

thickness=2;
rail_height = (twou-height)/2;




render()
difference()
{
	render(){
		translate([0,0,0]) top_box(rail_height);
		translate([0,2*rail_height+height,0]) mirror([0,1,0]) top_box(rail_height);
		translate([0,rail_height,0]) usb_switch_box(length,width,height);
		translate([-width,0,0]) mirror([1,0,0]) two_u_bracket();
	}
	translate([-140,50,0]){
		cuboid([30+1,35+1,10],rounding=15,edges=[FRONT+LEFT,FRONT+RIGHT]);
		translate([0,16,0]) rotate([-90,0,0]) cylinder(10,3.5,3.5);
	}
	button();
}

module button()
{
	button_d = 11;
	button_r = button_d/2;
	right_offset = 23;
	front_offset = 30;

	translate([-104+right_offset-button_r,20,-button_r+front_offset]) {
		translate([0,25,-15]) cuboid([20,20,45],rounding=10,edges=[BACK+LEFT,BACK+RIGHT,BACK+TOP]);
		rotate([-90,0,0]) cylinder(20,button_r,button_r);
	}

}

module top_box(h)
{
	r=8;
	color("coral")
		difference(){
			cuboid([width,h,length],anchor=FRONT+RIGHT+BOTTOM);
			for(i=[2*r+2:2*(2*r+2):width-r])
			{
				p = i-(2*r+2);
				hull(){
					translate([-i-r-2,r+2,0]) cylinder(length,r,r);
					translate([-p-r-2,r+2,0]) cylinder(length,r,r);
				}
			}
		}
}

module usb_switch_box(length,width,height)
{
		difference()
		{
			color("coral"){
				difference(){
					cuboid([width,height,length],anchor=FRONT+RIGHT+BOTTOM);
					translate([-thickness,thickness,0]) cuboid([102,20,length],anchor=FRONT+RIGHT+BOTTOM);
				}
			}
		}
}

module two_u_bracket()
{
	translate([15,0,0]){
		translate([-12,0,0]) prismoid(size1=[6,89], size2=[0,89], shift=[-3,0], h=8,anchor=FRONT+BOTTOM);
		linear_extrude(2)
			difference(){
				rect([22,89],anchor=FRONT);
				translate([0,6,0]) color("teal") rect([13,7],rounding=3.5);
				translate([0,6+(76.2),0]) color("teal") rect([13,7],rounding=3.5);
			}
	}
}


