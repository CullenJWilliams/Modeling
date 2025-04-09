include <BOSL2/std.scad>

$fn=360;

overall_diameter=80.8;
thickness=3;
total_height = 8.6;

num_holes=3;
hole_dia=9;
holespacing=overall_diameter-1.6;

intersection()
{
	difference()
	{
		color("mediumseagreen"){
			ring(overall_diameter,total_height,thickness);
			ring(61,total_height,thickness);
			ring(overall_diameter,thickness,16);
			holes_bosses(num_holes, hole_dia, holespacing,thickness, total_height, overall_diameter);
			cutout_boss(x=-(overall_diameter/2+4.5),y=0,r=28/2+3,total_height);
		}
		color("teal"){
			holes(num_holes, hole_dia, holespacing,thickness, total_height);
			cutout(x=-(overall_diameter/2+4.5),y=0,r=28/2);
		}
	}
		cylinder(total_height,overall_diameter/2,overall_diameter/2);
}

module ring(od, height, thickness)
{
	difference(){
		cylinder(height,od/2,od/2);
		color("teal")
			translate([0,0,-1]) cylinder(height+2,od/2-thickness,od/2-thickness);
	}
}

module holes_bosses(count, d, dst, thickness, height, oald)
{
	ir=d/2;
	difference(){
		color("red"){
			for(i=[1:120:360])
			{
				dst_on_center = dst/2-d/2;
				rotate(i,[0,0,1])
				{
					translate([dst_on_center,0,0]) cylinder(height,ir+thickness,ir+thickness);
				}
			}
		}
	cylinder(height,(61-3)/2,(61-3)/2);
	}
}

module holes(count, d, dst, thickness, height)
{
	ir=d/2;
	for(i=[1:120:360])
	{
		dst_on_center = dst/2-d/2;
		rotate(i,[0,0,1])
		{
			translate([dst_on_center,0,-1]) cylinder(height-thickness+1,ir,ir);
			translate([dst_on_center,0,height-3.1]) cylinder(thickness+2.1,5.4/2,5.4/2);
		}
	}
}

module cutout(x,y,r)
{
	translate([x,y,-1]) cylinder(40,r,r);
}

module cutout_boss(x,y,r,height)
{
	translate([x,y,0]) cylinder(height,r,r);
}
