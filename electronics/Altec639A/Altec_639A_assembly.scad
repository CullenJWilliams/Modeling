include <BOSL2/std.scad>
include <./AltecProfiles.scad>

$fn=360;

inch = 25.4;

thickness=2.8;

grill_gap=.19;


render(){
	base_ring_with_cutouts();
	crown(43.4,41.85);
	cross_support();
	}

module base_ring_with_cutouts()
{
	difference(){
		base_ring(43.4,41.85);
		rotate([90,0,33]) cylinder(50,1.5,1.5);
		rotate([90,0,-33]) cylinder(50,1.5,1.5);
	}
}

module base_ring(r,h)
{
	profile=[
		[0,0],
		[0,.13*inch],
		[.114*inch,.13*inch],
		[.078*inch,0],
		[0,0]
	];
		bottom = getFront(r,h);
		top = getBack(r,h);

		right = getRight(r,h);
		left = getLeft(r,h);

		//stroke(bottom);
		//stroke(left);
		//stroke(right);
		//stroke(top);
		path_sweep(profile,bottom);
		path_sweep(profile,left);
		path_sweep(profile,right);
		path_sweep(profile,top);
}

module crown(r,h)
{
	difference()
	{
		exterior_crown(r,h);
		interior_crown(r,h);
		rotate([0,0,90]) slices();
		cuboid([200,200,2],anchor=CENTER+BOTTOM);
	}
}

module exterior_crown(r,h)
{
	front = getFront(r,h);
	back = getBack(r,h);
	right =	getRight(r,h);
	left = getLeft(r,h);

	front_profile = [
		[0,0],
		[1,10],
		[2,14],
		[5,19],
		[10,25],
		[15,29],
		[20,32],
		[25,35],
		[30,36],
		[35,37],
		[40,38],
		[45,38.5],
	];

	// TODO actual profile
	back_profile = [
		[0,0],
		[1,10],
		[2,14],
		[5,19],
		[10,25],
		[15,29],
		[20,32],
		[25,35],
	];

	//stroke(front_profile);
	hull()
	{
		color("coral") path_sweep(back_profile,right);
		color("coral") path_sweep(back_profile,left);
		path_sweep(back_profile,back);
		path_sweep(front_profile,front);
	}
}

module interior_crown(r,h)
{
	front = getFront(r,h);
	back = getBack(r,h);
	right =	getRight(r,h);
	left = getLeft(r,h);

	front_profile = [
		[3,0],
		[5,13],
		[10,21],
		[15,25.5],
		[20,28.5],
		[25,30.5],
		[30,32.5],
		[35,34],
		[40,34.5],
		[45,35],
	];

	back_profile = [
		[3,0],
		[5,13],
		[10,21],
		[15,25.5],
		[20,28.5],
		[25,30.5],
	];
	hull(){
		color("coral") path_sweep(back_profile,right);
		color("coral") path_sweep(back_profile,left);
		path_sweep(back_profile,back);
		path_sweep(front_profile,front);
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
	difference()
	{
		interior_crown(43.4,41.85);
		scale([1.25,1,1]) sphere(30);
		translate([0,-3,0]) cuboid([100,100,100],anchor=FRONT);
		translate([0,-5,0]) cuboid([100,100,100],anchor=BACK);
	}
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

	color("coral")translate([(interdistance/2),0,height-2]) cylinder(.3*inch,(.148/2)*inch,(.148/2)*inch);
	color("coral")translate([-(interdistance/2),0,height-2]) cylinder(.3*inch,(.148/2)*inch,(.148/2)*inch);
	translate([(interdistance/2) ,0,height+2]) cylinder(.3*inch,(grill_gap/2)*inch,(grill_gap/2)*inch);
	translate([-(interdistance/2),0,height+2]) cylinder(.3*inch,(grill_gap/2)*inch,(grill_gap/2)*inch);
}
