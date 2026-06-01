include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=360;

cardboard_center_d=54;
cardboard_center_r=cardboard_center_d/2;

center_bore_d=cardboard_center_d-2;
center_bore_r=center_bore_d/2;

cardboard_thickness=3;
spool_height=63;

thread_height=15;
center_height=spool_height-6-(2*thread_height);

translate([-150,0,0]) tab();
translate([150,0,0]) tab();
translate([0,0,spool_height-6-thread_height]) threaded_section();
centerbore();
threaded_section();

module threaded_section(){
	intersection(){
		acme_threaded_nut(nutwidth=cardboard_center_d+10, id=cardboard_center_d, h=thread_height, pitch=2,ibevel=false, $slop=0.05,anchor=TOP);
		cylinder(center_height+10,cardboard_center_r+4,cardboard_center_r+4,anchor=CENTER);
	}
}

module centerbore()
{
	refillament_d=81;
	refillament_r=refillament_d/2;
	render(){
		difference(){
			union(){
				cylinder(center_height,cardboard_center_r+4,cardboard_center_r+4,anchor=BOTTOM);
			}
			cylinder(center_height,center_bore_r,center_bore_r,anchor=BOTTOM);
		}
		translate([0,0,-thread_height])
		difference(){
			cylinder(spool_height-6,refillament_r,refillament_r,anchor=BOTTOM);
			cylinder(spool_height-6,cardboard_center_r+4,cardboard_center_r+4,anchor=BOTTOM);
		}
		}
}

module tab()
{
	difference()
	{
		union()
		{
			cylinder(cardboard_thickness,cardboard_center_r+4,cardboard_center_r+4,anchor=BOTTOM);
			cylinder(3,cardboard_center_r,cardboard_center_r,     anchor=TOP);
			acme_threaded_rod(d=cardboard_center_d, l=15, pitch=2,anchor=TOP);
		}
		cylinder(spool_height,center_bore_r-2,center_bore_r-2,anchor=CENTER);
	}
}
