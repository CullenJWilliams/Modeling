include <BOSL2/std.scad>
$fn=360;

inch = 25.4;


thickness=1/8*inch;
length = 131.4;
front_radius=13/2;

hammer_pin_hole_x = (2.54*inch)-front_radius-(((1/8)*inch)/2)-.1;
hammer_pin_hole_y = 7/32*inch;
hammer_pin_hole_xm = 64-(7.8);
hammer_pin_hole_ym = 5;

plate_clamping_screw_x = hammer_pin_hole_xm+(1+7/16)*inch-(1/32*inch);
plate_clamping_screw_y =11/16*inch;

plate_clamping_screw_xm = hammer_pin_hole_xm+36;
plate_clamping_screw_ym =17;

sear_pivot_xm = hammer_pin_hole_xm+28;
sear_pivot_ym = 17+5;
sear_pivot_x = hammer_pin_hole_xm+((1+1/8)*inch);
sear_pivot_y = 7/8*inch;

sear_stop_xm = hammer_pin_hole_xm+43;
sear_stop_ym = 3.5;
sear_stop_x = (5/16-1/64)*inch+plate_clamping_screw_x;
sear_stop_y = 1/8*inch;


sear_spring_axis_xm = hammer_pin_hole_xm+57;
sear_spring_axis_ym = 11.5;
sear_spring_axis_x = (2+1/4+1/64)*inch+hammer_pin_hole_xm;
sear_spring_axis_y = (.5-1/64)*inch;

tolerance = (.0078*inch);

hammer_pin_hole_r =(1/8*inch+tolerance)/2;
plate_clamping_screw_hole_r = ((11/64*inch)+tolerance)/2;
sear_pivot_hole_r = ((7/64*inch)+tolerance)/2;
sear_stop_hole_r = (((5/64)*inch)+tolerance)/2;
sear_spring_axis_hole_r = ((7/64*inch)+tolerance)/2;

side_plate();

module side_plate()
{
	difference(){
		blank();
		translate([-hammer_pin_hole_xm,hammer_pin_hole_y,0]) cylinder(20,hammer_pin_hole_r,hammer_pin_hole_r);
		translate([-plate_clamping_screw_x,plate_clamping_screw_y,0]) cylinder(20,plate_clamping_screw_hole_r,plate_clamping_screw_hole_r);
		translate([-sear_pivot_x,sear_pivot_y,0]) cylinder(20,sear_pivot_hole_r,sear_pivot_hole_r);
		translate([-sear_stop_x,sear_stop_y,0]) cylinder(20,sear_stop_hole_r,sear_stop_hole_r);
		translate([-sear_spring_axis_x,sear_spring_axis_y,0]) cylinder(20,sear_spring_axis_hole_r,sear_spring_axis_hole_r);
	}
}

module blank(){
	color("teal") translate([3,(13/2)-5,0]) cylinder(thickness/2,5,5,anchor=FRONT+BOTTOM);
	render()
		difference()
		{
			hull()
				color("teal")
				{
					cylinder(thickness,13/2,13/2,anchor=FRONT+BOTTOM);
					translate([-70.2,30.8-14,0]) cylinder(thickness,7,7,anchor=FRONT+BOTTOM);
					translate([-length+(.3*inch)+.55-1.1,25/2-.7+.3,0]) rotate([0,0,8]) scale([3.5,1,1]) cylinder(thickness,24/2,24/2,anchor=LEFT+BOTTOM);
					//translate([-length+(.3*inch)+.55-1,25/2-.7,0]) rotate([0,0,7])scale([4,1,1]) cylinder(thickness,25/2,25/2,anchor=LEFT+BOTTOM);
					translate([-length+(.3*inch)-1,(25/2)-2,0]) scale([1,1,1]) cylinder(thickness,7,7,anchor=LEFT+BOTTOM);
					translate([-length+(.3*inch)+1.3-1,25/2-5.3,0]) rotate([0,0,0])scale([4,1,1]) cylinder(thickness,7,7,anchor=LEFT+BOTTOM);
				}
			color("coral")
			{
				translate([2,13,0]) cuboid([45+2,50,thickness],anchor=RIGHT+BOTTOM+FRONT);
				translate([-44.5,13.1,0]) cylinder(thickness,12/16*inch,12/16*inch,anchor=FRONT+BOTTOM);
				translate([-44.5,13,0]) cylinder(thickness,12/16*inch,12/16*inch,anchor=FRONT+BOTTOM);
				translate([-68.6,37.8-12.6,0])
					top_radius();
			}
		}
}
//translate([0,-20,0]) top_radius();

module top_radius()
{
	difference(){
		cuboid([20,20,thickness],anchor=LEFT+FRONT+BOTTOM);
		translate([-1.5,-5.3,0]) rotate([0,0,-45]) cuboid([10,10,thickness],anchor=LEFT+FRONT+BOTTOM);
		cylinder(2*thickness,6,6);
	}
}
