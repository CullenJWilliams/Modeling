include <BOSL2/std.scad>
$fn=360;

d=6.5;
r=d/2;
thickness=.1;
height=3;

render()
difference()
{
	cylinder(height,r+thickness,r+thickness);
	cylinder(height,r,r);
}
