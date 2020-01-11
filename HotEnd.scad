/*
 * 0 - default library use
 * 1 - heat block
 * 2 - nozzle
 * 3 - heat break
 * 4 - cooler block
 * 5 - hotend
 */
hotend_object = 0;

filamentDiameter = 1.75;

/* nozzle dimensions */
nozzleThreadDiameter = 6;
nozzleThreadHeight = 9;
nozzleScrewDiameter = 9;
nozzleScrewHeight = 3.5;
nozzleHeight = nozzleThreadHeight+3;

/* heater block dimensions */
HeaterBlockWidth = 16;
HeaterBlockLenth = 16;
HeaterBlockHeight = 9;
HeaterResistorDiameter = 6;

/* heatbreak dimensions */
heatbreakDiameter_1 = 6;
heatbreakDiameter_2 = 4;
heatbreakDiameter_3 = 6; //thread
heatbreakLength_1 = 20;
heatbreakLength_2 = 5;
heatbreakLength_3 = 5;
heatbreakLength = heatbreakLength_1 + heatbreakLength_2 + heatbreakLength_3;

/* cooler block dimensions */
coolerblockMountDiameter_1 = 16;
coolerblockMountDiameter_2 = 12;
coolerblockMountDiameter_3 = 16;
coolerblockMountHeight_1 = 5;
coolerblockMountHeight_2 = 4.5;
coolerblockMountHeight_3 = 3;
coolerblockHeigth = 38.5;
coolerblockHeatBreakMountDiameter = 12;
coolerblockHeatBreakMountHeigth = 4;
coolerblockCoreDiameter = 10;
coolerblockRibWidth = 1;
coolerblockRibSpace = 1;
coolerblockRibDiameter = 19;
coolerblockRibNumber_1 = 6;
coolerblockRibNumber_2 = 5;

module HeatBlock()
{
    difference()
    {
        cube([HeaterBlockWidth, HeaterBlockLenth, HeaterBlockHeight],center=true);
        
        translate([0,HeaterBlockLenth/2-HeaterResistorDiameter/2-1.5,0])rotate([0,90,0])cylinder(d=HeaterResistorDiameter,h=HeaterBlockWidth+1,center=true, $fn=50);
        
        translate([HeaterBlockWidth/2-4,HeaterBlockLenth/2-1,0])rotate([0,90,90])translate([])cylinder(d=3,h=3,center=true, $fn=30);
        
        translate([-(HeaterBlockWidth/2-4),HeaterBlockLenth/2-1,0])rotate([0,90,90])translate([])cylinder(d=3,h=3,center=true, $fn=30);
        
        translate([0,-HeaterBlockLenth/2+3+2,0])cylinder(d=6,h=HeaterBlockHeight+1,center=true,$fn=50);
        
        translate([HeaterBlockWidth/2-0.9,-HeaterBlockLenth/2+1+1.5,0])rotate([0,90,0])cylinder(d=2,h=2,center=true,$fn=20);
    }
}

module heatBreak()
{
    difference()
    {
        union()
        {
            cylinder(d=heatbreakDiameter_1, h=heatbreakLength_1,$fn=40);
            translate([0,0,-heatbreakLength_2])cylinder(d=heatbreakDiameter_2, h=heatbreakLength_2, $fn=30);
            
            translate([0,0,-heatbreakLength_2-heatbreakLength_3+1])cylinder(d=heatbreakDiameter_3, h=heatbreakLength_3-1, $fn=40);
            translate([0,0,-heatbreakLength_2-heatbreakLength_3])cylinder(d2=heatbreakDiameter_3,d1=heatbreakDiameter_3/2, h=1, $fn=40);
        }
        translate([0,0,-(heatbreakLength_2+heatbreakLength_3)-1])cylinder(d=filamentDiameter*1.3,h=heatbreakLength+2,$fn=20);
        
    }
}

