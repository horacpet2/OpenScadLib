
/*
** 0 - width
** 1 - height
** 2 - inner hole width
** 3 - inner hole height
** 4 - mounting grove width
** 5 - nut grove width 1
** 6 - nut grove width 2
** 7 - nut grove height
*/
AlProfile30x30Params = [30,30,10,10,8,22.5,10.5,6];


function ALProfile_get_width(self)=self[0];
function ALProfile_get_height(self)=self[1];
function ALProfile_get_inner_hole_width(self)=self[2];
function ALProfile_get_inner_hole_height(self)=self[3];
function ALProfile_get_mounting_grove_width(self)=self[4];
function ALProfile_get_nut_grove_width1(self)=self[5];
function ALProfile_get_nut_grove_width2(self)=self[6];
function ALProfile_get_nut_frove_height(self)=self[7];

module ALProfile_nut_grove(self, rotation, position)
{
    rotate([0,0,rotation])
    {
        translate([0, position])
        {
            hull()
            {
                square([ALProfile_get_nut_grove_width1(self), 0.01],center=true);
            
                translate([0,ALProfile_get_nut_frove_height(self)])
                    square([ALProfile_get_nut_grove_width2(self), 0.01],center=true);
            }
            
            translate([0,-1])
                square([ALProfile_get_mounting_grove_width(self),3],center=true);
        }
    }
}

module AlProfile(self, length)
{
    linear_extrude(height = length)
    {
        difference()
        {
            square([ALProfile_get_width(self),ALProfile_get_height(self)],center=true);
            square([ALProfile_get_inner_hole_width(self),ALProfile_get_inner_hole_height(self)],center=true);
            
            ALProfile_nut_grove(self, 0, -ALProfile_get_height(self)/2+2);
            ALProfile_nut_grove(self, 180, -ALProfile_get_height(self)/2+2);
            ALProfile_nut_grove(self, 90, -ALProfile_get_width(self)/2+2);
            ALProfile_nut_grove(self, 270, -ALProfile_get_width(self)/2+2);
        }
    }
}

//AlProfile(AlProfile30x30Params, 100);









