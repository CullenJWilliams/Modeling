include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

foot_d=(5/8)*inch;
foot_r=foot_d/2;

post_d=(33/64)*inch;
post_r=post_d/2;

foot_h=(7/32)*inch;
post_h=(5/16)*inch;

cyl(h=foot_h,r=foot_r,anchor=TOP,rounding1=3);
cyl(h=post_h,r=post_r,anchor=BOTTOM,chamfer2=1);
