include <BOSL2/std.scad>
$fn=360;

inch = 25.4;

thickness=2.8;


function egg2(r, h) =
    let(
        H = [0, h],
        O = [-r, 0],

        D_0 = normalize(H - O),
        D = O + 2 * r * D_0,
        
        theta = atan2(D_0[1], D_0[0]),
        
        right = [ for (i = arc(r = 2*r, angle=[0, theta]),$fn=100) i + [-r, 0] ],
        left = [ for (i = arc(r = 2*r, angle=[90+theta, 180]),$fn=100) i + [r, 0] ],
        top = [ for (i = arc(r = norm(H - D), angle=[theta, 90 + theta],$fn=100)) i + H ],
        bottom = arc(r = r, angle=[180, 360],$fn=100),
        path = concat(bottom, right, top, left)
    )
    [for (i = path)
		if (i[0]>42) [i[0], i[1]] ];

function normalize(v) = v / norm(v);
