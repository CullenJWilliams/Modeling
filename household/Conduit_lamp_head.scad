include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <BOSL2/screws.scad>

$fn=360;
inch = 25.4;

inner_diameter = 37;
inner_radius = inner_diameter/2;
od = (1+5/8)*inch;
or = od/2;
bd = 2*inch;
br = bd/2;

cap();
//translate([-60,0,0]) base();
translate([60,0,0]) ring();

module base()
{
	difference()
	{
		union()
		{
			threaded_rod(d=35.5,l=7,pitch=2,anchor=BOTTOM,$slop=10);
			cylinder(5.6,or,or,anchor=TOP);
			translate([0,0,-5.6]) sphere(36/2);
			translate([0,0,-26]) screw("1''-14,.65",head="none",thread=true,$slop=.5);
		}
		translate([0,0,-1*(.5*inch)+7]) cuboid([1.25*inch,.2*inch,.5*inch],anchor=BOTTOM);
		translate([0,0,-1*(.5*inch)+7])rotate([0,0,90]) cuboid([1.25*inch,.2*inch,.5*inch],anchor=BOTTOM);
		cylinder(70,(.7*inch)/2,(.7*inch)/2,anchor=CENTER);
		translate([0,0,7]) cylinder(10,50,50,anchor=BOTTOM);
		translate([0,0,7]) cylinder(.45*inch,(1.18*inch)/2,(1.18*inch)/2,anchor=TOP);
		translate([0,0,-3]) 
			rotate([0,0,45]) 
			difference(){
				sphere((1.18*inch)/2);
				difference(){
					union(){
						cuboid([.14*inch,50,50]);
						cuboid([50,.14*inch,50]);
					}
					cylinder(50,.83*inch/2,.83*inch/2,anchor=CENTER);
				}
			}
	}
}

module cap()
{
	render()
		difference(){
			union(){
				threaded_rod(d=od-.5,l=20,pitch=2,anchor=BOTTOM);
				cylinder(31,br,br,anchor=TOP); // TODO thread
			}
			translate([0,0,0]) cylinder(100,inner_radius,inner_radius);
			translate([0,0,0]) cylinder(100,28/2,28/2,anchor=TOP);
			translate([0,0,-31]) cylinder(7,or,or,anchor=BOTTOM);
		}
	translate([0,0,-31])threaded_nut(nutwidth=od+2, id=36, h=7, pitch=1.25,lead_in=0,anchor=BOTTOM,ibevel=false,bevel=false);
}

module ring()
{
	threaded_nut(nutwidth=od+10, id=od,h=10,pitch=2,anchor=BOTTOM,ibevel=false);
}
