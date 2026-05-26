include <BOSL2/std.scad>

$fn=360;

inch = 25.4;

inner_d=32.5;
inner_r=inner_d/2;
lense_offset= 2;
thickness=1;
lense_wall_thickness=3;

height=8;
font_size=5;
text_line_1 = "Eastman";
text_line_2 = "Kodak";

render()
	difference(){
		cylinder(height+lense_offset+thickness,inner_r+thickness,inner_r+thickness,anchor=BOTTOM);
		cylinder(height,inner_r,inner_r,anchor=BOTTOM);
		cylinder(height+lense_offset,inner_r-lense_wall_thickness,inner_r-lense_wall_thickness,anchor=BOTTOM);
		translate([0,-((1.4*font_size)/4)+((1.4*font_size)/2),                height+lense_offset+(thickness/2)]) linear_extrude(thickness/2) text(text_line_1,font="GFS Didot:style=Bold Italic",size=font_size,anchor=BOTTOM+CENTER);
		translate([0,-((1.4*font_size)/4)-((1.4*font_size)/2),height+lense_offset+(thickness/2)]) linear_extrude(thickness/2)                 text(text_line_2,font="GFS Didot:style=Bold Italic",size=font_size,anchor=BOTTOM+CENTER);
	}


