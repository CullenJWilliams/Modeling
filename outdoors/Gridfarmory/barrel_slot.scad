include <BOSL2/std.scad>
include <../../../gridfinity-rebuilt-openscad/src/core/standard.scad>
use     <../../../gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-utility.scad>
use     <../../../gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-holes.scad>
use     <../../../gridfinity-rebuilt-openscad/src/helpers/generic-helpers.scad>

// ===== PARAMETERS ===== //

/* [Setup Parameters] */
$fa = 8;
$fs = 0.25;
$fn=360;

/* [General Settings] */
gridx = 1;
gridy = 1;
gridz = 8;

/* [Compartments] */
divx = 1;
divy = 1;

/* [Toggles] */
enable_zsnap = false;
style_lip = 0; //[0: Regular lip, 1:remove lip subtractively, 2: remove lip and retain height]
gridz_define = 0; // [0:gridz is the height of bins in units of 7mm increments - Zack's method,1:gridz is the internal height in millimeters, 2:gridz is the overall external height of the bin in millimeters]
style_tab = 5; //[0:Full,1:Auto,2:Left,3:Center,4:Right,5:None]
bottom_layer = 1;

/* [Base Hole Options] */
only_corners = false;
refined_holes = false;
magnet_holes = false;
screw_holes = false;
crush_ribs = true;
chamfer_holes = false;
printable_hole_top = false;

hole_options = bundle_hole_options(refined_holes, magnet_holes, screw_holes, crush_ribs, chamfer_holes, printable_hole_top);

// ===== IMPLEMENTATION ===== //

// Input all the cutter types in here
	color("tomato")
render()
	difference(){
		gridfinityLite(gridx, gridy, gridz, gridz_define, style_lip, enable_zsnap, l_grid, hole_options, only_corners);
translate([0,0,5]) cuboid([36.5,50,40],anchor=CENTER+BOTTOM,rounding=5);
		//diff()
		//	translate([0,0,5]) prismoid([14,50],[37,50],30,rounding=5){
		//		edge_profile([BOT+RIGHT, BOT+LEFT], excess=10, convexity=20) {
		//			mask2d_roundover(h=5,mask_angle=$edge_angle);
		//		}
		//	}
	}

// ===== CONSTRUCTION ===== //

module gridfinityLite(gridx, gridy, gridz, gridz_define, style_lip, enable_zsnap, length, style_hole, only_corners) {
	height_mm = height(gridz, gridz_define, style_lip, enable_zsnap);

	// Lower the bin start point by this amount.
	// Made up for in bin height.
	// Ensures divider walls smoothly transition to the bottom
	lower_by_mm = BASE_HEIGHT + bottom_layer;

	difference() {
		translate([0, 0, -lower_by_mm])
			gridfinityInit(gridx, gridy, height_mm+lower_by_mm, 0, length, sl=style_lip)
			children();

		// Underside of the base. Keep out zone.
		render()
			difference() {
				cube([gridx*length, gridy*length, BASE_HEIGHT*2], center=true);
				gridfinityBase([gridx, gridy], hole_options=style_hole, only_corners=only_corners);
			}
	}

	gridfinity_base_lite([gridx, gridy], d_wall, bottom_layer, hole_options=style_hole, only_corners=only_corners);
}
