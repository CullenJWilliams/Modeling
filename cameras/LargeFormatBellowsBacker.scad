include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

height=1;
length=161;
width=161;

render()
difference()
{
	cuboid([length,width,height],              rounding=4,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
	cuboid([length-(13*2),width-(13*2),height],rounding=4,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
}
