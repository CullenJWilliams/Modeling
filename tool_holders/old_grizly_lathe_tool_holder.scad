include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;
inch = 25.4;

tray();

module tray()
{
	render()
		difference()
		{
			translate([-8,-(131-68)/2,-1]) case(42+5, 131, 10);
			render()
				color("teal") {
					linear_extrude(20)
						polygon([
								[0,0],
								[14,0],
								[28.5,8],
								[28.5,24],
								[22.2,22],
								[22.2,45.7],
								[28.5,43],
								[28.5,60],
								[14,68],
								[0,68],
						]);
				}
				color("coral"){
				translate([-10,0,7])cube([10,68,10]);

				}
		}
}

module case(length, width, height)
{
	translate([0,0,height]) prismoid(size1=[length,width], size2=[length-2,width-2], h=2, anchor=LEFT+FRONT+BOTTOM);
	cube([length,width,height]);
}
