$fn=360;


buffer_d=10;
buffer_h=5;
shaft_d=2;
shaft_h=1;
spear_d=4;
spear_h=3;


buffer_r=buffer_d/2;
shaft_r=shaft_d/2;
spear_r=spear_d/2;

cylinder(buffer_h,buffer_r,buffer_r);
cylinder(buffer_h+shaft_h,shaft_r,shaft_r);
translate([0,0,buffer_h+shaft_h]) cylinder(spear_h,spear_r,0);
