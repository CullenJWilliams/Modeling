include <BOSL2/std.scad>



difference(){
	translate([0,0,0]){
		linear_extrude(1)
			rect([19.5,8.5],rounding=[4.25,4.25,4.25,4.25],$fn=100);

		translate([0,0,-1])
			linear_extrude(1)
			rect([23,11],rounding=[4,4,4,4],$fn=100);
	}

	color("tomato")
		translate([0,0,0]) {


			linear_extrude(2){
				circle(2,$fn=100);

				translate([-2,2.5,0])
					rotate([0,0,35])
					rect([.5,1.5], rounding=[.25,.25,.25,.25], $fn=100);

				translate([-.75,3.25,0])
					rotate([0,0,15])
					rect([.5,1.5], rounding=[.25,.25,.25,.25], $fn=100);

				mirror([2,0,0]){
					translate([-2,2.5,0])
						rotate([0,0,35])
						rect([.5,1.5], rounding=[.25,.25,.25,.25], $fn=100);

					translate([-.75,3.25,0])
						rotate([0,0,15])
						rect([.5,1.5], rounding=[.25,.25,.25,.25], $fn=100);
				}

				translate([0,-2,0])
					rect([2,4],rounding=[1,1,1,1],$fn=100);
			}

		}
}
