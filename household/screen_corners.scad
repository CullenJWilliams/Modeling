include <BOSL2/std.scad>
$fn=360;

difference(){
	render(){
		cuboid([22,110,10],anchor=FRONT+TOP);
		cuboid([110,22,10],anchor=RIGHT+TOP);
		cuboid([22,22,10],anchor=TOP);
	}

	translate([0,12,0]) cuboid([20,100,8],anchor=FRONT+TOP);
	translate([-12,0,0]) cuboid([100,20,8],anchor=RIGHT+TOP);
}
