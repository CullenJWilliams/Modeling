include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

boom_h=130;
boom_d = 4;
boom_r=boom_d/2;

rotate([180,0,0]) translate([40,0,0])
//translate([0,0,1])
mirror([0,0,1]) clamp();
clamp();

module clamp(){
	render(){
		difference()
		{
			body();
			boom();
			cable();
		}
	}
}

module cable()
{
	color("coral"){
		translate([6,4,0]) rotate([90,0,90]) cylinder(10,1,1);
	}
}
module boom()
{
	color("coral"){
		translate([6,0,0]) rotate([90,0,0]) cylinder(boom_h,boom_r,boom_r);
	}
}

module body()
{
	difference(){
		difference(){
			cylinder(2.5,22/2,22/2,anchor=CENTER+TOP);
			difference(){
			cylinder(1,20/2,20/2,anchor=CENTER+TOP);
			cylinder(2.5,7/2,7/2,anchor=CENTER+TOP);
			}
		}
		cylinder(2.5,5/2,5/2,anchor=CENTER+TOP);
	}
}
