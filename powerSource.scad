powerSourceWidth = 110;
powerSourceLength = 200;
powerSourceHeight = 50;

powerSourceCoolingHole = 4.5;
powerSourceCoolingHoleGap = 1.8;
powerSourceWallThick = 1.5;


module powerSourceHoleBottom(height)
{
    
    translate([-powerSourceWidth/2+85/2+10,powerSourceLength/2-61,-powerSourceHeight/2])
    {
        for(i=[-1:2:1])
        {
            translate([-85/2*i,0,0])cylinder(d=3.5,h=height,center=true,$fn=30);
        }
    }
    
    translate([-powerSourceWidth/2+85/2+10,powerSourceLength/2-187,-powerSourceHeight/2])
    {
        for(i=[-1:2:1])
        {
            translate([-85/2*i,0,0])cylinder(d=3.5,h=height,center=true,$fn=30);
        }
    }
}

module powerSource()
{
    color("silver")
    {
        difference()
        {
            cube([powerSourceWidth,powerSourceLength,powerSourceHeight],center=true);
            translate([0,-(12-5)/2,0])cube([powerSourceWidth-2*powerSourceWallThick,powerSourceLength-2*powerSourceWallThick-12-5,powerSourceHeight-2*powerSourceWallThick],center=true);
          
            translate([-0.8,powerSourceLength/2-5.9,powerSourceWallThick])cube([powerSourceWidth-powerSourceWallThick,12,powerSourceHeight-0.8],center=true);
            
            translate([-0.8,-powerSourceLength/2+2.4,5.1])cube([powerSourceWidth-powerSourceWallThick,5,powerSourceHeight-10],center=true);
            
            raw1 = (powerSourceLength-powerSourceCoolingHole*8)/powerSourceCoolingHole;
            /* cooling holes on the top */
            for(j = [0: 1:raw1])
            {
                for(i = [0:powerSourceCoolingHole +powerSourceCoolingHoleGap:powerSourceWidth-(powerSourceCoolingHole*4)])
                {  
                    if(j%2 == 0)
                    {  
                        translate([i-powerSourceWidth/2+powerSourceCoolingHole,(j*powerSourceCoolingHole)-powerSourceLength/2+powerSourceCoolingHole*3,powerSourceHeight/4+1])cylinder(d=powerSourceCoolingHole,h=powerSourceHeight/2,center=true,$fn=15);
                    }
                    else
                    {
                         translate([i-powerSourceWidth/2+powerSourceCoolingHole+(powerSourceCoolingHole+powerSourceCoolingHoleGap)/2,(j*powerSourceCoolingHole)-powerSourceLength/2+powerSourceCoolingHole*3,powerSourceHeight/4+1])cylinder(d=powerSourceCoolingHole,h=powerSourceHeight/2,center=true,$fn=15);
                    }     
                }
            }
            
            /* cooling holes on the side */
             raw2 = (powerSourceLength-powerSourceCoolingHole*8)/powerSourceCoolingHole;
            for(j = [0:1:raw2])
            {
                 for(i=[powerSourceCoolingHole+powerSourceCoolingHoleGap:powerSourceCoolingHole+powerSourceCoolingHoleGap:4*(powerSourceCoolingHole+powerSourceCoolingHoleGap)])
                 {
                     if(j%2 == 0)
                     {
                        translate([-powerSourceWidth/2,(j*powerSourceCoolingHole)-powerSourceLength/2+powerSourceCoolingHole*3,i-powerSourceCoolingHole])rotate([0,90,0])cylinder(d=powerSourceCoolingHole,h=powerSourceHeight/2,center=true,$fn=15); 
                     }
                     else
                     {
                          translate([-powerSourceWidth/2,(j*powerSourceCoolingHole)-powerSourceLength/2+powerSourceCoolingHole*3,i-(powerSourceCoolingHole+powerSourceCoolingHoleGap)/2-powerSourceCoolingHole])rotate([0,90,0])cylinder(d=powerSourceCoolingHole,h=powerSourceHeight/2,center=true,$fn=15); 
                     }
                 }
            }
            
            translate([-powerSourceWidth/2+6.4,-powerSourceLength/2+2.4,-powerSourceHeight/2+powerSourceWallThick+5])cube([13,5.1,10],center=true);
            
            translate([-powerSourceWidth/2,-(powerSourceLength/2-90-8),-powerSourceHeight/2+11+4])cube([3*powerSourceWallThick,16,8],center=true);
            
            
            /* screw holes */
            hull()
            {
                translate([-powerSourceWidth/2+5+3.5/2,-powerSourceLength/2,-powerSourceHeight/2+powerSourceWallThick])cylinder(d=3.5,h=3*powerSourceWallThick,center=true, $fn=30);
                translate([-powerSourceWidth/2+5+3.5/2,-powerSourceLength/2+6-3.5,-powerSourceHeight/2+powerSourceWallThick])cylinder(d=3.5,h=3*powerSourceWallThick,center=true, $fn=30);
            }
            
            hull()
            {
                translate([powerSourceWidth/2-powerSourceWallThick,-powerSourceLength/2,-powerSourceHeight/2+21+3.5/2])rotate([0,90,0])cylinder(d=3.5,h=3*powerSourceWallThick,center=true, $fn=30);
                translate([powerSourceWidth/2-powerSourceWallThick,-powerSourceLength/2+6-3.5,-powerSourceHeight/2+21+3.5/2])rotate([0,90,0])cylinder(d=3.5,h=3*powerSourceWallThick,center=true, $fn=30);
            }
            
            hull()
            {
                translate([powerSourceWidth/2-powerSourceWallThick,-powerSourceLength/2,powerSourceHeight/2-4-3.5/2])rotate([0,90,0])cylinder(d=3.5,h=3*powerSourceWallThick,center=true, $fn=30);
                translate([powerSourceWidth/2-powerSourceWallThick,-powerSourceLength/2+6-3.5,powerSourceHeight/2-4-3.5/2])rotate([0,90,0])cylinder(d=3.5,h=3*powerSourceWallThick,center=true, $fn=30);
            }
            
            translate([powerSourceWidth/2,powerSourceLength/2-4.3-1.5,powerSourceHeight/2-5-1.5])rotate([0,90,0])cylinder(d=3,h=3*powerSourceWallThick,center=true,$fn=30);
            
            translate([powerSourceWidth/2,powerSourceLength/2-4.3-1.5,powerSourceHeight/2-15-1.5])rotate([0,90,0])cylinder(d=3,h=3*powerSourceWallThick,center=true,$fn=30);
            
            translate([powerSourceWidth/2,powerSourceLength/2-19.3-1.5,-powerSourceHeight/2+23.7+1.5])rotate([0,90,0])cylinder(d=3,h=3*powerSourceWallThick,center=true,$fn=30);
            
            translate([powerSourceWidth/2,-powerSourceLength/2+20.2+1.5,powerSourceHeight/2-11.3-1.5])rotate([0,90,0])cylinder(d=3,h=3*powerSourceWallThick,center=true,$fn=30);
            
            translate([powerSourceWidth/2,-powerSourceLength/2+20.2+1.5,-powerSourceHeight/2+11.3+1.5])rotate([0,90,0])cylinder(d=3,h=3*powerSourceWallThick,center=true,$fn=30);
            
            translate([powerSourceWidth/2-4.1-3.5/2,powerSourceLength/2-3-3.5/2,-powerSourceHeight/2])cylinder(d=3.5,h=3*powerSourceWallThick,center=true,$fn=30);
            
            powerSourceHoleBottom(3*powerSourceWallThick);
        }
    }
    
    color("orange")
    {
        translate([0,powerSourceLength/2-6.1,-powerSourceHeight/2+10+1.5+6])cube([powerSourceWidth-20,12,20],center=true);
        
        translate([0,-(12-5)/2,-powerSourceHeight/2+2*powerSourceWallThick])cube([powerSourceWidth-2*powerSourceWallThick,powerSourceLength-2*powerSourceWallThick-12-5,powerSourceWallThick],center=true);
    }  
}

//powerSource();

