include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

render(){
	difference()
	{
		body();
		holes();
	}
}

module holes()
{
	color("coral"){
		bar_d = 4;
		bar_r=bar_d/2;

		mic_d=6;
		mic_r = mic_d/2;

		mic_h=3;

		cylinder(mic_h,mic_r,mic_r);
		translate([0,-mic_r-1,0])rotate([90,0,0]) cylinder(10,bar_r,bar_r);
		translate([0,-mic_r+4,0]) rotate([90,0,0]) cylinder(5,0,bar_r-.3);

	}
}

module body()
{
	translate([0,3.5,0]) cuboid([8,17.5,6],anchor=BACK, rounding=3.5,
			edges=[
			BACK+LEFT,
			BACK+RIGHT,
			BACK+BOTTOM,
			LEFT+BOTTOM,
			RIGHT+BOTTOM
			]);
}
