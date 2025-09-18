include <BOSL2/std.scad>
include <./AltecProfiles.scad>

$fn=360;

inch = 25.4;

thickness=2.8;

grill_gap=.19;

	//stroke(profile);

render()
difference(){
	base_ring(43.4);
	rotate([90,0,33]) cylinder(50,1.5,1.5);
	rotate([90,0,-33]) cylinder(50,1.5,1.5);
}
//crown();
//cross_support();

module base_ring(r)
{
	profile=[
		[0,0],
		[0,.13*inch],
		[.114*inch,.13*inch],
		[.078*inch,0],
		[0,0]
	];

	H = [0, 41.85];
	O = [-r, 0];

	D_0 = normalize(H - O);
	D = O + 2 * r * D_0;
	theta = atan2(D_0[1], D_0[0]);

	bottom = arc(r = r, angle=[180, 360],$fn=360);
	top = [ for (i = arc(r = norm(H - D), angle=[theta, 90 + theta],$fn=100)) i + H ];

	right = [ for (i = arc(r = 2*r, angle=[0, theta]),$fn=100) i + [-r, 0] ];
	left = [ for (i = arc(r = 2*r, angle=[90+theta-1, 180]),$fn=100) i + [r, 0] ];

	//stroke(bottom);
	//stroke(left);
	//stroke(right);
	//stroke(top);
	path_sweep(profile,bottom);
	path_sweep(profile,left);
	path_sweep(profile,right);
	path_sweep(profile,top);
}

module crown()
{
	difference()
	{
		exterior_crown();
		//interior_crown();
		rotate([0,0,90]) slices();
	}
}

module exterior_crown()
{
	echo("here");
	{
	H = [0, 41.85];
	O = [-43, 0];

	D_0 = normalize(H - O);
	D = O + 2 * 43 * D_0;
	theta = atan2(D_0[1], D_0[0]);

	bottom = arc(r = 43, angle=[180, 360],$fn=360);
	top = [ for (i = arc(r = norm(H - D), angle=[theta, 90 + theta],$fn=100)) i + H ];

        right = [ for (i = arc(r = 2*43, angle=[0, theta]),$fn=100) i + [-43, 0] ];
        left = [ for (i = arc(r = 2*43, angle=[90+theta, 180]),$fn=100) i + [43, 0] ];

	path_sweep([[0,0],[0,10],[10,20],[20,25],[25,26],[30,27],[40,28]],right);
	path_sweep([[0,0],[0,10],[10,20],[20,25],[25,26],[30,27],[40,28]],top);
	path_sweep([[0,0],[0,10],[10,20],[20,25],[25,26],[30,27],[40,28]],bottom);
	path_sweep([[0,0],[0,10],[10,20],[20,25],[25,26],[30,27],[40,28]],left);
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
			cuboid([200,grill_gap*inch,50],anchor=BOTTOM+FRONT);
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

	translate([(interdistance/2),0,height]) cylinder(.2*inch,.15*inch,.15*inch);
	translate([-(interdistance/2),0,height]) cylinder(.2*inch,.15*inch,.15*inch);
}

module screw_holes()
{
	interdistance = (.774+grill_gap)*inch;
	height = (1.42-.2)*inch;

	translate([(interdistance/2),0,height]) cylinder(.3*inch,(.148/2)*inch,(.148/2)*inch);
	translate([-(interdistance/2),0,height]) cylinder(.3*inch,(.148/2)*inch,(.148/2)*inch);
	translate([(interdistance/2) ,0,height]) cylinder(.3*inch,(grill_gap/2)*inch,(grill_gap/2)*inch);
	translate([-(interdistance/2),0,height]) cylinder(.3*inch,(grill_gap/2)*inch,(grill_gap/2)*inch);
}
