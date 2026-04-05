include <BOSL2/std.scad>
$fn=360;

difference(){
	translate([0,0,0]){
		scale([1,.71,1])
			cylinder(90,30,20);
		handle();
		reinforcement();
	}
	color("coral"){
		translate([0,10,-1]){
			scale([1,.6,1]){
				cylinder(100,35,25);
			}
		}
		translate([0,-120,45])
			plug_end();
		translate([0,18.5,-10]){
		rotate([-5,0,0])
			linear_extrude(130)
				trapezoid(w1=35, w2=165, h=45);
		}
	}
};

module reinforcement(){
	translate([0,-8,65])
		scale([1,.65,1]){
			rotate_extrude(360)
				translate([-13,-20,0])
				trapezoid(w1=25, w2=10, h=55, rounding=[5,5,10,10]);
		}
}

module handle(){
	translate([0,-20,45]){
		rotate([90,0,0])
			cylinder(120,13,13);
	}

	translate([0,10,22.5])
		rotate([90,0,0])
		linear_extrude(150)
		trapezoid(w1=5, w2=10, h=45);


	translate([-5,-40,62])
		rotate([180,-90,0])
		linear_extrude(10)
		trapezoid(w1=20, w2=0, h=50, shift=-10);
}


module plug_end(){
	rotate([-90,0,0]){
		cylinder(20,10,7.5);
		translate([0,0,-40])
			cylinder(40,10,10);
	}
}


//difference()
//{
//	difference() {
//		cylinder(90,30,20,$fn=40);
//		translate([0,0,-1])
//		cylinder(100,25,15,$fn=40);
//	}
//	translate([-2,-40,-1])
//	{
//		cylinder(100,40,40,$fn=40);
//	}
//}
