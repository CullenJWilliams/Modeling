include <BOSL2/std.scad>


module morse_taper_0(t,tang=true) { morse_taper(0.3561,0.2520,0.5625,2.3438,1.7813, t, tang); }
module morse_taper_1(t,tang=true) { morse_taper(0.4750,0.3690,0.7500,2.5625,1.8125, t, tang); }
module morse_taper_2(t,tang=true) { morse_taper(0.7000,0.5720,0.8750,3.1250,2.2500, t, tang); }
module morse_taper_3(t,tang=true) { morse_taper(0.9380,0.7780,1.1875,3.8750,2.6875, t, tang); }
module morse_taper_4(t,tang=true) { morse_taper(1.2310,1.0200,1.2500,4.8750,3.6250, t, tang); }
module morse_taper_5(t,tang=true) { morse_taper(1.7480,1.4750,1.5000,6.1250,4.6250, t, tang); }
module morse_taper_6(t,tang=true) { morse_taper(2.4940,2.1160,1.7500,8.5625,6.8125, t, tang); }
module morse_taper_7(t,tang=true) { morse_taper(3.2700,2.7500,2.6250,11.625,9.0000, t, tang); }

///
/// A = base diameter
/// D = top diameter
/// L = tang height
/// B = overall height (not used)
/// K = Height w/o tang
/// t = tolerance
/// tang = Whether to add a tang to this taper
module morse_taper(A,D,L,B,K,t,tang=true)
{
	a=A*25.4;
	d=D*25.4;
	l=L*25.4;
	k=K*25.4;
	b=B*25.4;
	mmorse_taper(a,d,l,b,k,t,tang);
}

module mmorse_taper(a,d,l,b,k,t,tang=true)
{
	cylinder(k,(d+t)/2,(a+t)/2);
	//translate([0,0,-l/2]) cuboid([d+t,d/3,l],rounding=d/10, edges=[BOTTOM+FRONT,BOTTOM+BACK,BOTTOM+RIGHT, BOTTOM+LEFT,FRONT+RIGHT, FRONT+LEFT, BACK+RIGHT, BACK+LEFT]);

	if (tang){
		difference()
		{
			color("cyan") translate([0,0,-l]) cylinder(l,(d+t)/2,(d+t)/2);
			translate([0,-d/6,-l/2-d/4]) cuboid([d+t,d,l+1],anchor=BACK);
			translate([-d,-d/4-d/6,-d/4]) rotate([0,90,0]) cylinder(d*2,d/4,d/4);
			translate([0,-d/4-d/6,0]) rotate([-90,0,0])cuboid([d+t,d,l+1],anchor=TOP+FRONT);

			mirror([0,1,0]){
				translate([0,-d/6,-l/2-d/4]) cuboid([d+t,d,l+1],anchor=BACK);
				translate([-d,-d/4-d/6,-d/4]) rotate([0,90,0]) cylinder(d*2,d/4,d/4);
				translate([0,-d/4-d/6,0]) rotate([-90,0,0])cuboid([d+t,d,l+1],anchor=TOP+FRONT);
			}
		}
	}
}

