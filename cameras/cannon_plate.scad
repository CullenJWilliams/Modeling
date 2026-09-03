include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

projection()
{
	render()
		difference()
		{
			union(){
				translate([-29.9,-29.775,0])scale(.1) import("Canon_FD_lens_to_Sony_E_body.STL");
				//cylinder(10,25.23,25.23);
			}
			translate([0,0,2]) cuboid([100,100,100],anchor=BOTTOM);
			//cylinder(10,24.23,24.23);
		}
}
