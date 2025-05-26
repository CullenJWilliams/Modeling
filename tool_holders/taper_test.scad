include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <./tapers.scad>

$fn=360;

translate([0,0,0])   morse_taper_0(.2, false);
translate([15,0,0])  morse_taper_1(.2, true);
translate([35,0,0])  morse_taper_2(.2, true);
translate([60,0,0])  morse_taper_3(.2, true);
translate([90,0,0])  morse_taper_4(.2, false);
translate([130,0,0]) morse_taper_5(.2, true);
translate([190,0,0]) morse_taper_6(.2, true);
translate([270,0,0]) morse_taper_7(.2, true);
