
module TopnyBlok()
{
    Sirka = 16;
    Delka = 16;
    Vyska = 9;
    PrumerTopnyOdpor = 6;
    
    difference()
    {
        cube([Sirka,Delka,Vyska],center=true);
        
        translate([0,Delka/2-PrumerTopnyOdpor/2-1.5,0])rotate([0,90,0])cylinder(d=PrumerTopnyOdpor,h=Sirka+1,center=true, $fn=50);
        
        translate([Sirka/2-4,Delka/2-1,0])rotate([0,90,90])translate([])cylinder(d=3,h=3,center=true, $fn=30);
        
        translate([-(Sirka/2-4),Delka/2-1,0])rotate([0,90,90])translate([])cylinder(d=3,h=3,center=true, $fn=30);
        
        translate([0,-Delka/2+3+2,0])cylinder(d=6,h=Vyska+1,center=true,$fn=50);
        
        translate([Sirka/2-0.9,-Delka/2+1+1.5,0])rotate([0,90,0])cylinder(d=2,h=2,center=true,$fn=20);
    }
}

module Hrot()
{
    difference()
    {
        union()
        {
            cylinder(d=6,h=9,center=true,$fn=50);
            translate([0,0,-4.5-1.5])cylinder(d2=6,d1=1,h=3,center=true,$fn=50);
            
            for(i=[0:60:120])
            {
                rotate([0,0,i])translate([0,0,-4.5+1.75])cube([5,8.6,3.5],center=true);
            }
        }
    
        translate([0,0,4.1])cylinder(d2=3,d1=2,h=1,center=true,$fn=20);
        translate([0,0,2.6])cylinder(d1=0.5,d2=2.45,h=4,center=true,$fn=30);
        cylinder(d=0.5,h=16,center=true);
    }
}


module HeatBreak()
{
    cylinder(d=5.5,h=18,center=true,$fn=50);
    translate([0,0,-9-2.5])cylinder(d=2.85,h=5,center=true,$fn=30);
    translate([0,0,-9-5-1.25])cylinder(d1=5.8,d2=2.85,h=2.5,center=true,$fn=40);
    translate([0,0,-9-5-2.85-2.15])cylinder(d=5.8,h=5,center=true,$fn=40);
}

module Chladic()
{
    difference()
    {
        union()
        {
            cylinder(d=11,h=26,center=true,$fn=70);
            translate([0,0,13+1.25])cylinder(d=16,h=2.5,center=true,$fn=80);
            translate([0,0,13+2.5+2.3])cylinder(d=12,h=4.6,center=true,$fn=70);
            translate([0,0,13+2.5+4.6+2.3])cylinder(d=16,h=4.6,center=true,$fn=90);
            
            translate([0,0,-3.5])cylinder(d=12,h=4,center=true,$fn=70);
            
            for(i=[-13:1.8:-13.2+8.7])
            {
                translate([0,0,i])cylinder(d=19, h=0.6,center=true,$fn=100);
            }
            
            for(i=[-13.2+8.7+3.5:1.8:-13.2+18.7])
            {
                translate([0,0,i])cylinder(d=19, h=0.6,center=true,$fn=100);
            }
            
            translate([0,0,-13.2+18.7+1.8/2])cylinder(d=18, h=0.6,center=true,$fn=100);
            translate([0,0,-13.2+18.7+1.8*1.5])cylinder(d=17, h=0.6,center=true,$fn=100);
            translate([0,0,-13.2+18.7+2.5*1.8])cylinder(d=16, h=0.6,center=true,$fn=100);
        }
        translate([0,0,6])cylinder(d=2,h=39,center=true,$fn=15);
        
        translate([0,0,-4.5])cylinder(d=5.5,h=18,center=true,$fn=45);
        
        translate([5,0,-3.5])rotate([0,90,0])cylinder(d=3,h=10,center=true,$fn=30);
    }
    
}
module Tryska()
{
    rotate([0,0,160])color("silver")Chladic();
    translate([0,0,-4.3])color("silver")HeatBreak();
    translate([0,3,-25.3])color("silver")TopnyBlok();
    translate([0,0,-29])color("orange")Hrot();
}

//Hrot();
//HeatBreak();
//Chladic();
//TopnyBlok();
Tryska();