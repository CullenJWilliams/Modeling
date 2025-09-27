include <BOSL2/std.scad>
$fn=5;
inch = 25.4;
u=1.75*inch;

box_length=40;
box_depth=40;

box(box_length,box_depth,2);

// 2U tall box that glues or screws to the back of the amp
module box(length,width,height)
{
	cuboid([width,length,height*u]);

}
