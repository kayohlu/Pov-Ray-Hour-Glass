#include "colors.inc"
#include "functions.inc"
#include "logo.inc"
#include "textures.inc"
#include "glass.inc"
#include "stars.inc" 
#include "skies.inc"


camera
{
        location <1, 6, -32>
        look_at <0, -2, 0>
}  

   

sphere{ <0,0,0>, 1
        texture{ Starfield4 scale 0.25
               } // end of texture
        scale 10000
      }  
      
// create a TrueType text shape
text {
    ttf "timrom.ttf" "Sands of Time" 1, 0 
    scale 4
    pigment { Red }
    translate<-10,-15,0>
    rotate<38,0,0>
  }


light_source 
{
        <20, 40, -30> color White 
}              
    

// Code for creating the Hour glass on its own.     
// Lathes are used to create the top and bottom halves of the hour glass
#declare Bottom_Glass =     
lathe
{
        quadratic_spline
        5, 
        <4.2, -1.9>
        <0.5, -1.9>,
        <1.3, 1.5>,
        <2.6, 3.7>,
        <1.7, 4.0>     
} 

#declare Top_Glass =    
lathe
{       
        quadratic_spline
        4,  
        <0.0, -1.9>,
        <1.3, 1.5>,
        <2.6, 2.7>,
        <0, 4.5>
        translate <0, 1.2, 0>
         
}  


#declare Hourglass_Top_Half =
union 
{
        object{Bottom_Glass}
        object{Top_Glass}    
}  

#declare Hourglass_Bottom_Half =
union 
{
        object{Bottom_Glass}
        object{Top_Glass} 
        rotate<180,0,0>   
}  

// The two lathes are palced together to form an hour glass.
#declare Just_The_Hourglass =
union
{ 
        object {Hourglass_Top_Half}
        object {Hourglass_Bottom_Half} 
        translate<0,6,0>
        pigment{ rgbf <1.0,1.0,1.0,0.95> }
        finish{phong 0.9 phong_size 10 reflection 0.1}
        interior{ior 1.5}
}   




// Code for creating the frame for the Hour Glass.
   
#declare Frame_Base = 
difference
{
        box 
        {
                <-0, -0, -0>, 
                <0.5, 0.03, 0.5> 
        }
        
        torus
        {
                0.25,
                0.06 
                translate<0.25,0,-0.2>
        }
         
         torus
        {
                0.25,
                0.06
                translate<-0.2,0,0.25>
        } 
        
        torus
        {
                0.25,
                0.06
                translate<0.7,0,0.25>
        }   

        torus
        {
                0.25,
                0.06 
                translate<0.25,0,0.7>
        }

        
} 

#declare Frame_Top =  
union
{
        object{Frame_Base}
        translate<0,0.5,0>
}    

#declare Leg_One =
cylinder
{
        <0.02, 0.029, 0.02>,
        <0.02, 0.5, 0.02>
        0.015   
} 

#declare Leg_Two =
cylinder
{
        <0.02, 0.029, 0.48>,
        <0.02, 0.5, 0.48>
        0.015   
}

#declare Leg_Three =
cylinder
{
        <0.48, 0.029, 0.02>,
        <0.48, 0.5, 0.02>
        0.015   
} 

#declare Leg_Three =
cylinder
{
        <0.48, 0.029, 0.02>,
        <0.48, 0.5, 0.02>
        0.015   
}

#declare Leg_Four =
cylinder
{
        <0.48, 0.029, 0.48>,
        <0.48, 0.5, 0.48>
        0.015   
}     


// Places the frame together into one object
#declare Complete_Frame = 
union
{
        object{Frame_Base}
        object{Frame_Top}
        object{Leg_One}
        object{Leg_Two} 
        object{Leg_Three} 
        object{Leg_Four}
        translate <-0.25,-0.01,-0.25>
        scale 24 
        pigment 
        {
                wood
                warp { turbulence <0,1,1> octaves 3 lambda 1.5 omega 0.3 }
                translate <1,2,3> rotate x*45 scale 2
 }


         
}       

#declare Complete_Hourglass =
union
{
        object{Complete_Frame}
        object{Just_The_Hourglass} 
}  


// causes the Hourglass to rotate.        
object{Complete_Hourglass
translate<0,-6,0>
rotate clock*x*360}
        