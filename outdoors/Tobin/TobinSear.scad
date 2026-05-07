include <BOSL2/std.scad>
$fn=360;

inch = 25.4;


mirror([0,0,1])
	sear();

module sear()
{
	render()
	{
		difference()
		{
			sear_profile();
			pivot_hole();
		}
		transfer_bar();
		spring_shelf();
	}
}

module spring_shelf()
{

	translate([7/32*inch/2,-3/128*inch,0]) 
		rotate([0,0,20]) cuboid([5/64*inch,5/32*inch,7/32*inch],anchor=FRONT+LEFT+BOTTOM);

}

module sear_profile()
{
	difference(){
		union(){
			hull()
			{
				translate([(5/32)*inch-(1/64*inch),(5/8)*inch,0]) rotate([0,0,20]) cuboid([(3/128)*inch,(4/16)*inch,(7/32)*inch],anchor=BACK+LEFT+BOTTOM);
				pivot_boss();
			}
			translate([6,3,0]) rotate([0,0,45]) cuboid([10,4,7/32*inch],anchor=FRONT+BOTTOM);
		}
		translate([-19.75-1/64*inch,18,0]) cylinder((7/32)*inch,((15/16)*inch),((15/16)*inch),anchor=CENTER+BOTTOM); // front cut
		translate([11.1/32*inch,2.5/32*inch,0]) cylinder((7/32)*inch,((3/16)*inch),((3/16)*inch),anchor=CENTER+BOTTOM);
	}
}

module pivot_boss()
{
	cylinder((7/32)*inch,((7/32)*inch)/2,((7/32)*inch)/2,anchor=CENTER+BOTTOM);
}

module pivot_hole()
{
	cylinder(10,((9/64)*inch)/2,((9/64)*inch)/2,anchor=CENTER+BOTTOM);
	translate([0,0,(3/16-3/64)*inch]) cylinder(10,((3/16)*inch)/2,((3/16)*inch)/2,anchor=CENTER+BOTTOM);
}

module transfer_bar()
{
	pin_r=((3/16)/2)*inch;
	translate([(1+5/32)*inch,(14.5/32)*inch,0])
		rotate([0,0,8])
		{
			translate([-pin_r,-pin_r,0])
				difference(){
					cylinder(33/64*inch,pin_r,((5/32)/2)*inch);
					cuboid([10,10,20],anchor=BACK+BOTTOM);
				}
			//translate([5.5,(7/16)*inch-(3/16*inch)/2+1,0])
			//hull(){
			//	cuboid([.1,(3/16)*inch,(3/16)*inch],anchor=BOTTOM);
			//	translate([(13/16)*inch,0,0]) cuboid([.1,(1/8)*inch,(3/16)*inch],anchor=BOTTOM);
			//}

			h=14/16*inch;
			translate([-h-pin_r,0,0])
				rotate([-90,0,-90])
				prismoid(size1=[(3/16)*inch,(7/32)*inch], size2=[pin_r,7/32*inch], h=h, shift=[(pin_r)/2,0],anchor=BACK+BOTTOM);
		}
}
