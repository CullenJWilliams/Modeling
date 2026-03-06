include <BOSL2/std.scad>

voltage_guage_mount();

module voltage_guage_mount()
{
	$fn=360;

	outer_length=25;
	outer_width =19.9;
	outer_height=6;
	slot_width =16.9;
	slot_height=2.5;
	tab_length=5.5;
	tab_height=1;
	top_height=1.4;
	bottom_height=outer_height-slot_height-top_height;

	cuboid([outer_length,outer_width,bottom_height],anchor=BOTTOM+LEFT);
	cuboid([outer_length,slot_width,outer_height-top_height],anchor=BOTTOM+LEFT);
	translate([0,0,outer_height]) cuboid([outer_length,outer_width,top_height],anchor=TOP+LEFT);
	cuboid([tab_length,outer_width,outer_height-top_height-slot_height+tab_height],anchor=BOTTOM+LEFT);
}
