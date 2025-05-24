include <BOSL2/std.scad>

$fn=360;


id=11.17;
ir=id/2;
od=22;
or=od/2;
h=11.4;
kh=7.5;
kd=2.2;
kr=kd/2;
kc=25;


difference(){
	difference(){
		cylinder(h,or,or);
		translate([0,0,-1]) cylinder(h+2,ir,ir);
	}

	for(i=[0:360/kc:360]){
		echo(i);
		rotate([0,0,i])
			translate([or,0,(h-kh)/2])
			cylinder(kh,kr,kr);
	}
}
