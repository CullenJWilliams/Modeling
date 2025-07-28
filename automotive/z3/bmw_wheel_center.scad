$fn=360;

column_diameter=65;

render(){
	base(68/2);
	column(10,column_diameter/2);
}

module base(r){
difference(){
	translate([0,0,-1]) cylinder(2,r,r);
	translate([0,0,-1]) difference(){
		cylinder(1,r,r);
		cylinder(1,r-1,r-1);
	}
	translate([-1,-r,-1]) cube([2,2*r,1]);
	rotate(90) translate([-1,-r,-1]) cube([2,2*r,1]);
	}
}

module column(h,r)
{
	difference(){
		color("teal"){
			translate([0,0,h-3]) cylinder(3,r+2,r);
			cylinder(h,r,r);
		}
		cylinder(h,r-3,r-1);
		cuts(h+4,r+4);
	}
}

module cuts(h,r)
{
	translate([0,-r,-1]) cube([1,r*2,h]);
	rotate(90) translate([0,-r,-1]) cube([1,r*2,h]);
	rotate(-45)translate([0,-r,-1]) cube([1,r*2,h]);
	rotate(45) translate([0,-r,-1]) cube([1,r*2,h]);
}
