$fn=360;

buffer_diameter=6;
buffer_height=2.8;
shaft_diameter=1.6;
shaft_height=.6;
spear_diameter=3.9;
spear_height=1.8;

buffer_radius=buffer_diameter/2;
shaft_radius=shaft_diameter/2;
spear_radius=spear_diameter/2;

cylinder(buffer_height,buffer_radius,buffer_radius);
cylinder(buffer_height+shaft_height,shaft_radius,shaft_radius);
translate([0,0,buffer_height+shaft_height]) cylinder(spear_height,spear_radius,0);
