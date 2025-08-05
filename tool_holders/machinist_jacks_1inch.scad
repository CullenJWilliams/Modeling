include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;
inch = 25.4;

jack_width=(1*inch)+.5;

jack_stand();
translate([jack_width+3,0,0]) jack_stand();

module jack_stand()
{
	render()
	difference()
	{
		translate([0,0,-1]) case(jack_width+5, jack_width+5, 12);
		render()
			color("teal") {
				cube([jack_width,jack_width,20],anchor=CENTER+BOTTOM);
			}
	}
}

module case(length, width, height)
{
	translate([0,0,height]) prismoid(size1=[width,width], size2=[width-2,width-2], h=2);
	cube([length,width,height],anchor=CENTER+BOTTOM);
}
