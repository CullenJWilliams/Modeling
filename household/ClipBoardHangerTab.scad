include <BOSL2/std.scad>

inner_length=110;

difference(){
	union(){
		cuboid([inner_length+20,10,1],anchor=BACK+BOTTOM);
		rotate([-90,0,0]) prismoid([inner_length+20,3],[20,3],20,anchor=BOTTOM+BACK);
	}
	cuboid([inner_length,10,1],anchor=BACK+BOTTOM);
	rotate([-90,0,0]) #prismoid([inner_length,3],[20-10,3],20-5,anchor=BOTTOM+BACK);
}
