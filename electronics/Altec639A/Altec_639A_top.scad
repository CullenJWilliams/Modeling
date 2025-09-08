include <BOSL2/std.scad>
$fn=5;

inch = 25.4;

base_ring();
crown();
cross_support();

module base_ring()
{

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
}

module interior_crown()
{
}

module slices()
{
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
