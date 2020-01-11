
/*
 * 0 - default library state
 * 1 - Al profile alutec base parametrizable model
 * 2 - Al profile kombistojka
 * 3 - rohova spojka
 */
Al_profil_alutech_object = 0;

/* AlProfil alutec 30x30 constants */
Al_profile_alutec_30x30_edge_radius = 1;
Al_profile_alutec_30x30_width = 30;
Al_profile_alutec_30x30_length = Al_profile_alutec_30x30_width;
Al_profile_alutec_30x30_groove_height = 8;
Al_profile_alutec_30x30_groove_width_1 =6.2;
Al_profile_alutec_30x30_hole_diameter = 5.5;
Al_profile_alutec_30x30_nut_width = 10.2;
Al_profile_alutec_30x30_nut_edge_radius = 3;
Al_profile_alutec_30x30_center_width = 9;
Al_profile_alutec_30x30_center_length = 9;
Al_profile_alutec_30x30_light_hole_width = 6.5;
Al_profile_alutec_30x30_light_hole_length = 6.5;

module Al_profil_alutec_30x30(profile_edge_radius, width,length,groove_height,groove_width,height, hole_diameter,nut_width, nut_edge_radius,center_width,center_height,light_hole_width, light_hole_length)
{
    color("gray")
    {
        translate([0,0,height/2])
        {
            difference()
            {
		hull()
		{
			for(i=[-1:2:1])
			{
				for(j=[-1:2:1])
				{	
					translate([(width/2-profile_edge_radius)*i,(length/2-profile_edge_radius)*j,0])cylinder(r=profile_edge_radius,h=height,center=true, $fn=10*profile_edge_radius);
				}
			}
		}
                //cube([width,length,height],center=true);
                
               
                cylinder(d=hole_diameter,h=height+1, $fn=20, center=true);
                
		for(i=[0:90:270])
                {
                    rotate([0,0,i])translate([0,length/2-groove_height/2+0.1,0])cube([groove_width,groove_height,height+1],center=true);
                    rotate([0,0,i])translate([width/2-light_hole_width/2-1.5,length/2-light_hole_length/2-1.5,0])cube([light_hole_width,light_hole_length,height+1],center=true);
                    hull()
                    {
                        rotate([0,0,i])translate([0,length/2-groove_height/2+0.1-(2.5/2)+1.5,0])cube([10.5,groove_height-2.5-3,height+1],center=true);
                     	for(j=[-1:2:1])
			{   
                        	rotate([0,0,i])translate([(nut_width/2-nut_edge_radius)*j,center_width/2+nut_edge_radius,0])cylinder(r=nut_edge_radius,h=height+1,center=true,$fn=20);
			}
                    }
                }
            }
        }
    }
}


module Al_profil_corner_coupler()
{
    color([0.2,0.2,0.2])
    {
        difference()
        {
            hull()
            {
                translate([(Al_profile_alutec_30x30_width-2)/2,0,2])cube([Al_profile_alutec_30x30_width-2,Al_profile_alutec_30x30_width-2,4],center=true);
            
                translate([2,0,(Al_profile_alutec_30x30_width-2)/2])cube([4,Al_profile_alutec_30x30_width-2,Al_profile_alutec_30x30_width-2],center=true);
            }
            
            hull()
            {
                translate([(Al_profile_alutec_30x30_width-2)/2+4,0,2+4])cube([Al_profile_alutec_30x30_width-2,Al_profile_alutec_30x30_width-2-6,4],center=true);
            
                translate([2+4,0,(Al_profile_alutec_30x30_width-2)/2+4])cube([4,Al_profile_alutec_30x30_width-2-6,Al_profile_alutec_30x30_width-2],center=true);
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                     translate([Al_profile_alutec_30x30_width/2+(12/2-3.5)*i,0,0])cylinder(d=7,h=20,center=true, $fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                     translate([0,0,Al_profile_alutec_30x30_width/2+(12/2-3.5)*i])rotate([0,90,0])cylinder(d=7,h=20,center=true, $fn=30);
                }
            }
        }
    }
}

if (Al_profil_alutech_object == 0)
{

}
else if(Al_profil_alutech_object == 1)
{
	Al_profil_alutec_30x30(Al_profile_alutec_30x30_edge_radius, Al_profile_alutec_30x30_width, Al_profile_alutec_30x30_length,Al_profile_alutec_30x30_groove_height,Al_profile_alutec_30x30_groove_width_1,200,Al_profile_alutec_30x30_hole_diameter,Al_profile_alutec_30x30_nut_width,Al_profile_alutec_30x30_nut_edge_radius,Al_profile_alutec_30x30_center_width, Al_profile_alutec_30x30_center_length,Al_profile_alutec_30x30_light_hole_width,Al_profile_alutec_30x30_light_hole_length);
}
else if(Al_profil_alutech_object == 2)
{

}
else if(Al_profil_alutech_object == 3)
{
    Al_profil_corner_coupler();
}
else
{
	echo("Wrong object index! No object shown.");
}

