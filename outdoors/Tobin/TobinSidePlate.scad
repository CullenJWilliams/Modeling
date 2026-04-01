include <BOSL2/std.scad>
$fn=360;

inch = 25.4;


thickness=1/8*inch;
length = 131.4;
front_radius=13/2;

hammer_pin_hole_x = (2.54*inch)-front_radius-(((1/8)*inch)/2)-.2; // if this doesn't work, delete the .5
hammer_pin_hole_y = .153*inch+1/16*inch;

plate_clamping_screw_x = (3.95*inch)-front_radius-((11/64)*inch)/2+(.05*inch)-.1;
plate_clamping_screw_y =(.6*inch)+((11/64*inch)/2);

sear_pivot_x = (3.667*inch)-front_radius-((.124*inch)/2);
sear_pivot_y = (.93*inch)-((1/16*inch)/2)-.1;

sear_stop_x = (4.216*inch)-front_radius-((.084*inch)/2);
sear_stop_y = (.166*inch)-((.084*inch)/2);

sear_spring_axis_x = (4.8*inch)-front_radius-((1/8*inch)/2);
sear_spring_axis_y = (.5*inch)-((1/8*inch)/2)+.5;

side_plate();

module side_plate()
{
	difference(){
		blank();
		translate([-hammer_pin_hole_x,hammer_pin_hole_y,0]) cylinder(20,1/16*inch,1/16*inch);
		translate([-plate_clamping_screw_x,plate_clamping_screw_y,0]) cylinder(20,(11/64*inch)/2,(11/64*inch)/2);
		translate([-sear_pivot_x,sear_pivot_y,0]) cylinder(20,(1/16*inch),(1/16*inch));
		translate([-sear_stop_x,sear_stop_y,0]) cylinder(20,(.084*inch)/2,(.084*inch)/2);
		translate([-sear_spring_axis_x,sear_spring_axis_y,0]) cylinder(20,(1/8*inch)/2,(1/8*inch)/2);
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
				translate([2,13,0]) cuboid([45.8+2,50,thickness],anchor=RIGHT+BOTTOM+FRONT);
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
		translate([-1,-6,0]) rotate([0,0,-45]) cuboid([10,10,thickness],anchor=LEFT+FRONT+BOTTOM);
		cylinder(2*thickness,6,6);
	}
}
