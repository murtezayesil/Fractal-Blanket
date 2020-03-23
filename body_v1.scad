// WARNING
//
// This code is written:
// 1. to be a reference of the idea
// 2. to build a shape that will be the foundation of the project
// This code is NOT meant to produce a shape that is easy to resize .
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// Shapes' locations are indicated by their zones relative to X-Y plane.
// ex. "nail +x -y" refers to pin that is in zone where X is +ve but Y is -ve

// Zone Markers
// won't print in 3D printer
% translate([30,30,1])
    text("+x +y", 5);
% translate([30,-30,1])
    text("+x -y", 5);
% translate([-40,30,1])
    text("-x +y", 5);
% translate([-40,-30,1])
    text("-x -y", 5);


// for smoother circles
$fn=36;


// main_body

translate([20,-20,10])
rotate([0,180,0])
union() {
    difference() {
        // top half (block)
        color("red") 
        translate([0,0,0])
         cube([40,40,10]);

        // Holder bed
        {
            // -x
            color("green")
            translate([1,20,0])
            rotate([0,90,0])
            linear_extrude(12,false)
             circle(6);
            
            // +x
            color("green")
            translate([27,20,0])
            rotate([0,90,0])
            linear_extrude(12,false)
             circle(6);
            
            // -y
            color("green")
            translate([20,1,0])
            rotate([-90,0,0])
            linear_extrude(12,false)
             circle(6);
            
            // +y
            color("green")
            translate([20,27,0])
            rotate([-90,0,0])
            linear_extrude(12,false)
             circle(6);
        }

        // Holder Neck
        {
            // -x
            translate([-1,20,0])
            rotate([0,90,0])
            linear_extrude(3)
             circle(3);
            
            // +x
            translate([38,20,0])
            rotate([0,90,0])
            linear_extrude(3)
             circle(3);
            
            // -y
            translate([20,-1,0])
            rotate([-90,0,0])
            linear_extrude(3)
             circle(3);
            
            // +y
            translate([20,38,0])
            rotate([-90,0,0])
            linear_extrude(3)
             circle(3);
        }
        
        // Hollowed-out space to save material
        {
            // middle
            translate([14,14,-1])
             cube([12,12,10]);
        
            // corner -x -y
            translate([1,1,-1])
             cube([12,12,10]);

            // corner +x -y
            translate([27,1,-1])
             cube([12,12,10]);

            // corner -x +y
            translate([1,27,-1])
             cube([12,12,10]);

            // corner +x +y
            translate([27,27,-1])
             cube([12,12,10]);
        }
    }

        union() {
        // Joint nails and beds
        {
            // nail -x -y
            translate([7,7,0]) {
                // support
                {
                    translate([-.5,-6,0])
                     cube([1,12,9]);
                    
                    translate([ -6, -.5, 0])
                     cube([12,1,9]);
                }
                // stick
                hull() {
                    translate([0,0,8])
                    linear_extrude(1)
                     circle(2);
                    translate([0,0,-5])
                     sphere(2);
                }
            }
            
            // nail +x +y
            translate([33,33,0]) {
                // support
                {
                    translate([-.5,-6,0])
                     cube([1,12,9]);
                    
                    translate([ -6, -.5, 0])
                     cube([12,1,9]);
                }
                // stick
                hull() {
                    translate([0,0,8])
                    linear_extrude(1)
                     circle(2);
                    translate([0,0,-5])
                     sphere(2);
                }
            }
            
            // nail bed +x -y
            translate([33, 7, 0]) {
                // support
                 {
                    translate([-.5,-6,0])
                     cube([1,3,9]);
                    translate([-.5,3,0])
                     cube([1,3,9]);
                    
                    translate([ -6, -.5, 0])
                     cube([3,1,9]);
                    translate([ 3, -.5, 0])
                     cube([3,1,9]);
                }
                // bed border
                linear_extrude(9)
                difference() {
                 circle(3.04);
                 circle(2.04);
                }
            }
            
            // nail bed -x +y
            translate([7, 33, 0]) {
                // support
                 {
                    translate([-.5,-6,0])
                    cube([1,3,9]);
                     translate([-.5,3,0])
                     cube([1,3,9]);
                    
                    translate([ -6, -.5, 0])
                    cube([3,1,9]);
                     translate([ 3, -.5, 0])
                    cube([3,1,9]);
                }
                // bed border
                linear_extrude(9)
                difference() {
                 circle(3.04);
                 circle(2.04);
                }
            }
        }
    }
}

