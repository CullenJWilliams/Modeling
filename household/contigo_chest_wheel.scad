include <BOSL2/std.scad>
$fn=360;


wheel_diameter = 49;
wheel_thickness = 17;
wheel_wrap_r = 30;
wheel_wrap_thickness = 31;
tab_width = 43.5;
tab_length = 55;
tab_thickness = 3;

translate([100,0,0]) wheel(wheel_thickness,wheel_diameter);

difference(){
	color("grey"){
		translate([13,0,wheel_wrap_thickness/2]) tab(tab_length,tab_width,tab_thickness);
		mirror([1,1,0]) translate([13,0,wheel_wrap_thickness/2]) tab(tab_length,tab_width,tab_thickness);
		tab_front(tab_thickness);
		wheel_wrap(wheel_wrap_r,wheel_wrap_thickness);
	}
	translate([0,0,wheel_wrap_thickness/2]) scale(1.10) 
		cylinder(wheel_thickness,wheel_diameter/2,wheel_diameter/2,anchor=CENTER);
}


module tab_front(thickness){
	rotate([0,0,-45]){
		translate([8.3,11.30,31/2]) 
			rotate([0,90,0]){
				linear_extrude(thickness)
					rect([43.5,22.6],anchor=BACK+CENTER);
			}
	}
}

module wheel(thickness,d)
{
	r=d/2;
	difference(){
		cylinder(thickness,r,r,anchor=CENTER);
		cylinder(thickness+2,3,3,anchor=CENTER);
	}
}

module wheel_wrap(r,thickness)
{
	difference()
	{
		cylinder(thickness,r,r);
		translate([0,0,-1]) cylinder(thickness+2,3,3);
		translate([15,-30,-10]) cube([30,100,100]);
		mirror([1,1,0]) translate([15,-30,-10]) cube([30,100,100]);
		tab_front(20);
	}
}

module tab(length, width,thickness)
{
	rotate([0,90,0]){
		difference()
		{
			linear_extrude(thickness)
				rect([width,length],rounding=[width/2,width/2,0,0],anchor=FRONT+CENTER);
			translate([0,45,0]) cylinder(10,2,2);
		}
	}
}
