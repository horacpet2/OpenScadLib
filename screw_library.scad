/*
 * 0 - default library state
 * 1 - countersunk head screw
 */
screw_lib_object = 0;

/***** screw parameters *****/

/*
 * 1 - cross 
 */
head_type = 1;

head_shape = 1;


/* diameter, length, head_diameter, haed_height, head_diameter, screw_height*/

M8x16=[8,16,4,14.5,0.6]; 


module countersunk_head_screw(parameters,head_type, screw_shape)
{
    translate([0,0,parameters[4]])cylinder(d=parameters[0], h=parameters[1]-parameters[4],$fn=10*parameters[0]);
    cylinder(d1=parameters[0]-2*parameters[4],d2=parameters[0],h=parameters[4],$fn=parameters[0]*10);
    
    hull()
    {
        translate([0,0,parameters[1]-parameters[2]])cylinder(d=parameters[0],h=0.01,$fn=10*parameters[0]);
    
        translate([0,0,parameters[1]-0.1])cylinder(d=parameters[3],h=0.2,$fn=10*parameters[0]);
    }
    
}

if(screw_lib_object == 0)
{
    countersunk_head_screw(M8x16);
}
else
{
    echo("Wrong object index! No object shown.");
}