include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn=360;

t = .2;
w = 8.3 + t;
cw = 10 + t;
cd = 24.6;
sizes = [100,90,80,75,72,70,70,68,66,60,50,48,45,40,35,30];

length = 15*len(sizes)+10;
width = sizes[0]+1;


//render()
//difference()
//{
//	library();
//	top_half();
//}

translate([-20,0,0]) top_half();


module top_half()
{
	render()
		color("coral") 
		difference()
		{
			library();
			translate([207,15,width/4]) rotate([-20,0,90]) cut();
		}
}

module cut(){
	diff()
		cuboid([140,120,200]){
			attach(BACK) dovetail("male", slide=200, width=110.2, height=7.8);
		}
}

module library(){
	color("teal")
		difference()
		{
			translate([0,(-width/2)-1,0]) cube([length,width+2+25,width/2]);

			translate([10,0,0]){
				color("teal"){
					for (i=[0:1:len(sizes)-1])
					{
						d = sizes[i];
						translate([(i*15),0,102/2]) rotate([0,70,0]) gear_slot(d+2, w, cd, cw);
					}
				}
			}
		}
	for (i=[0:1:len(sizes)-1])
	{
		d = sizes[i];
		translate([(i*15)+20,(d/2)+2,(102/2)]) rotate([0,0,90]) linear_extrude(1) text(format_int(d));
	}
}

module gear_slot(d,w,cd,cw)
{
	r=d/2;
	cr=cd/2;
	centerline = (cw-w)/2;
	cylinder(w,r,r, $fn=360);
	translate([0,0,-centerline]) cylinder(cw,cr,cr, $fn=360);
}
