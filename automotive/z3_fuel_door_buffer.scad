$fn=360;


buffer_d=6;
buffer_h=2.8;
shaft_d=1.6;
shaft_h=.6;
spear_d=3.9;
spear_h=1.8;


buffer_r=buffer_d/2;
shaft_r=shaft_d/2;
spear_r=spear_d/2;

cylinder(buffer_h,buffer_r,buffer_r);
cylinder(buffer_h+shaft_h,shaft_r,shaft_r);
translate([0,0,buffer_h+shaft_h]) cylinder(spear_h,spear_r,0);
