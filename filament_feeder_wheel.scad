feeder_height = 13;
feeder_hole = 5;
feeder_diamenter = 9;
feeder_jaw_diameter = 8;


module filament_feeder_wheel()
{
    difference()
    {
        cylinder(d=feeder_diamenter,h=feeder_height,$fn=70);
        
        translate([0,0,-feeder_height/2])cylinder(d=feeder_hole,h=2*feeder_height, $fn=50);
        
        translate([0,0,feeder_height/3*2])
        {
            scale([1,1,1.4])
            {
                rotate_extrude(convexity = 10, $fn = 100)
                {
                    translate([feeder_diamenter/2+1.5-(feeder_diamenter-feeder_jaw_diameter)/2, 0, 0])circle(d = 3 , $fn = 100);
                }
            }
        }
        
        translate([0,0,3])rotate([90,0,0])cylinder(d=3,h=feeder_diamenter/2, $fn = 30);
    }
}

//filament_feeder_wheel();
