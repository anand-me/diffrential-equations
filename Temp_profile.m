clc
%Integration time span
Vspan = [0,5]; %Range for the independent variables 
%Enter the initial value for dependent variables Ta, T, X - Ta(0) =315,
%T(0) = 305 and X(0) = 0
%y0 = [315, 305, 0];
%y0 = [330, 305, 0];
y0 = [340, 305, 0];
%Selecting the ODE solver, ode45 | ode23 | ode 113 | ode 15s | ode23s |
%ode23t | ode23tb | 
[v,y] = ode45(@ODEfun, Vspan, y0); %calling function file into the solver and passing input arguments (Vspan, yo) to function file
%y is column vector of Ta, T and X ; v is column vector of volumn; output
%will be stored in v,y
z = size(y);
y(z(1,1),1)
%Plotting the output values
%
plot (v,y(:,1), v,y(:,2));
legend('T_a', 'T')
ylabel('T(K)');
xlabel('V(m^3)');
axis([0 5 300 400]);
title('Temp profile down the reactor for co-current heat exchanger')
%% value of volume at T = 20th row - v(20); get the value of volume of reactor at this point y(20,2);
%%
% v(2)
% y(2,2)