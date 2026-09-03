include <BOSL2/std.scad>

$fn=360;

difference(){
	color("coral"){
		shaft();
		translate([0,0,22]) tab();
	}
	screw_hole();
}


module shaft()
{
	cylinder(22,5,5);


}

module screw_hole()
{
	cylinder(22,2,2);
	translate([0,0,10]) cylinder(22,3.5,3.5);

}

module tab()
{
	cuboid([10,30,5],rounding=5,edges=[FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
}
