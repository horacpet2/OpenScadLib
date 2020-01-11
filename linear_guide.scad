/*
 * 0 - default library state
 * 1 - part 1
 * 2 - part 2
 * 3 - part 3
 * 4 - part 4
 * 5 - complet
 */
linear_guide_object = 0;

linear_guide_width = 44;
linear_guide_height = 11.6;
linear_guide_length = 600;

max_length = 600;

/* part 1 constants */
part_1_length = linear_guide_length;
part_1_width = linear_guide_width;
part_1_height = linear_guide_height;

/* part 2 constants */
part_2_length = 582;
part_2_width = 35;
part_2_height = 10;

/* part 3 constants */
part_3_length = 275;
part_3_width = 27;
part_3_height = 8;

/* part 4 constants */
part_4_length = 598;
part_4_width = 24;
part_4_height = 7;

position = 600;


module linear_guide_part_1_mount_holes_M4()
{
    screw_diameter = 4.5;
    
    translate([0,part_1_length/2-35,0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,part_1_length/2-70,0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,part_1_length/2-135,0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,part_1_length/2-182,0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,part_1_length/2-198,0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,part_1_length/2-240,0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,part_1_length/2-284,0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,-(part_1_length/2-275),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,-(part_1_length/2-51),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,-(part_1_length/2-76),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,-(part_1_length/2-114),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,-(part_1_length/2-137),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,-(part_1_length/2-4-screw_diameter/2),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
}

module linear_guide_part_1_mount_holes_M6()
{
    screw_diameter = 6.25;
    
    translate([0,-(part_1_length/2-35),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,-(part_1_length/2-99),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,-(part_1_length/2-258),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,(part_1_length/2-85),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,(part_1_length/2-149),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,(part_1_length/2-85),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
    
    translate([0,(part_1_length/2-213),0])cylinder(d=screw_diameter,h=2*part_1_height,center=true,$fn=30);
}

module hole_shape()
{
    translate([0,0,0])
    {
        difference()
        {
            union()
            {
                hull()
                {
                    for(i=[-1:2:1])
                    {
                        translate([7*i,0,0])cylinder(d=5,h=part_1_height,center=true,$fn=30);
                        translate([7*i,1.5,0])cylinder(d=5,h=part_1_height,center=true,$fn=30);
                    }
                }
                
                hull()
                {
                    for(i=[-1:2:1])
                    {
                        translate([7+1,0,0])cylinder(d=3,h=part_1_height,center=true,$fn=20);
                        translate([(7+1),27,0])cylinder(d=3,h=part_1_height,center=true,$fn=30);
                    }
                }
                
                hull()
                {
                    for(i=[-1:2:1])
                    {
                        translate([-(7+1),0,0])cylinder(d=3,h=part_1_height,center=true,$fn=20);
                        translate([-(7+1),27,0])cylinder(d=3,h=part_1_height,center=true,$fn=30);
                    }
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([(7-2)*i,4,0])cylinder(d=3,h=part_1_height,center=true,$fn=30);
                }
            }
        }
    }
}

module linear_guide_part_1_holes()
{
    hull()
    {
        for(i=[-1:2:1])
        {
            translate([0,(part_1_length/2-35)+((4.5-2.25)*i),0])cylinder(d=4.5,h=2*part_1_height,center=true,$fn=10);
        }
    }
    
    hull()
    {
        for(i=[-1:2:1])
        {
            translate([0,-(part_1_length/2-137)+((4.5-2.25)*i),0])cylinder(d=4.5,h=2*part_1_height,center=true,$fn=30);
        }
    }
    
    hull()
    {
        for(i=[-1:2:1])
        {
            translate([0,-(part_1_length/2-114)+((4.5-2.25)*i),0])cylinder(d=4.5,h=2*part_1_height,center=true,$fn=30);
        }
    }
    
    hull()
    {
        for(i=[-1:2:1])
        {
            translate([0,-(part_1_length/2-76)+((4.5-2.25)*i),0])cylinder(d=4.5,h=2*part_1_height,center=true,$fn=30);
        }
    }
    
    hull()
    {
        for(i=[-1:2:1])
        {
            translate([0,-(part_1_length/2-51)+((4.5-2.25)*i),0])cylinder(d=4.5,h=2*part_1_height,center=true,$fn=30);
        }
    }
    
    hull()
    {
        for(i=[-1:2:1])
        {
            translate([0,(part_1_length/2-240)+((4.5-2.25)*i),0])cylinder(d=4.5,h=2*part_1_height,center=true,$fn=30);
        }
    }
    
    translate([0,part_1_length/2+0.25-4,0])cube([21,9,2*part_1_height],center=true);
    
    for(i=[-1:2:1])
    {
        translate([(21/2-1.5)*i,part_1_length/2-8,0])cylinder(d=3,h=2*part_1_height,center=true,$fn=30);
        
        translate([17*i,-(part_1_length/2-4-4.5/2),0])cube([6,4,part_1_height],center=true);
    }
    
    translate([0,part_1_length/2-96+2.5,0])hole_shape();
    
    translate([0,part_1_length/2-161+2.5,0])hole_shape();
    
    translate([0,part_1_length/2-225+2.5,0])hole_shape();
    
    translate([0,-(part_1_length/2-248-2.5),0])hole_shape();
    
    translate([0,-(part_1_length/2-88-2.5),0])hole_shape();
    
     translate([0,-(part_1_length/2-23-2.5),0])hole_shape();
}

module linear_guide_part_1()
{
    edge_radius = 2;
    wall_thickness = 1;
    
    color([0.3,0.3,0.3])
    {
        difference()
        {
            union()
            {
                hull()
                {
                    for(i=[-1:2:1])
                    {
                        translate([(part_1_width/2-edge_radius-1)*i,0,edge_radius])rotate([90,0,0])cylinder(r=edge_radius,h=part_1_length,$fn=edge_radius*10,center=true);
                        translate([(part_1_width/2-edge_radius-1)*i,0,part_1_height-edge_radius])rotate([90,0,0])cylinder(r=edge_radius,h=part_1_length,$fn=edge_radius*10,center=true);
                    }
                }
                for(i=[-1:2:1])
                {
                    translate([(part_1_width/2-edge_radius)*i,0,(part_1_height)/2])rotate([90,0,0])cylinder(r=edge_radius,h=part_1_length,$fn=edge_radius*10,center=true);
                }
            }
            
        
            translate([0,0,wall_thickness])
            {    
                scale([((part_1_width-2*wall_thickness)/part_1_width),1,((part_1_height-2*wall_thickness)/part_1_height)])
                {
                    union()
                    {
                        hull()
                        {
                            for(i=[-1:2:1])
                            {
                                translate([(part_1_width/2-edge_radius-1)*i,0,edge_radius])rotate([90,0,0])cylinder(r=edge_radius,h=part_1_length+1,$fn=edge_radius*10,center=true);
                                translate([(part_1_width/2-edge_radius-1)*i,0,part_1_height-edge_radius])rotate([90,0,0])cylinder(r=edge_radius,h=part_1_length+1,$fn=edge_radius*10,center=true);
                            }
                        }
                        for(i=[-1:2:1])
                        {
                            translate([(part_1_width/2-edge_radius)*i,0,(part_1_height)/2])rotate([90,0,0])cylinder(r=edge_radius,h=part_1_length+1,$fn=edge_radius*10,center=true);
                        }
                    }
                }
            }
            translate([0,0,part_1_height])cube([38,part_1_length+1,part_1_height],center=true);
            
            linear_guide_part_1_mount_holes_M4();
            linear_guide_part_1_holes();
            linear_guide_part_1_mount_holes_M6();
        }
        
        difference()
        {
            union()
            {
                translate([0,part_1_length/2-8,1.5])rotate([0,90,0])cylinder(d=3,h=15,$fn=50,center=true);
            
                translate([0,part_1_length/2-8+1.5-0.5,5.25])cube([15,1,8],center=true);
            }
            
            translate([0,part_1_length/2-8-1,2.5])rotate([0,90,0])cylinder(d=3.1,h=16,$fn=50,center=true);
        }
    }
    
    difference()
    {
        union()
        {
            color("black")translate([0,part_1_length/2-8+1,1.5])cylinder(d=8,h=8,$fn=50);
            for(i=[-1:2:1])
            {
                color("black")translate([i*5,part_1_length/2-8+1,1.5])cylinder(d=8,h=8,$fn=50);
            }
        }
        translate([0,part_1_length/2-8+1.5-0.5,5])cube([15,2,10],center=true);
        color("black")translate([0,part_1_length/2-8+1,1])cylinder(d=6.5,h=10,$fn=50);
    }
}

module linear_guide_part_2()
{
    color("gray")
    {
        difference()
        {
            difference()
            {
                hull()
                {
                    for(i=[-1:2:1])
                    {
                        translate([(part_2_width/2-1.5)*i,0,1.5])rotate([90,0,0])cylinder(d=3,h=part_2_length,$fn=30,center=true);
                        
                        translate([(part_2_width/2-1.5)*i,0,part_2_height-1.5])rotate([90,0,0])cylinder(d=3,h=part_2_length,$fn=30,center=true);
                    }
                }
                
                for(i=[-1:2:1])
                {
                    translate([(part_2_width+1)/2*i,0,part_2_height/2])rotate([90,0,0])cylinder(d=3,h=part_2_length+1,center=true,$fn=30);
                }
                
                hull()
                {
                    translate([0,0,0])cube([22,part_2_length+1,0.1],center=true);
                
                    translate([0,0,3])cube([13.5,part_2_length+1,0.1],center=true);
                }
            }
            
           translate([0,0,1])
           { 
                scale([(part_2_width-2)/part_2_width,1,(part_2_height-2)/part_2_height])
                {
                    difference()
                    {
                        hull()
                        {
                            for(i=[-1:2:1])
                            {
                                translate([(part_2_width/2-1.5)*i,0,1.5])rotate([90,0,0])cylinder(d=3,h=part_2_length+1,$fn=30,center=true);
                                
                                translate([(part_2_width/2-1.5)*i,0,part_2_height-1.5])rotate([90,0,0])cylinder(d=3,h=part_2_length+1,$fn=30,center=true);
                            }
                        }
                        
                        for(i=[-1:2:1])
                        {
                            translate([(part_2_width+4)/2*i,0,part_2_height/2])rotate([90,0,0])cylinder(d=6,h=part_2_length+2,center=true,$fn=35);
                        }
                
                        hull()
                        {
                            translate([0,0,0])cube([24,part_2_length+2,0.1],center=true);
                        
                            translate([0,0,3.5])cube([16,part_2_length+2,0.1],center=true);
                        }
                    }
                }
            }
            
            translate([0,0,part_2_height])cube([29.5,part_2_length+1,part_2_height],center=true);
            
            
            translate([0,(-part_2_length/2+25/2+11/2+10),0])
            {
                hull()
                {
                    for(i=[-1:2:1])
                    {
                        translate([0,25/2*i,0])cylinder(d=11,h=part_2_height,$center=true);
                    }
                }
            }
            
            translate([0,(-part_2_length/2+25/2+11/2+272),0])
            {
                hull()
                {
                    for(i=[-1:2:1])
                    {
                        translate([0,25/2*i,0])cylinder(d=11,h=part_2_height,$center=true);
                    }
                }
            }
            
            translate([0,(part_2_length/2-25/2-11/2-25),0])
            {
                hull()
                {
                    for(i=[-1:2:1])
                    {
                        translate([0,25/2*i,0])cylinder(d=11,h=part_2_height,$center=true);
                    }
                }
            }
        }
    }
}

module linear_guide_part_3()
{
    color("silver")
    {
        difference()
        {
            
            translate([0,0,part_3_height/2])cube([part_3_width,part_3_length,part_3_height],center=true);
        
            hull()
            {
                translate([0,0,3])cube([16,part_3_length+1,0.1],center=true);
                translate([0,0,0])cube([20,part_3_length+1,0.1],center=true);
            }
         
            translate([0,0,1])
            {
                difference()
                {
                    translate([0,0,part_3_height/2])cube([part_3_width-1.5,part_3_length+1,part_3_height],center=true);
                    
                    hull()
                    {
                        translate([0,0,3])cube([16.5,part_3_length+2,0.1],center=true);
                        translate([0,0,0])cube([20.5,part_3_length+2,0.1],center=true);
                    }
                }
            }
         
            for(k=[-part_3_length/2+4.5+15/2:15+10:part_3_length/2])
            {
                translate([0,k,0])
                {
                    hull()
                    {
                         for(i=[-1:2:1])
                         {
                             for(j=[-1:2:1])
                             {
                                translate([(11/2-0.5)*j,(15/2-0.5)*i,0])cylinder(d=1,h=part_3_height,$fn=10);
                             }
                         }
                    }
                }
            }
            
            for(i=[-part_3_length/2-0.5:5+15+5:part_3_length/2+25])
            {
                translate([0,i,0])cylinder(d=4,h=part_3_height,$fn=30);
            }
            
            for(i=[-part_3_length/2+23:23:part_3_length/2])
            {    
                translate([0,i,0])
                {
                    for(j=[-1:2:1])
                    {
                        translate([(part_3_width/2-0.5)*j,0,0])rotate([0,0,0])cylinder(d=2,h=part_3_height*3,$fn=15,center=true);
                    }
                }
            }
            
            for(i=[-part_3_length/2-1:11.5:part_3_length/2+10])
            {    
                translate([0,i,0])
                {
                    hull()
                    {
                        translate([(part_3_width/2-0.5),0,part_3_height])rotate([0,90,0])cylinder(d=2,h=part_3_width*2,$fn=15,center=true);
                            
                            translate([(part_3_width/2-0.5),1,part_3_height-1.5])rotate([0,90,0])cylinder(d=2,h=part_3_width*2,$fn=15,center=true);
                            
                        if(i==-part_3_length/2-1)
                        {
                            translate([(part_3_width/2-0.5),1.5,part_3_height])rotate([0,90,0])cylinder(d=2,h=part_3_width*2,$fn=15,center=true);
                        }
                        else if(i>= part_3_length/2)
                        {
                            translate([(part_3_width/2-0.5),-1,part_3_height])rotate([0,90,0])cylinder(d=2,h=part_3_width*2,$fn=15,center=true);
                        }
                        else
                        {
                            translate([(part_3_width/2-0.5),2,part_3_height])rotate([0,90,0])cylinder(d=2,h=part_3_width*2,$fn=15,center=true);
                        }
                    }
                }
            }
        }
        
        for(i=[-part_3_length/2+12.5/2+2+3:23:part_3_length/2])
       {
           translate([0,i,0])
           {
               for(j=[-1:2:1])
               {
                   for(k=[-1:2:1])
                   {
                    translate([(part_3_width/2-1)*k,12.5/2*j,5])rotate([0,90,0])sphere(d=4,$fn=40);
                   }
               }    
           }
       } 
    }
}


module part_4_M4_mount_holes(height)
{
    translate([0,part_4_length/2-13,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,part_4_length/2-23,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,part_4_length/2-37,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,part_4_length/2-136,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,part_4_length/2-146,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,part_4_length/2-161,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,part_4_length/2-202,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+19,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+35,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+44,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+146,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+163,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+211,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+227,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+172,0])cylinder(d=4.5,h=height,center=true,$fn=30);
    
    translate([0,-part_4_length/2+236,0])cylinder(d=4.5,h=height,center=true,$fn=30);
}

module linear_guide_part_4()
{
    color([0.45,0.45,0.4])
    {
        difference()
        {
            difference()
            {
                hull()
                {
                    for(j=[-1:2:1])
                    {
                        for(i=[-1:2:1])
                        {
                            translate([(part_4_width/2-1)*i,(part_4_length/2-1)*j,0])cylinder(d=2,h=2,$fn=20);
                        }
                    }
                    
                    for(j=[-1:2:1])
                    {
                        for(i=[-1:2:1])
                        {
                            translate([(part_4_width/2-1)*i,(part_4_length/2-1)*j,part_4_height-1])sphere(d=2,$fn=20);  
                        }
                    }
                } 
                for(i=[-1:2:1])
                {
                    translate([(part_4_width/2+0.5)*i,0,part_4_height/2+2])scale([1,1,1.5])rotate([90,0,0])cylinder(d=2,h=part_4_length+1,center=true,$fn=30);
                }
            } 
           
           
            translate([0,1,-1])
            {
                scale([(part_4_width-2)/part_4_width,(part_4_length-1)/part_4_length,1]) 
                {
                    difference()
                    {
                        hull()
                        {
                            for(j=[-1:2:1])
                            {
                                for(i=[-1:2:1])
                                {
                                    translate([(part_4_width/2-1)*i,(part_4_length/2-1)*j,0])cylinder(d=2,h=2,$fn=20);
                                }
                            }
                            
                            for(j=[-1:2:1])
                            {
                                for(i=[-1:2:1])
                                {
                                    translate([(part_4_width/2-1)*i,(part_4_length/2-1)*j,part_4_height-1])sphere(d=2,$fn=20);  
                                }
                            }
                        }
                        for(i=[-1:2:1])
                        {
                            translate([(part_4_width/2+0.5)*i,0,part_4_height/2+2])scale([1,1,1.5])rotate([90,0,0])cylinder(d=2,h=part_4_length+2,center=true,$fn=30);
                        }  
                    }
                }
            }
            
            hull()
            {
                translate([0,part_4_length/2-8,0])cube([13,0.1,part_4_height*3],center=true);
                
                translate([0,part_4_length/2,0])cube([16,0.1,part_4_height*3],center=true);
            }
            
            part_4_M4_mount_holes(part_4_height*3);
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([(9.5/2-2.75)*i,part_4_length/2-23,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([0,(part_4_length/2-37)+(9.5/2-2.75)*i,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([(9.5/2-2.75)*i,part_4_length/2-146,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([0,(-part_4_length/2+211)+(9.5/2-2.75)*i,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([0,(part_4_length/2-161)+(9.5/2-2.75)*i,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([(9.5/2-2.75)*i,-part_4_length/2+227,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([(9.5/2-2.75)*i,-part_4_length/2+163,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([0,(-part_4_length/2+146)+(9.5/2-2.75)*i,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([0,(-part_4_length/2+19)+(9.5/2-2.75)*i,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
            
            hull()
            {
                for(i=[-1:2:1])
                {
                    translate([(9.5/2-2.75)*i,-part_4_length/2+35,0])cylinder(d=4.5,h=part_4_height*3,center=true,$fn=30);
                }
            }
        }
    }
}

module linear_guide(position)
{
    if(position >= 0 && position <= max_length)
    {
        rotate([0,0,180])linear_guide_part_1();
        translate([0,position/2,2])linear_guide_part_2();
        translate([0,(position/2+position/4)-5,4])linear_guide_part_3();
        translate([0,(position/2+position/4+position/4),part_1_height-part_4_height])rotate([0,0,180])linear_guide_part_4();
    }
    else
    {
        echo("Wrong position value! Allowed value is between 0 and 600.");
    }
}

if(linear_guide_object == 0)
{
    
}
else if(linear_guide_object == 1)
{
    linear_guide_part_1();
}
else if(linear_guide_object == 2)
{
    linear_guide_part_2();
}
else if(linear_guide_object == 3)
{
    linear_guide_part_3();
}
else if(linear_guide_object == 4)
{
    linear_guide_part_4();
}
else if(linear_guide_object == 5)
{
    linear_guide(position);
}
else
{
    echo("Wrong object index! No object shown.");
}
