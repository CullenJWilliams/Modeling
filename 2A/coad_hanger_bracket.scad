include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

thickness= 1*inch;
clamp_height=1*inch;
clamp_depth = (3/8)*inch;
clamp_top_depth=1*inch;
total_height=3*inch;
bar_radius = 10;

render(){
	difference()
	{
		linear_extrude(thickness)
		{
			profile(clamp_top_depth,total_height, bar_radius);

		}
		rotate([0,90,0])
			translate([-clamp_top_depth/2,bar_radius+5,0])
			cylinder(thickness,bar_radius,bar_radius);
	}
}

module profile(clamp_top_depth,total_height,bar_radius)
{
	square([clamp_top_depth,total_height]);
	translate([-10,total_height-10,0])square([10,10]);

}
