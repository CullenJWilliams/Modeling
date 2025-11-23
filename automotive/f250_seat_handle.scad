include <BOSL2/std.scad>

$fn=360;

mirror([1,1,0]) 
render()
difference()
{
	profile();
	translate([0,0,5]) handle_slot();
}

module profile(){
	cuboid([78,37,12],anchor=LEFT+BOTTOM+FRONT,rounding=2);
}

module handle_slot()
{
	thickness = 6;
	width = 17.5;
	length = 40;
	notch_length = 14;
	notch_width = 8;
	notch_right_side = 15;
	tab_start = 28;
	notch_start = 8.5+tab_start;

	translate([tab_start,notch_right_side,0]) cuboid([length,width,2],anchor=LEFT+BOTTOM+FRONT);
	translate([0,2.5,0]) cuboid([28,30,20],anchor=LEFT+BOTTOM+FRONT);
	translate([notch_start,notch_right_side+(width/2)-(notch_width/2),0]) cuboid([notch_length,notch_width,20],anchor=LEFT+BOTTOM+FRONT); // notch

	translate([tab_start,notch_right_side,0]) cuboid([length,1,8],anchor=LEFT+BOTTOM+FRONT);
	translate([tab_start,notch_right_side+width-1,0]) cuboid([length,1,8],anchor=LEFT+BOTTOM+FRONT);

}
