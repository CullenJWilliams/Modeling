include <BOSL2/std.scad>

$fn=360;

height=45;
length = 180;

difference(){
	base(height,length,20);

	color("teal"){
		translate([10,-5,0])  wrench(10, 15, height, 3, .5, .5, 0);
		translate([40,-5,0])  wrench(14, 20, height, 4, .5, 2.5, .5);
		translate([80,-5,0])  wrench(18, 22, height, 5, .5, 4.5, 1);
		translate([120,-5,0])  hook_wrench(16, 19, height, 5.2, .5, 3.5, 1);
		translate([160,-5,0])  hook_wrench(20, 23, height, 6.4, .5, 5.5, 1.5);
	}
}

module base(height, length, width){
	difference()
	{
		translate([0,-width+10,0]) cube([length,width,height]);
		translate([-1,5,-1]) cube([length+8,1.96,height-6]);
	}
}

module hook_wrench(l, tl, h, w, t, topx, topy)
{
	translate([-4.75,-1.85,0]) cube([l+t,w+t,h]);
	translate([topx,topy,h-5]) prismoid(size1=[l+t,w+t], size2=[tl,w+5], h=6, shift=[1,0]);

	translate([-3,-5,0]) cube([l-3,5.2+t,h]);
}

module wrench(l, tl, h, w,t, topx, topy)
{
	translate([-4.75,-1.85,0]) cube([l+t,w+t,h]);
	translate([topx,topy,h-5]) prismoid(size1=[l+t,w+t], size2=[tl,w+5], h=6);

	translate([-4,-5,0]) cube([l-1,5.2+t,h]);
}
