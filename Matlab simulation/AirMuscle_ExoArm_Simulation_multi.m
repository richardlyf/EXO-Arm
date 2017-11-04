%11/2/2015
%By Richard Lin
%Project Common name: Exo
%Simulation for air Muscle connect position relative to the arm
%Input muscle effectiveness, connect positions.
%Output change in arm rotation angle
%[dTheta]= AirMuscle_ExoArm_Simulation_multi(A,C,dC,Theta)
%Used only for multiple data points


function  AirMuscle_ExoArm_Simulation_multi(A,C_r,Theta)
%dTheta- change in angel
%A- distance from muscle connection point on upperarm to joint
%B- distance from muscle connection poont on forearm to joint
%C- distance of muscle
%dC- contraction length of muscle
%Theta- initial arm angle

%C_r is a string of C values

%plotting for angle change relative to different C's

d= size(C_r); % Getting dimentions of C
dTheta = zeros (d); %defining dTheta as a string the size of C

%k is counter

k=1;

%dC_r is the muscle contraction lengths
dC_r= zeros(d);

for C = C_r   %The loop will go through all values of C
    
%C_c is current C values out of all C's in loop
    
%Laws of sines -- A/sin(a)=B/sin(b)=C/sin(c)
a= asind(sind(Theta)*A/C); %angle a in degree

b= 180-a-Theta; %angle of b
B= C/sind(Theta)*sind(b); %Length of B

%Assume dC is 25% of current C
dC= 0.25*C;
dC_r(1,k)=dC;

%Laws of cosines -- C^2=A^2+B^2+2ABcos(Theta')
%As Theta beccome smaller, A & B don't change, C gets shorter.
%Theta_p as the changing Theta, C_p as the changing C
%Theta_f as final change in Theta
%Need to keep original Theta and C values to compare


for Theta_p = Theta:-0.1:0.0
    
    C_p =sqrt(A^2+B^2-2*A*B*cosd(Theta_p));
    
  
 %%%%%%%%%%%%%%%%%%%% Torque simulation
% The final position may not be physically accurate, because the smaller B
% is, the more torque it takes. If the muscle pulling torque is not as great or
% greater than the weight it's pulling, the arm won't move, or move as much

% Input m,W,L, F_muscle

% m is weight of the arm
% W is the weight the arm is pulling
% L is the length of the arm
% d_a is the change in angle a
% T_Wm is the W and m torque total
% T_muscle is the muscle's total torque
% F_muscle is the muscle's total force

%{
    d_a = asind(A*sind(Theta_p)/C_p);

    T_Wm = L*cosd(Theta-90)*W + 0.5*L*cos(Theta-90)*m;     %weight of arm is distributed in the center, thus 0.5L
    T_muscle = B*sind(d_a)*F_muscle;
    
    if T_Wm <= T_muscle
       
        %Graph should indicate it's possible
        
    end

%}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%% Angle change simulation

    if  C-C_p >= dC   % Determine if it's at final position yet
     
        Theta_f = Theta_p;
        break;
        
    else
        Theta_f=Theta;
        
    end

    
    
end

    dTheta(1,k) = Theta - Theta_f; 
    k=k+1;

end
    
figure(1);    
plot(C_r,dTheta,'r');
hold;
title('Length of C Vs. Change of Angle');
xlabel('Lengths of C');
ylabel('Turned angles of Arm');

figure(2);
plot(C_r,dC_r,'b');
title('Length of C Vs. Muscle contraction length');
xlabel('Lengths of C');
ylabel('Muslce contraction length');


