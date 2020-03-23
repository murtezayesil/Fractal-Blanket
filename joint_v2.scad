$fn = 36;

translate([-6,0,0])
union()
{
    hull(){
        sphere(3);
        rotate([ 0, 90, 0])
         linear_extrude(6)
         circle(1);
    }
    
    translate([12,0,0])
    hull(){
        sphere(3);
        rotate([0,-90,0])
        linear_extrude(6)
         circle(1);
    }
}