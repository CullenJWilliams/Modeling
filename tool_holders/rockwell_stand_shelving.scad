include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

inch=25.4;

top_width=(9.5)*inch;
top_depth=(13+5/8)*inch;
height=(18+3/16)*inch;
bottom_width=(10+7/8)*inch;
bottom_depth=(15)*inch;
rail_thickness=2*1.5*inch;

difference(){
	render(){
		difference(){
			prismoid([bottom_width+rail_thickness,bottom_depth+rail_thickness],[top_width+rail_thickness,top_depth+rail_thickness],height,rounding=1*inch);
			prismoid([bottom_width,bottom_depth+rail_thickness+1],[top_width,top_depth+rail_thickness+1],height);
			prismoid([bottom_width+rail_thickness+1,bottom_depth],[top_width+rail_thickness+1,top_depth],height);
		}

		difference(){
			render(){
				translate([top_width/2,(top_depth+rail_thickness)/2,0]) rail();
				mirror([1,0,0]) translate([top_width/2,(top_depth+rail_thickness)/2,0]) rail();
				mirror([0,1,0]) translate([top_width/2,(top_depth+rail_thickness)/2,0]) rail();
				mirror([0,1,0]) mirror([1,0,0]) translate([top_width/2,(top_depth+rail_thickness)/2,0]) rail();
			}
			for(i=[0:10:height])
			{
				translate([0,0,i]) cuboid([top_width,top_depth+rail_thickness,5],anchor=BOTTOM);
			}
		}
	}
	translate([0,0,200]) cuboid([400,800,.1]);
	translate([0,0,400]) cuboid([400,800,.1]);
}

module rail(){
	cuboid([4,10,height],anchor=BOTTOM+BACK+RIGHT);
	cuboid([15,10,height],anchor=BOTTOM+BACK+LEFT);
	cuboid([20,10,height/2],anchor=BOTTOM+BACK+LEFT);
}
