include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

thickness= 1*inch;
clamp_height=1*inch-((1/16)*inch);
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
			translate([-clamp_top_depth/2,bar_radius+5,-40])
			cylinder(thickness+20,bar_radius,bar_radius);
	}
}

module profile(clamp_top_depth,total_height,bar_radius)
{
topbar_thickness =((1/4)*inch);
front_wall_thickness =((1/2)*inch);
polygon([
[0,0],
[0,total_height],
[-1.5*inch,total_height],
[-1.5*inch,total_height-topbar_thickness],
[-front_wall_thickness,total_height-topbar_thickness],
[-front_wall_thickness,total_height-topbar_thickness-clamp_height],
[-front_wall_thickness-clamp_depth,total_height-topbar_thickness-clamp_height],
[-front_wall_thickness-clamp_depth,total_height-topbar_thickness-clamp_height+((1/4)*inch)],
[-topbar_thickness-front_wall_thickness-clamp_depth,total_height-topbar_thickness-clamp_height+((1/4)*inch)],
[-topbar_thickness-front_wall_thickness-clamp_depth,0],


]);

	//square([clamp_top_depth,total_height]);
	//translate([-10,total_height-10,0])square([10,10]);

}
