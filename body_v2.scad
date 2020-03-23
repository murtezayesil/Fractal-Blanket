// for smoother circles
$fn=36;


// Main Body V2
#translate([-20, -20, 0])    // center
{
    difference(){
        union(){
            // body
            hull(){
                translate([5,5,2.5]){
                    minkowski(){
                         linear_extrude(.001)
                          circle(5);
                        cube([30,30,2.5]);
                    }
                }
                translate([5,5,0])
                 cube([30,30,1]);
            }
            
            // nails
            color("orange"){
                // +X +Y
                translate([35,35, 5])
                 linear_extrude(2)
                  circle(2.5);
                
                // -X -Y
                translate([ 5, 5, 5])
                 linear_extrude(2)
                  circle(2.5);
            }
        }
        
        union(){
            // nail beds
            color("red"){
                
                // +X -Y
                translate([35, 5, 2.5])
                 linear_extrude(3)
                  circle(2.5);
                
                // -X +Y
                translate([ 5,35, 2.5])
                 linear_extrude(3)
                  circle(2.5);
            }
            
            // joint beds
            color("red")
            translate([20,20, 0])
            for (i=[1,2,3,4]){
                // -Y
                rotate([0,90,i*90])
                rotate([0,0,0])
                translate([ -5, -5, 18]){
                    hull(){
                        translate([ 0, 5, 0])
                         linear_extrude(1)
                          circle(2);
                        translate([ 0, 5, -4])
                         sphere(4);
                    }
                    translate([ 0, 5, 1])
                    linear_extrude(1)
                     circle(2);
                }
            }
        }
    }
}
//


// joint v2
% translate([15, 0, 5])
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

// Zone Markers
// won't print in 3D printer
{
    % translate([30,30,1])
        text("+x +y", 5);
    % translate([30,-30,1])
        text("+x -y", 5);
    % translate([-40,30,1])
        text("-x +y", 5);
    % translate([-40,-30,1])
        text("-x -y", 5);
}
//