// end of shape : main_body

// flying_half
// only for visual to describe the idea
// WON'T MAINTAIN in future versions due to duplicate code
rotate([0,0,0])
translate([-20,-20,20])
% union() {
    difference() {
        // top half (block) 
        translate([0,0,10])
        cube([40,40,10]);

        // Holder bed
        {
            // -x
            translate([1,20,10])
            rotate([0,90,0])
            linear_extrude(12,false)
             circle(6);
            
            // +x
            translate([27,20,10])
            rotate([0,90,0])
            linear_extrude(12,false)
             circle(6);
            
            // -y
            translate([20,1,10])
            rotate([-90,0,0])
            linear_extrude(12,false)
             circle(6);
            
            // +y
            translate([20,27,10])
            rotate([-90,0,0])
            linear_extrude(12,false)
             circle(6);
        }

        // Holder Neck
        {
            // -x
            translate([-1, 20, 10])
            rotate([0,90,0])
            linear_extrude(3)
             circle(3);
            
            // +x
            translate([38,20,10])
            rotate([0,90,0])
            linear_extrude(3)
             circle(3);
            
            // -y
            translate([20,-1,10])
            rotate([-90,0,0])
            linear_extrude(3)
             circle(3);
            
            // +y
            translate([20,38,10])
            rotate([-90,0,0])
            linear_extrude(3)
             circle(3);
        }
        
        // Hollowed-out to save material
        {
            // middle
            translate([14,14,9])
             cube([12,12,10]);
        
            // corner -x -y
            translate([1,1,9])
             cube([12,12,10]);

            // corner +x -y
            translate([27,1,9])
             cube([12,12,10]);

            // corner -x +y
            translate([1,27,9])
             cube([12,12,10]);

            // corner +x +y
            translate([27,27,9])
             cube([12,12,10]);
        }
    }

        union() {
        // Joint nails and beds
        {
            // nail -x -y
            translate([7,7,10]) {
                // support
                {
                    translate([-.5,-6,0])
                     cube([1,12,9]);
                    
                    translate([ -6, -.5, 0])
                     cube([12,1,9]);
                }
                // stick
                hull() {
                    translate([0,0,8])
                    linear_extrude(1)
                     circle(2);
                    translate([0,0,-5])
                     sphere(2);
                }
            }
            
            // nail +x +y
            translate([33,33,10]) {
                // support
                {
                    translate([-.5,-6,0])
                     cube([1,12,9]);
                    
                    translate([ -6, -.5, 0])
                     cube([12,1,9]);
                }
                // stick
                hull() {
                    translate([0,0,8])
                    linear_extrude(1)
                     circle(2);
                    translate([0,0,-5])
                     sphere(2);
                }
            }
            
            // nail bed +x -y
            translate([33, 7, 10]) {
                // support
                 {
                    translate([-.5,-6,0])
                     cube([1,3,9]);
                    translate([-.5,3,0])
                     cube([1,3,9]);
                    
                    translate([ -6, -.5, 0])
                     cube([3,1,9]);
                    translate([ 3, -.5, 0])
                     cube([3,1,9]);
                }
                // bed border
                linear_extrude(9)
                difference() {
                 circle(3.04);
                 circle(2.04);
                }
            }
            
            // nail bed -x +y
            translate([7, 33, 10]) {
                // support
                 {
                    translate([-.5,-6,0])
                     cube([1,3,9]);
                    translate([-.5,3,0])
                     cube([1,3,9]);
                    
                    translate([ -6, -.5, 0])
                     cube([3,1,9]);
                    translate([ 3, -.5, 0])
                     cube([3,1,9]);
                }
                // bed border
                linear_extrude(9)
                difference() {
                 circle(3.04);
                 circle(2.04);
                }
            }
        }
    }
}
// End Of Shape : flying_half
