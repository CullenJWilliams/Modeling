include <BOSL2/std.scad>

$fn=360;


diameter = 110;
inch=25.4;

r=diameter/2;

profile=[
	[0,0],
	[3.5/2,0],
	[(6/2),4],
	[-(6/2),4],
	[-3.5/2,0],
	[0,0]
];


render();
difference(){
path_sweep(circle(2),circle(r),closed=true);
translate([0,0,-1.75]) cylinder(5,diameter,diameter,anchor=TOP);
translate([0,0,1.75]) cylinder(5,diameter,diameter,anchor=BOTTOM);
}
