include <BOSL2/std.scad>
$fn=360;


twou=89;
length= 90;
width= 121;
height= 66+4;
thickness=4;

render(){
	box(length,width,twou,thickness);
}

module box(length,width,height,thickness)
{
	difference()
	{
		cuboid([width,length,height]);
		cuboid([width-thickness,length-thickness,height-thickness]);
		translate([0,-length/3,0]) rotate([45,0,0]) cuboid([width,200,height],anchor=BOTTOM);
	}
}
