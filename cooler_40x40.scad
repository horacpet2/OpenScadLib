cooler_width = 40;
cooler_length = 40;
cooler_height = 10;
cooler_edge_radius = 3;

cooler_screw_position = 32/2;
cooler_screw_diameter = 3;

module cooler_40x40()
{
    color("black")
    {
        difference()
        {
            hull()
            {
                for(i=[0:90:270])
                {
                    rotate([0,0,i])translate([cooler_width/2-cooler_edge_radius,cooler_length/2-cooler_edge_radius,0])cylinder(r=cooler_edge_radius, h=cooler_height,center=true, $fn = 30);
                }
            }
            
            for(i=[0:90:270])
            {
                rotate([0,0,i])translate([cooler_screw_position,cooler_screw_position,0])cylinder(d=cooler_screw_diameter, h=cooler_height*2,center=true, $fn = 30);
            }
            
            cylinder(d=38, h=cooler_height*2,center=true,$fn=100);
        }
        
        cylinder(d=25, h=cooler_height,center=true,$fn=100);
    }
    
}

cooler_40x40();