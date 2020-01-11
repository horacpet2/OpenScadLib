/*
 * 1 - MGN12 rail
 * 2 - MGN12 carriage
 * 3 - complet
 */

MGN_12_object = 0;

/* internal settings */
MGN12_rail_length = 200;
MGN12_carriage_position = 154;

/* MGN12 rail constants */
MGN12_rail_width = 12;
MGN12_rail_height = 8;
MGN12_hole_distance = 25;
MGN12_hole_diameter = 3.5;
MGN12_recess_diameter = 6;
MGN12_hole_distance = 25;
MGN12_recess_heigth = 4.5;

/* MGN12 carriage constantc */
MGN12_carriage_width = 27;
MGN12_carriage_length = 45.4;
MGN12_carriage_height = 10;
MGN12_carriage_position_over_rail = 3;
MGN12_screw_hole_diameter = 3;
MGN12_screw_hole_height = 3.5;
MGN12_screw_position = [10,10];


module MGN12_rail(rail_length)
{
    color("silver")
    {
        difference()
        {
            translate([0,rail_length/2,0])cube([MGN12_rail_width,rail_length,MGN12_rail_height],center=true);

            for(i=[-1:2:1])
            {
                translate([MGN12_rail_width/2*i,rail_length/2,1.5])cube([3,rail_length+1,1],center=true);
            }
            
            for(i=[MGN12_hole_distance/2:MGN12_hole_distance:rail_length])
            {
                translate([0,i,0])cylinder(d=MGN12_hole_diameter,h=MGN12_rail_height+1,center=true,$fn=30);
                translate([0,i,MGN12_rail_height-MGN12_recess_heigth])cylinder(d=MGN12_recess_diameter, h=MGN12_rail_height,center=true,$fn=30);
            }
        }
    }
}

module MGN12_carriage()
{
    color("green")
    {
        difference()
        {
            cube([MGN12_carriage_width,MGN12_carriage_length,MGN12_carriage_height],center=true);
            translate([0,0,-MGN12_carriage_height/2-3+5])cube([MGN12_rail_width,MGN12_carriage_length+1,6],center=true);
            
            for(i=[-1:2:1])
            {
                for(j=[-1:2:1])
                {
                    translate([MGN12_screw_position[0]*i,MGN12_screw_position[1]*j,MGN12_carriage_height/2-MGN12_screw_hole_height])cylinder(d=MGN12_screw_hole_diameter,h=MGN12_screw_hole_height+1,$fn=20);
                }
            }
        }
        
        for(i=[-1:2:1])
        {
            translate([6*i,0,-MGN12_carriage_height/4])cube([2,MGN12_carriage_length,1],center=true);
        }
    }
}


module MGN12(length, position)
{
	translate([0,0,MGN12_rail_height/2])MGN12_rail(length);
    if(position < length-MGN12_carriage_length)
	translate([0,position+MGN12_carriage_length/2,MGN12_carriage_height/2+MGN12_carriage_position_over_rail])MGN12_carriage();
}


if(MGN_12_object == 0)
{
    
}
else if(MGN_12_object == 1)
{
    MGN12_rail(MGN12_rail_length); 
}
else if(MGN_12_object == 2)
{
    MGN12_carriage();
}
else if(MGN_12_object == 3)
{
   MGN12(MGN12_rail_length, MGN12_carriage_position); 
}
else
{
    echo("Wrong object index! No object shown!");
}
