
/*
 * 0 - default library state
 * 1 - opto endstop
 * 2 - optoswitch
 */

opto_endstop_object = 0;

/* optoswitch constants */
optoswitch_width = 24.5;
optoswitch_length = 6.4;
optoswitch_height = 3.5;

/* optoendstop constants */
optoendstop_pcb_width = 33.0;
optoendstop_pcb_length = 10.5;
optoendstop_pcb_thickness = 1.6;

optoendstop_connector_width = 5.8;
optoendstop_connector_lenght = 10.5;
optoendstop_connector_height = 7;

optoendstop_mount_hole_diameter = 3;
optoendstop_mount_hole_distance = optoswitch_width-(2*2.75);



module opto_endstop()
{
    difference()
    {
        union()
        {
            // base PCB
           color("gray") translate([0,optoendstop_pcb_thickness/2,0])cube([optoendstop_pcb_width,optoendstop_pcb_thickness,optoendstop_pcb_length],center=true);

           // connector            
           translate([-optoendstop_pcb_width/2+optoendstop_connector_width/2,-optoendstop_connector_height/2,0]) color("white") cube([optoendstop_connector_width,optoendstop_connector_height,optoendstop_connector_lenght],center=true);
            
           // led
           translate([-optoendstop_pcb_width/2+3.5,optoendstop_pcb_thickness+0.5,0]) color("red") cube([2,0.7,1.5],center=true);
        }
        
        translate([optoendstop_pcb_width/2-optoswitch_width/2,0,0]) 
        {
            for (hole = [-1:2:1])
            {
                 translate([optoendstop_mount_hole_distance/2*hole,0,0])rotate([90,0,0])cylinder(d=optoendstop_mount_hole_diameter, h=4.5,$fn=40,center=true);
            }
        }
    }
    
    // add the switch module
           translate([optoendstop_pcb_width/2-optoswitch_width/2,optoendstop_pcb_thickness+optoswitch_height/2,0]) optoswitch();
}

// switch module
module optoswitch() 
{
    difference()
    {
        union ()
        {
           color("black") cube([optoswitch_width,optoswitch_height,optoswitch_length],center=true);
           color("black")translate([(11.3/2-(4.45/2)),11.3/2-optoswitch_height/2,0]) cube([4.45,11.3,6.3],center=true);
           color("black")translate([-(11.3/2-4.45/2),11.3/2-optoswitch_height/2,0]) cube([4.45,11.3,6.3],center=true);
        }
        
        for (hole = [-1:2:1])
        {
 	rotate([90,0,0]) translate([optoendstop_mount_hole_distance/2*hole,0,0]) cylinder(d=optoendstop_mount_hole_diameter, h=4.5,$fn=40,center=true);
        }	
    }
}

if (opto_endstop_object == 0)
{
    
}
else if(opto_endstop_object == 1)
{
    rotate ([0,0,180]) opto_endstop();
}
else if(opto_endstop_object == 2)
{
    optoswitch();
}
else
{
    echo("Wrong object index! No object shown.");
}