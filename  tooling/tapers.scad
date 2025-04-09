include <BOSL2/std.scad>


module morse_taper_0(t,tang=true) { morse_taper(0.3561,0.2520,0.5625,2.3438,1.7813, t, tang); }
module morse_taper_1(t,tang=true) { morse_taper(0.4750,0.3690,0.7500,2.5625,1.8125, t, tang); }
module morse_taper_2(t,tang=true) { morse_taper(0.7000,0.5720,0.8750,3.1250,2.2500, t, tang); }
module morse_taper_3(t,tang=true) { morse_taper(0.9380,0.7780,1.1875,3.8750,2.6875, t, tang); }
module morse_taper_4(t,tang=true) { morse_taper(1.2310,1.0200,1.2500,4.8750,3.6250, t, tang); }
module morse_taper_5(t,tang=true) { morse_taper(1.7480,1.4750,1.5000,6.1250,4.6250, t, tang); }
module morse_taper_6(t,tang=true) { morse_taper(2.4940,2.1160,1.7500,8.5625,6.8125, t, tang); }
module morse_taper_7(t,tang=true) { morse_taper(3.2700,2.7500,2.6250,11.625,9.0000, t, tang); }

module morse_taper(A,D,L,B,K,t,tang=true)
{
	a=A*25.4;
	d=D*25.4;
	l=L*25.4;
	k=K*25.4;
	cylinder(k,(d+t)/2,(a+t)/2);
	//translate([0,0,-l/2]) cuboid([d+t,d/3,l],rounding=d/10, edges=[BOTTOM+FRONT,BOTTOM+BACK,BOTTOM+RIGHT, BOTTOM+LEFT,FRONT+RIGHT, FRONT+LEFT, BACK+RIGHT, BACK+LEFT]);

	if (tang){
		difference()
		{
			color("cyan") translate([0,0,-l]) cylinder(l,(d+t)/2,(d+t)/2);
			translate([0,-d/3,-l/2]) cuboid([d+t,d/3,l+1],anchor=BACK);
			translate([0,d/3,-l/2]) cuboid([d+t,d/3,l+1],anchor=FRONT);
		}
	}
}

