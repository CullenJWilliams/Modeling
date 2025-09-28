include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

thickness=1/8*inch;
length = 131.4;
front_radius=13/2;
hammer_pin_hole_x = (2.4*inch)-front_radius-(((1/8)*inch)/2);
hammer_pin_hole_y = .153*inch+1/16*inch;
plate_clamping_screw_x = (3.95*inch)-front_radius-((11/64)*inch)/2+(.05*inch);
plate_clamping_screw_y =(.6*inch)+((11/64*inch)/2);
sear_pivot_x = (3.647*inch)-front_radius-((.124*inch)/2);
sear_pivot_y = (.93*inch)-((1/16*inch)/2);
sear_stop_x = (4.216*inch)-front_radius-((5/64*inch)/2);
sear_stop_y = (.166*inch)-((5/64*inch)/2);
sear_spring_axis_x = (4.8*inch)-front_radius-((3/32*inch)/2);
sear_spring_axis_y = (.5*inch)-((3/32*inch)/2);

difference(){
	blank();
	translate([-hammer_pin_hole_x,hammer_pin_hole_y,0]) cylinder(20,1/16*inch,1/16*inch);
	translate([-plate_clamping_screw_x,plate_clamping_screw_y,0]) cylinder(20,(11/64*inch)/2,(11/64*inch)/2);
	translate([-sear_pivot_x,sear_pivot_y,0]) cylinder(20,(1/16*inch),(1/16*inch));
	translate([-sear_stop_x,sear_stop_y,0]) cylinder(20,(5/64*inch)/2,(5/64*inch)/2);
	translate([-sear_spring_axis_x,sear_spring_axis_y,0]) cylinder(20,(5/64*inch)/2,(5/64*inch)/2);
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
			translate([-length+(.3*inch)+.25,25/2+1.1,0]) rotate([0,0,5])scale([4,1,1]) cylinder(thickness,25/2,25/2,anchor=LEFT+BOTTOM);
			translate([-length+(.3*inch),25/2,0]) scale([1,1,1]) cylinder(thickness,7,7,anchor=LEFT+BOTTOM);
			translate([-length+(.3*inch)+1,25/2-2.8,0]) rotate([0,0,-5])scale([4,1,1]) cylinder(thickness,7,7,anchor=LEFT+BOTTOM);
			translate([-95.5,22.7,0]) rotate([0,0,15.5]) scale([1.85,.2,1]) cylinder(thickness,15,15);
		}
		color("coral")
		{
			translate([2,13,0]) cuboid([46,50,thickness],anchor=RIGHT+BOTTOM+FRONT);
			translate([-45.3,13,0]) cylinder(thickness,18.2,18.2,anchor=FRONT+BOTTOM);
			translate([-69.5,37.8-14,0])
				top_radius();
		}
	}
}
//translate([0,-20,0]) top_radius();

module top_radius()
{
		difference(){
			cuboid([10,10,thickness],anchor=LEFT+FRONT+BOTTOM);
			translate([-1,-4,0]) rotate([0,0,-45]) cuboid([10,10,thickness],anchor=LEFT+FRONT+BOTTOM);
			cylinder(2*thickness,7,7);
		}
}
