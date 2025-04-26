include <BOSL2/std.scad>
$fn=360;

difference()
{
	linear_extrude(5) rect([60,100],rounding=[5,5,5,5]);
	holes();
}
module holes(){
	translate([0,0,-1]) cylinder(7,7,7);
	boltholes();
}

module boltholes()
{
	ycoords = [+37,-37];
	xcoords = [+22,-22];
	for (x=xcoords,y=ycoords)
	{
		hull(){
			translate([x,y+1.5,-1]) cylinder(7,4,4);
			translate([x,y-1.5,-1]) cylinder(7,4,4);
		}
	}

}
