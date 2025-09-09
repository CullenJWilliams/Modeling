include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

thickness=2.8;

grill_gap=.19;

base_ring();
//crown();
cross_support();

module base_ring()
{
	profile=[
		[0,0],
		[0,.13*inch],
		[-.114*inch,.13*inch],
		[-.078*inch,0],
		[0,0]
	];
	//stroke(profile);
	base_profile = circle(43);
	path_sweep(profile,base_profile);
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
			cuboid([100,grill_gap*inch,50],anchor=BOTTOM+FRONT);
	}
}

module cross_support()
{
	crossbar();
	render()
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
	interdistance = (.774+grill_gap)*inch;
	height = (1.42-.2)*inch;

	translate([0,(interdistance/2),height]) cylinder(.2*inch,.15*inch,.15*inch);
	translate([0,-(interdistance/2),height]) cylinder(.2*inch,.15*inch,.15*inch);
}

module screw_holes()
{
	interdistance = (.774+grill_gap)*inch;
	height = (1.42-.2)*inch;

	translate([0,(interdistance/2),height]) cylinder(.3*inch,(.148/2)*inch,(.148/2)*inch);
	translate([0,-(interdistance/2),height]) cylinder(.3*inch,(.148/2)*inch,(.148/2)*inch);
	translate([0,(interdistance/2),height]) cylinder(.3*inch,(grill_gap/2)*inch,(grill_gap/2)*inch);
	translate([0,-(interdistance/2),height]) cylinder(.3*inch,(grill_gap/2)*inch,(grill_gap/2)*inch);
}
