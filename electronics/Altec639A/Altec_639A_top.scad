include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

thickness=2.8;

base_ring();
crown();
cross_support();

module base_ring()
{
	// TODO prototype
	difference(){
		circle(43+thickness);
		circle(43);
	}
	// ACTUAL
	profile=[
		[0,0],
		[0,.13*inch],
		[.114*inch,.13*inch],
		[.078*inch,0],
		[0,0]
	];
		stroke(profile);
		// TODO sweep path along base profile
		// path_sweep(profile,base_profile);


}

module crown()
{
	difference()
	{
		exterior_crown();
		interior_crown();
		slices();
	}
}

module exterior_crown()
{
	difference()
	{
		sphere(43);
		cuboid([100,100,100],anchor=TOP+CENTER);
	}
}

module interior_crown()
{
	difference()
	{
		sphere(43-thickness);
		cuboid([100,100,100],anchor=TOP+CENTER);
	}
}

module slices()
{
	mirror([0,1,0]) ySlices();
	ySlices();
}

module ySlices()
{
	for(i=[0:1:4]){
		translate([0,(.123/2+i*(.2+.123))*inch,0])
			cuboid([100,.2*inch,50],anchor=BOTTOM+FRONT);
	}
}

module cross_support()
{
	crossbar();
	difference()
	{
		screw_bosses();
		screw_holes();
	}
}

module crossbar()
{
}

module screw_bosses()
{
}

module screw_holes()
{
}
