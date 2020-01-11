capacite_probe_diameter = 8;
capacite_probe_heigh = 61;
capacite_probe_nut_diameter = 16;


module capacite_probe(nut_1_position, nut_2_position)
{
    color("silver")translate([0,0,6])cylinder(d=capacite_probe_diameter, h=capacite_probe_heigh-6 ,$fn=50);
    color("blue")cylinder(d=capacite_probe_diameter, h=6, $fn=50);
    color("gray")
    {
        if(nut_1_position > 7 && nut_1_position < nut_2_position)
        {
            translate([0,0,nut_1_position-1])
            {
                cylinder(d=capacite_probe_nut_diameter,h=1, $fn=70);
                translate([0,0,-1])cylinder(d=capacite_probe_nut_diameter-1,h=1, $fn=6);
            }
        }
        
        if(nut_2_position > nut_1_position && nut_2_position < capacite_probe_heigh -1)
        {
            translate([0,0,nut_2_position-1])
            {
                cylinder(d=capacite_probe_nut_diameter,h=1, $fn=70);
                translate([0,0,1])cylinder(d=capacite_probe_nut_diameter-1,h=1, $fn=6);
            }
        }
        
    }
}


//capacite_probe(10,20);