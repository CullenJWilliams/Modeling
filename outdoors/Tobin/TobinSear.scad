include <BOSL2/std.scad>
$fn=360;

inch = 25.4;


sear();

module sear()
{
	difference()
	{
		sear_profile();
		pivot_hole();
	}
	transfer_bar();
	spring_shelf();
}

module spring_shelf()
{

	translate([7/32*inch/2,0,0]) 
		rotate([0,0,15]) cuboid([5/64*inch,5/32*inch,3/16*inch],anchor=FRONT+LEFT+BOTTOM);

}

module sear_profile()
{
	difference(){
		union(){
			hull()
			{
				translate([(5/32)*inch,(5/8)*inch,0]) rotate([0,0,20]) cuboid([(3/128)*inch,(3/16)*inch,(3/16)*inch],anchor=BACK+LEFT+BOTTOM);
				pivot_boss();
			}
			translate([6,5,0]) rotate([0,0,45]) cuboid([13,4,3/16*inch],anchor=FRONT+BOTTOM);
		}
		translate([-19.75,18,0]) cylinder((3/16)*inch,((15/16)*inch),((15/16)*inch),anchor=CENTER+BOTTOM); // front cut
		translate([11.0/32*inch,4/32*inch,0]) cylinder((3/16)*inch,((3/16)*inch),((3/16)*inch),anchor=CENTER+BOTTOM);
	}
}
module pivot_boss()
{
	cylinder((3/16)*inch,((7/32)*inch)/2,((7/32)*inch)/2,anchor=CENTER+BOTTOM);
}

module pivot_hole()
{
	cylinder(10,((9/64)*inch)/2,((9/64)*inch)/2,anchor=CENTER+BOTTOM);
	translate([0,0,(3/16-3/64)*inch]) cylinder(10,((3/16)*inch)/2,((3/16)*inch)/2,anchor=CENTER+BOTTOM);
}

module transfer_bar()
{
	pin_r=(1/8)*inch;
	translate([(1+5/32)*inch,(7/16)*inch,0]){
		translate([-pin_r,-pin_r,0])
			difference(){
				cylinder(33/64*inch,pin_r,(7/64)*inch);
				cuboid([10,10,20],anchor=BACK+BOTTOM);
			}
		//translate([5.5,(7/16)*inch-(3/16*inch)/2+1,0])
		//hull(){
		//	cuboid([.1,(3/16)*inch,(3/16)*inch],anchor=BOTTOM);
		//	translate([(13/16)*inch,0,0]) cuboid([.1,(1/8)*inch,(3/16)*inch],anchor=BOTTOM);
		//}

		translate([-13/16*inch-pin_r,-1/32*inch,0])
			rotate([-90,0,-90]) prismoid(size1=[(3/16)*inch,(3/16)*inch], size2=[1/8*inch,3/16*inch], h=13/16*inch, shift=[(1/8/2*inch)/2,0],anchor=BACK+BOTTOM);
	}
}
