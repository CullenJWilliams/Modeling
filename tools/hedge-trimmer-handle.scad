include <BOSL2/std.scad>



//difference(){
translate([0,0,0]){
	linear_extrude(143)
		difference(){
			ellipse(d=[24.5,32],$fn=360);
			ellipse(d=[20,26.8],$fn=360);
		}
}
rotate([180,0,0])
linear_extrude(15)
	ellipse(d=[24.5,32],$fn=360);


//}
