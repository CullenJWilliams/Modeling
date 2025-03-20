difference(){
    translate([0,0,0]){
        import("/home/cullen/Downloads/pegboard_wire_anchor.stl");
        translate([-1.27,-42.5,0])
        cube([1,2,4]);
        translate([-8.23,-42.5,0])
        cube([1,2,4]);
    }
    translate([0,-43.4,-.5])
    {    
        translate([-8,0,0])
        cylinder(5,1,$fn=15);
        
        translate([-.51,0,0])
        cylinder(5,1,$fn=15);

    }
}