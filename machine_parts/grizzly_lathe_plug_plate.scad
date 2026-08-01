include <BOSL2/std.scad>

$fn=360;

inch=25.4;


outer_width=(3+1/8)*inch;
screw_hole_d=1/4*inch;
screw_hole_r=screw_hole_d/2;
screw_hole_spacing=(2+5/8)*inch;
thickness=3;
hole_length=27;
hole_width=20;


render()
difference(){
	cuboid([outer_width,outer_width,thickness],anchor=BOTTOM,rounding=1,edges=
			[
			FRONT+LEFT,
			FRONT+RIGHT,
			BACK+LEFT,
			BACK+RIGHT
			]);
	cuboid([hole_width,hole_length,thickness] ,anchor=BOTTOM,rounding=.5,edges=
			[
			FRONT+LEFT,
			FRONT+RIGHT,
			BACK+LEFT,
			BACK+RIGHT
			]);

	for(i=[1,-1],j=[1,-1])
	{
		translate([i*screw_hole_spacing/2,j*screw_hole_spacing/2,0])
			cylinder(thickness,screw_hole_r,screw_hole_r);
	}
}
