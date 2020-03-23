$fn =36;

// joint piece

translate([0, 7, 0])
{
    color("yellow")
    sphere(5);
    
    rotate([90,0,0])
    linear_extrude(14)
    circle(1.5);
    
    color("orange")
    translate([0,-14,0])
    sphere(5);
}