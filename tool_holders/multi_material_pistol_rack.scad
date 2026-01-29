include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;
inch = 25.4;

length = 17.75*inch ;
width = 1*inch;
height = .5*inch;

render()
difference()
{
	cube([length,width,height]);
	for(i=[1.6*inch:1.6*inch:length-(1.6*inch)])
	{
		translate([i,0,2]) 
		#cube([(1/8)*inch+.5,80,80],anchor=CENTER+BOTTOM);
	}

	path=[[0,0],[10,width/3],[10,2*width/3],[0,width]];

	translate([(17.75*inch)/2-13,0,0]) 
	linear_extrude(height)
	#stroke(path);

}
