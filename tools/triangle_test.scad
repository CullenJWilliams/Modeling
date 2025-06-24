$fn=360;

dovetail_width=2;
dovetail_angle=60;

dovetail_x=dovetail_width/2;
dovetail_y=tan(dovetail_angle)*dovetail_x;




polygon([[0,0],[dovetail_x,dovetail_y],[-dovetail_x,dovetail_y]]);
