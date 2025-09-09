include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

thickness=2.8;

base_ring();
//crown();
//cross_support();
//path = egg2(43, 41.85);
//stroke(closed = false, path);

module base_ring()
{
	// ACTUAL
	profile=[
		[0,0],
		[0,.13*inch],
		[.114*inch,.13*inch],
		[.078*inch,0],
		[0,0]
	];
    // stroke(profile);
    // TODO sweep path along base profile
    eggShape = egg2(43, 41.85);
    echo(eggShape);
    //path_sweep(profile, egg2(43, 41.85));
}

function egg2(r, h) =
    let(
        H = [0, h],
        O = [-r, 0],

        D_0 = normalize(H - O),
        D = O + 2 * r * D_0,
        
        theta = atan2(D_0[1], D_0[0]),
        
        right = [ for (i = arc(r = 2*r, angle=[0, theta])) i + [-r, 0] ],
        left = [ for (i = arc(r = 2*r, angle=[90+theta, 180])) i + [r, 0] ],
        top = [ for (i = arc(r = norm(H - D), angle=[theta, 90 + theta])) i + H ],
        bottom = arc(r = r, angle=[180, 360]),
        path = concat(bottom, right, top, left)
    )
    [for (i = path) [i[0], i[1], 0]];

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

function normalize(v) = v / norm(v);
