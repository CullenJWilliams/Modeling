$fn=360;

shaft_h=5;
shaft_d=3;
shaft_r=shaft_d/2;

dovetail_width=2;
dovetail_angle=60;

dovetail_x=dovetail_width/2;
dovetail_y=tan(dovetail_angle)*dovetail_x;


rod_d=1;
rod_r=rod_d/2;

socket_size=1.5;
socket_r=socket_size/2;
thread_pitch="M3x.8";

cut_l=5;

slitting_saw_thickness=.2;

difference(){
	cylinder(shaft_h,shaft_r,shaft_r);

	translate([0,cut_l/2,shaft_h+dovetail_y/2]) rotate([90,180,0])
		linear_extrude(cut_l) 
		polygon([[0,0],[dovetail_x,dovetail_y],[-dovetail_x,dovetail_y]]);

	translate([0,5,1]) rotate([90,0,0]) cylinder(10,rod_r,rod_r);

	translate([0,0,shaft_h/2]) rotate([90,0,90]) cylinder(cut_l,rod_r,rod_r); // TODO threaded
	color("tomato") translate([0,0,shaft_h/2])
		rotate([90,0,-90]) cylinder(11,rod_r+.2,rod_r+.2);
	translate([-.1,-cut_l/2,0]) cube([slitting_saw_thickness,cut_l,cut_l]);
}

translate([-3,0,shaft_h/2]) rotate([90,0,90]) color("coral"){
	difference(){
		color("blue"){
			cylinder(1.5,1,1);
			cylinder(5,rod_r,rod_r); // TODO threaded
		}
		translate([0,0,-.25]) cylinder(1,socket_r,socket_r,$fn=6);
	}
}

