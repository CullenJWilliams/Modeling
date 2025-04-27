include <BOSL2/std.scad>

$fn=360;
bottom_h=3.5;
bottom_d=28.5;
bottom_r=bottom_d/2;
middle_h=2;
middle_d=19.6;
middle_r=middle_d/2;
top_base_h = 2;
top_base_d = 25.5;
top_base_r = top_base_d/2;
top_taper_h = 3;
top_taper_d = 21;
top_taper_r = top_taper_d/2;
center_bore_d=13.5;
center_bore_r=13.5/2;
total_h = bottom_h+
					middle_h+
					top_base_h+
					top_taper_h;

render()
difference()
{
	profile();
	cylinder(total_h,center_bore_r,center_bore_r);
}

module profile(){
	cylinder(bottom_h,bottom_r,bottom_r);
	translate([0,0,bottom_h]) cylinder(middle_h,middle_r,middle_r);
	translate([0,0,bottom_h+middle_h]) cylinder(top_base_h,top_base_r,top_base_r);
	translate([0,0,bottom_h+middle_h+top_base_h]) cylinder(top_taper_h,top_base_r,top_taper_r);
}
