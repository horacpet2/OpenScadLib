/*
 * 0 - default library state
 * 1 - belt driver
 * 2 - belt idler
 */

GT2_object = 0;


belt_driver_d_1= 5;
belt_driver_d_2 = 12;
belt_driver_d_3 = 16;
belt_driver_hight_1 = 7.5;
belt_driver_hight_2 = 16;

belt_idler_d_1 = 5;
belt_idler_d_2 = 12;
belt_idler_d_3 = 18;
belt_idler_hight = 13;


module belt_driver_20_teeth()
{
    color("gray")
    {
        difference()
        {
            union()
            {
                cylinder(d=belt_driver_d_2,h=belt_driver_hight_2,center=true,$fn=70);
                translate([0,0,-((belt_driver_hight_2/2)-(belt_driver_hight_1-1.5)/2)])cylinder(d=belt_driver_d_3,h=belt_driver_hight_1,center=true,$fn=100);
                translate([0,0,belt_driver_hight_2/2-0.75])cylinder(d=belt_driver_d_3,h=1.5,center=true, $fn =100);
            }
            
            cylinder(d=belt_driver_d_1,h=belt_driver_hight_2+2,center=true,$fn=40);
        }
    }
}

module belt_idler()
{
    color("gray")
    {
        difference()
        {
            union()
            {
                cylinder(d=belt_idler_d_2,h=belt_idler_hight,center=true,$fn=70);
                
                for(i=[-1:2:1])
                {
                    translate([0,0,(belt_idler_hight/2-0.75)*i])cylinder(d=belt_idler_d_3,h=1.5,center=true,$fn=100);
                }
            }
            cylinder(d=belt_idler_d_1,h=belt_idler_hight+1,center=true,$fn=40);
        }
    }
}

if(GT2_object == 0)
{
    
}
else if(GT2_object == 1)
{
    belt_driver_20_teeth();
}
else if(GT2_object == 2)
{
    belt_idler();
}
else 
{
    echo("Wrong object index! No object shown.");
}