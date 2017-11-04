%10/14/2015
%By Richard Lin
%Project Common name: Exo
%Simulation for air Muscle connect position relative to the arm
%Input muscle effectiveness, connect positions.
%Output change in arm rotation angle
%[dTheta]= AirMuscle_ExoArm_Simulation(A,C,dC,Theta)
%Used only for single data points

function [dTheta, B]= AirMuscle_ExoArm_Simulation(A,C,dC,Theta)
%dTheta- change in angel
%A- distance from muscle connection point on upperarm to joint
%B- distance from muscle connection poont on forearm to joint
%C- distance of muscle
%dC- contraction length of muscle
%Theta- initial arm angle

%Laws of sines -- A/sin(a)=B/sin(b)=C/sin(c)
a= asind(sind(Theta)*A/C); %angle a in degree

b= 180-a-Theta; %angle of b
B= C/sind(Theta)*sind(b); %Length of B



%Laws of cosines -- C^2=A^2+B^2-2ABcos(Theta')
%As Theta beccome smaller, A & B don't change, C gets shorter.
%Theta_p as the changing Theta, C_p as the changing C
%Theta_f as final change in Theta
%Need to keep original Theta and C values to compare
%{
for Theta_p = Theta:-0.1:0.0
    
    C_p =sqrt(A^2+B^2-2*A*B*cosd(Theta_p));

    if  C-C_p >= dC
     
        Theta_f = Theta_p;
        break;
        
    else
        Theta_f=Theta;
        
    end
   
end
  %dTheta=  sqrt(A.^2+B.^2+2.*A.*B.*cos(35))
    dTheta = Theta - Theta_f; 
      
%}   
%%%%%%
 
 %New method
 %Also uses Laws of Cosines
 %Produce answer directly, instead of changing Theta at small increments
 %Faster and more accurate
 
 C_p = C- dC;       %Final distance C
 
 Theta_f = acosd((C_p^2-A^2-B^2)/(-2*A*B)); %Angle c after change
 dTheta= Theta- Theta_f; %Change in angle
 














    
    