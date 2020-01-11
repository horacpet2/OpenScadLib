/* výška,šířka, průměr */
LM12UU = [30,21,12];
LM8UU = [24,15,8];

module LMUU(dimensions)
{
    difference()
    {
        cylinder(d=dimensions[1],h=dimensions[0],center=true, $fn=70);
        
        cylinder(d=dimensions[2], h=dimensions[0]+1,center=true,$fn=50);
    }   
}

//LMUU(LM12UU);