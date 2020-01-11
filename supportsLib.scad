module gridSupport(width, lenght,hight, density, wallThick,left,right)
{
    for(i=[0:density:lenght])
    {
        translate([0,i,hight/2])cube([width,wallThick,hight],center=true);
        
        
    }
    
    if(right > 0)
    {
        for(i=[density/2:2*density:lenght])
        {
            translate([width/2,i,hight/2])cube([wallThick, density+wallThick, hight],center=true);
        }
    }
    
    if(left >0)
    {
        for(i=[density*1.5:2*density:lenght])
        {
            translate([-width/2,i,hight/2])cube([wallThick, density+wallThick, hight],center=true);
        }
    }
}

//gridSupport(30, 30,20, 6, 0.4,0,1);