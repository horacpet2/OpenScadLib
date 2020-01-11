
/*
 * 0 - default state of library
 * 1 - empty filament spool
 * 2 - full filament spool
 */

filament_spool_object = 0;

filament_diameter = 1.75;
filament_spool_diameter_external = 200;
filament_spool_diameter_internal = 110;
filament_spool_hole_diameter = 50;
filament_spool_width = 88;

module filament_spool_empty()
{
    color([0.3,0.3,0.3])
    {
        difference()
        {
            union()
            {
                for(i=[0:1:1])
                {
                    translate([0,0,i*(filament_spool_width-4)])
                    cylinder(d=filament_spool_diameter_external,h=4,$fn=200);
                }
                
                cylinder(d=filament_spool_diameter_internal, h=filament_spool_width,$fn=100);
            }
            
            translate([0,0,-1])cylinder(d=filament_spool_hole_diameter, h=filament_spool_width+2,$fn=100);
            
            for(i=[-1:2:1])
            {
                translate([0,40*i,-1])cylinder(d=14,h=filament_spool_width+2,$fn=70);
            }
            
            for(i=[0:90:270])
            {
                rotate([0,0,i])translate([0,116/2,filament_spool_width/2])cube([11,6,filament_spool_width+2],center=true);
            }
        }
    }
}


module filament_spool_full()
{
    filament_spool_empty();
    
    color("orange")
    {
        for(i=[4+filament_diameter/2: filament_diameter:filament_spool_width-4])
        {
            translate([0,0,i])
            {
                rotate_extrude(convexity = 10, $fn= 70)translate([filament_spool_diameter_external/2-10, 0, 0])circle(d = filament_diameter,$fn=20);
            }
        }
    }
}


if(filament_spool_object == 0)
{
    
}
else if(filament_spool_object == 1)
{
    filament_spool_empty();
}
else if(filament_spool_object == 2)
{
    filament_spool_full();
}