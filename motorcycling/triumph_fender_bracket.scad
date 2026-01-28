include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=360;


fender_boss_spacing=85;
fender_boss_diameter=17;
fender_boss_radius=fender_boss_diameter/2;

bike_mount_spacing=29;
bike_mount_offset=13;

difference()
{
	color("coral")
	{
		hull()
		{
			cylinder(5,15/2,15/2);
			translate([fender_boss_spacing,0,0]) cylinder(5,15/2,15/2);
		}
		cylinder(2+5,fender_boss_radius,fender_boss_radius);
		translate([fender_boss_spacing,0,0]) cylinder(2+7+5,fender_boss_radius,fender_boss_radius);
	}
	fender_negative();
	bike_negative(bike_mount_offset);

}
//bike_positive(bike_mount_offset);

module fender_negative(){
	screw_hole("M6,25",anchor=CENTER,thread=true,bevel1="reverse");
	translate([fender_boss_spacing,0,0]) screw_hole("M6,45",anchor=CENTER,thread=true,bevel1="reverse");
}
module bike_positive(mount_offset)
{
	translate([mount_offset,0,0])
	cylinder(12.5-5,2.5,2.5,anchor=TOP);

}

module bike_negative(mount_offset)
{
	translate([mount_offset,0,0])
	cylinder(12.5,2.5,2.5);

	translate([mount_offset+bike_mount_spacing,0,0])
		screw_hole("M6,25",anchor=CENTER,thread=true,bevel1="reverse");

}

