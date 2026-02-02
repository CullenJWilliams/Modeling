include <BOSL2/std.scad>

$fn=360;

translate([-5,18,47.5]) 
rotate([0,-90,-90])
linear_extrude(2)
text("BMW");

render()
difference()
{
	color("brown"){
		body_core();
		translate([0,0,10]) rib(5.5);
		translate([0,0,17.5]) rib(4);
		translate([0,0,23]) rib(4);
		translate([0,0,104]) rib(4);
		translate([0,0,110]) rib(4);
		translate([0,0,116]) rib(7);
		center_ribs();
	}
	center_post();
	translate([0,0,130])
	rotate([45,0,0]) cuboid([100,100,20]);

	translate([0,18.2,47.5]) 
	rotate([0,-90,-90])
	cuboid([35,20,10],anchor=BOTTOM+LEFT,rounding=2);
}




module center_ribs(){
	translate([0,0,31])
	{

		difference(){
			color("teal"){
				translate([5,0,0]) cuboid([4.5,28,69],anchor=FRONT+BOTTOM);
				translate([-5,0,0]) cuboid([4.5,28,69],anchor=FRONT+BOTTOM);

				rotate(-10) translate([10,0,0]) cuboid([4.5,48,69],anchor=FRONT+BOTTOM);
				rotate(10) translate([-10,0,0]) cuboid([4.5,48,69],anchor=FRONT+BOTTOM);

				rotate(-15) translate([+15,0,0]) cuboid([4.5,48,69],anchor=FRONT+BOTTOM);
				rotate(+15) translate([-15,0,0]) cuboid([4.5,48,69],anchor=FRONT+BOTTOM);

				translate([+0,8,0]) rotate(-70) cuboid([4.5,48,69],anchor=FRONT+BOTTOM);
				translate([-0,8,0]) rotate(+70) cuboid([4.5,48,69],anchor=FRONT+BOTTOM);

				translate([+0,0,0]) rotate(-70) cuboid([4.5,48,69],anchor=FRONT+BOTTOM);
				translate([-0,0,0]) rotate(+70) cuboid([4.5,48,69],anchor=FRONT+BOTTOM);
			}

			difference(){
				cuboid([200,200,200]);
				rib(69);
			}
		}
	}
}

module center_post()
{
	round_length=75;
	round_d=15;
	round_r=round_d/2;

	tab_length=38;
	tab_h=6.5;
	tab_w=20;

	cylinder(round_length,round_r,round_r);
	translate([0,0,round_length]) cuboid([tab_w,tab_h,tab_length],anchor=BOTTOM);

}

module body_core()
{
	path = turtle([
			"move", -20.9,
			"left", 85,
			"move", 10,
			"arcright", 9, 85,
			"move", 22,
			"arcright", 9, 85,
			"move", 10,
			"arcright", 3, 65,
			"move", 16.55,
			"arcright", 10, 60,
			"move", 16.55,
			"arcright", 3, 65,
	]);
	linear_extrude(123) polygon(path);
//	stroke(path);
}

module rib(h)
{
	path = turtle([
			"move", -20.9-2.5,
			"left", 85,
			"move", 10+2.5,
			"arcright", 9, 85,
			"move", 22+4,
			"arcright", 9, 85,
			"move", 10+2.5,
	]);
	linear_extrude(h) polygon(path);

}
