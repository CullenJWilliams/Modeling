
include <BOSL2/std.scad>
include <BOSL2/lists.scad>
include <BOSL2/math.scad>

$fn=360;

t=.05;
height = 30.65;
socket_diameters = [16.8  ,16.8 ,16.8  ,17.8 ,19.8  ,21.9 ,23.7   ,25.8 ,27.8   ,30];
socket_labels =    ["5/16","3/8","7/16","1/2","9/16","5/8","11/16","3/4","13/16","7/8"];
text_size=7;wall_thickness=2;

difference(){
	union(){
		box(socket_diameters,height,t);
		translate([-5,wall_thickness,0])
			labels(socket_diameters,socket_labels,height,t);
	}
	translate([-5,wall_thickness,0])
		sockets(socket_diameters,socket_labels,height,t);
}

module box(socket_diameters,height,t)
{
	cuboid([sum(socket_diameters)+len(socket_diameters*3)*2+20,height+text_size+2*wall_thickness,max(socket_diameters)/2+wall_thickness],anchor=LEFT+FRONT+TOP);
}

module sockets(socket_diameters,socket_labels,height,t)
{
	for (i=[0:1:len(socket_diameters)-1])
	{
		l = slice(socket_diameters,0,i);
		x = sum(l)+(i*3);
		translate([x,0,0])
			socket(socket_diameters[i],socket_labels[i],height);
	}
}

module labels(socket_diameters,socket_labels,height,t)
{
linear_extrude(1)
	for (i=[0:1:len(socket_diameters)-1])
	{
		l = slice(socket_diameters,0,i);
		x = sum(l)+(i*3);
		translate([x,0,0])
			label(socket_labels[i]);
	}
}

module socket(diameter,label,height)
{
	r = diameter/2;
	translate([0,text_size+1,0]) rotate([-90,0,0]) cylinder(height+t*2,r+t/2,r+t/2,anchor=BOTTOM);
}

module label(label)
{
	text(label,size=text_size,halign="center");
}
