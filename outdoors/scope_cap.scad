include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

inner_diameter = 73.5;
inner_radius = inner_diameter/2;
thickness= 2;
height=28;

difference(){
	base(inner_radius,height,thickness);
	body(inner_radius,height,thickness);
}
eyelets(inner_radius,thickness);

module base(radius,height,thickness)
{
	cylinder(height,radius+thickness,radius+thickness);
}

module body(radius,height,thickness)
{
	translate([0,0,thickness]) cylinder(height,radius,radius);
}

module eyelets(radius,thickness)
{
	r=5/2;
	for(i=[0:180:360]){
		
		rotate([0,0,i])
		translate([radius+r+thickness,0,0])
		{
			mirror([0,1,0]) cap_fillet(r);
			cap_fillet(r);
			
			difference(){
				cylinder(10,r,r);
				cylinder(10,r/2,r/2);
			}
		}
	}
}

module cap_fillet(r)
{

	translate([-.3,2,0]) rotate([0,90,-210]) wedge([10,4,3],anchor=BOTTOM+RIGHT+FRONT);

	color("coral")
	rotate([0,0,0])
	translate([-r+.2,r-.1,0])
	fillet(l=10,5,120,anchor=BOTTOM);
}