module collerBlock()
{
    difference()
    {
        union()
        {
            cylinder(d=coolerblockCoreDiameter, h=coolerblockHeigth,$fn=40);
            
            translate([0,0,coolerblockHeigth-coolerblockMountHeight_1])cylinder(d=coolerblockMountDiameter_1,h=coolerblockMountHeight_1,$fn=50);
            
            translate([0,0,coolerblockHeigth-coolerblockMountHeight_1-coolerblockMountHeight_2])cylinder(d=coolerblockMountDiameter_2,h=coolerblockMountHeight_2,$fn=50);
            
            translate([0,0,coolerblockHeigth-coolerblockMountHeight_1-coolerblockMountHeight_2-coolerblockMountHeight_3])cylinder(d=coolerblockMountDiameter_3,h=coolerblockMountHeight_3,$fn=50);
            
            /* rib 2 */
            for(i=[0:coolerblockRibWidth+coolerblockRibSpace:(coolerblockRibNumber_2-1)*(coolerblockRibSpace+coolerblockRibWidth)])
            {
                translate([0,0,i])cylinder(d=coolerblockRibDiameter, h=coolerblockRibWidth, $fn=60);
            }
            
            translate([0,0,(coolerblockRibNumber_2-1)*(coolerblockRibSpace+coolerblockRibWidth)+coolerblockRibSpace])cylinder(d=coolerblockHeatBreakMountDiameter, h=coolerblockHeatBreakMountHeigth, $fn=50);
                
            /* rib 1 */
            for(i=[0:coolerblockRibWidth+coolerblockRibSpace:(coolerblockRibNumber_1-1)*(coolerblockRibSpace+coolerblockRibWidth)])
            {
                translate([0,0, (coolerblockRibNumber_2-1)*(coolerblockRibSpace+coolerblockRibWidth)+coolerblockRibSpace+coolerblockHeatBreakMountHeigth + i])cylinder(d=coolerblockRibDiameter, h=coolerblockRibWidth, $fn=60);
            }
        }
        
        translate([0,0,-1])cylinder(d=filamentDiameter*1.3, h=coolerblockHeigth+2, $fn=20);
        
        translate([0,0,coolerblockHeigth-1])cylinder(d1=filamentDiameter*1.3, d2 = 3*filamentDiameter, h=1.1, $fn=20);
        
        translate([0,0,-1])cylinder(d=heatbreakDiameter_1, h=heatbreakLength_1+1, $fn=30);
    }
}

module nozzle()
{
    difference()
    {
        union()
        {
            cylinder(d = nozzleThreadDiameter,h = nozzleThreadHeight, $fn = 50);
            translate([0,0,-3])cylinder(d2=nozzleThreadDiameter,d1=1,h=3,$fn=50);
            
            translate([0,0,0])cylinder(d=nozzleScrewDiameter,h=nozzleScrewHeight,$fn=6);
        }
    
        translate([0,0,nozzleHeight-3-1])cylinder(d2=3,d1=2,h=1.01,$fn=20);
         translate([0,0,nozzleHeight-3-4])cylinder(d1=0.5,d2=2.45,h=4.01,$fn=30);
        translate([0,0,-4])cylinder(d=0.5,h=nozzleHeight+2);
    }
}

module hotend()
{
    color("silver")collerBlock();
    color("gray")translate([0,0,0])heatBreak();
    color("silver")translate([0,3,-heatbreakLength_2-heatbreakLength_3+0.5])HeatBlock();
    color("orange")translate([0,0,-heatbreakLength_2-HeaterBlockHeight-nozzleScrewHeight])nozzle();
}


if(hotend_object == 0)
{
    
}
else if(hotend_object == 1)
{
    HeatBlock();
}
else if(hotend_object == 2)
{
    nozzle();
}
else if(hotend_object == 3)
{
    heatBreak();
}
else if(hotend_object == 4)
{
    collerBlock();
}
else if(hotend_object == 5)
{
    hotend();
}
else
{
    echo("Wrong object index! No object shown.");
}