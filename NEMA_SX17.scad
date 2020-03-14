$fn=50;


SX17_get_mount_width = 50;
NX17_mount_wall_thick = 3;
NX17_mount_bottom_length = 53;
NX17_mount_top_length = 51;
NX17_mount_crew_hole_diameter = 3.5;
NX17_mount_motor_hole_diameter = 22;
NX17_mount_bottom_hole_diameter = 4;
NX17_mount_bottom_hole_length = 30;
NX17_mount_bottom_hole_distance = 30;
NX17_mount_motor_position = 30;



/*
** 0 - width
** 1 - height
** 2 - mount screw diameter
** 3 - mount screw position
** 4 - mount screw hight
** 5 - shaft hight
** 6 - shaft diameter
** 7 - rim diameter
*/
nema17_1003Params = [42.3, 29.5, 3, 31/2, 10, 5, 20, 22];
nema17_1005Params = [42.3, 40, 3, 31/2, 10, 5, 20, 22];




function SX17_get_width(self)=self[0];
function SX17_get_height(self)=self[1];
function SX17_get_mount_screw_diameter(self)=self[2];
function SX17_get_mount_screw_position(self)=self[3];
function SX17_get_mount_screw_hight(self)=self[4];
function SX17_get_shaft_diameter(self)=self[5];
function SX17_get_shaft_height(self)=self[6];
function SX17_get_rim_diameter(self)=self[7];


module SX17_body(self)
{
    color("gray")
    {
        translate([0,0,5])
        {
            intersection()
            {
                cube([SX17_get_width(self),SX17_get_width(self),10],center=true);
                cylinder(r=sqrt(2*pow(SX17_get_width(self)/2,2))-3,h=10,center=true);
            }
        }
    }
    
    color("black")
    {
        translate([0,0,-(SX17_get_height(self)-20)/2])
        {
            intersection()
            {
                cube([SX17_get_width(self),SX17_get_width(self),SX17_get_height(self)-20],center=true);
                
                cylinder(r=sqrt(2*pow(SX17_get_width(self)/2,2))-4,h=SX17_get_height(self)-20,center=true);
            }
        }
    }
    
    color("gray")
    {
        translate([0,0,-SX17_get_height(self)+15])
        {
            intersection()
            {
                cube([SX17_get_width(self),SX17_get_width(self),10],center=true);
                
                cylinder(r=sqrt(2*pow(SX17_get_width(self)/2,2))-3,h=10,center=true);
            }
        }
    }
}

module SX17_shaft(self)
{
    color([0.35,0.35,0.35])
    {
        translate([0,0,10.5])cylinder(d=SX17_get_rim_diameter(self),h=1,center=true,$fn=70);
        
        difference([0,0,0])
        {
            translate([0,0,11])
                cylinder(d=SX17_get_shaft_diameter(self),h=SX17_get_shaft_height(self),$fn=30);
            
            translate([SX17_get_shaft_diameter(self)/1.5,0,11+SX17_get_shaft_height(self)/2+1.6])
                cube([SX17_get_shaft_diameter(self),SX17_get_shaft_diameter(self),SX17_get_shaft_height(self)-3],center=true);
        }
    }  
}

module SX17_screw_holes(self)
{
    for(i=[0:90:360])
    {
        rotate([0,0,i])
        {
            translate([SX17_get_mount_screw_position(self),SX17_get_mount_screw_position(self),5.5])
                cylinder(d=SX17_get_mount_screw_diameter(self),h=SX17_get_mount_screw_hight(self),center=true,$fn=30);
        }
    }
}

module SX17(self)
{
    difference()
    {
        SX17_body(self);
        
        SX17_screw_holes(self);
    }
    
    SX17_shaft(self);
}




module SX17_mount()
{
    color("gray")
    {
        difference()
        {
            intersection()
            {
                union()
                {
                    translate([0,-2.5/2, NX17_mount_wall_thick/2])
                        cube([SX17_get_mount_width, NX17_mount_bottom_length-2.5, NX17_mount_wall_thick],center=true);  
               
                    translate([0,NX17_mount_bottom_length/2-NX17_mount_wall_thick/2,NX17_mount_top_length/2+2.5/2])
                        cube([SX17_get_mount_width,NX17_mount_wall_thick,NX17_mount_top_length-2.5],center=true);
                   
                   
                    
                   translate([0,NX17_mount_bottom_length/2-2.5,2.5])
                   {
                        rotate([0,90,0])
                            cylinder(d=5,h=SX17_get_mount_width,center=true); 
                   }
                }
                
                union()
                {
                    translate([0,3,0])
                        cylinder(d=70,h=10,center=true);
                    
                    translate([0,NX17_mount_bottom_length/2,NX17_mount_top_length/2-3])
                    {
                        rotate([90,0,0])
                            cylinder(d=70,h=10,center=true);
                    }
                }
            }
            
            translate([0,NX17_mount_bottom_length/2-2.5-3,2.5+3])
            {
                rotate([0,90,0])
                    cylinder(d=5,h=SX17_get_mount_width+1,center=true); 
            }
            
            for(j=[-1:2:1])
            {
                translate([NX17_mount_bottom_hole_distance/2*j,0,0])
                {
                    hull()
                    {
                        for(i=[-1:2:1])
                        {
                            translate([0,NX17_mount_bottom_hole_length/2*i,0])
                                cylinder(d=NX17_mount_bottom_hole_diameter, h=10,center=true);
                        }
                    }
                }
            }
            
            translate([0,0,NX17_mount_motor_position])
            {
                for(i=[0:90:270])
                {
                    rotate([0,i,0])
                    {
                        translate([SX17_get_mount_screw_position(self),NX17_mount_bottom_length/2,SX17_get_mount_screw_position(self)])
                        {
                            rotate([90,0,0])
                                cylinder(d=NX17_mount_crew_hole_diameter, h = 10,center=true);
                        }
                    }
                }
                
                translate([0,NX17_mount_bottom_length/2,0])
                {
                    rotate([90,0,0])
                        cylinder(d=NX17_mount_motor_hole_diameter, h = 10,center=true);
                }
            }
        }
        
        for(i=[-1:2:1])
        {
            translate([(SX17_get_mount_width/2-1)*i,0,0])
            {
                hull()
                {
                    translate([0,NX17_mount_bottom_length/2-17/2,-0.5+3])
                        cube([2,17,1],center=true);
        
                    translate([0,NX17_mount_bottom_length/2-0.5,20/2+3])
                        cube([2,1,20],center=true);
                }
            }
        }
    }
}

//SX17_mount();

//*
//SX17(nema17_1003Params);
//SX17_body(nema17_1003Params);
//*/