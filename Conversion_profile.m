%actual conversion X equillibrium conversion Xe

clc
%Integration time span
Vspan = [0,5]; %Range for the independent variables 
%Enter the initial value for dependent variables Ta, T, X - Ta(0) =315,
%T(0) = 305 and X(0) = 0

%y0 = [315, 305, 0];
y0 = [340, 305, 0];
%Selecting the ODE solver, ode45 | ode23 | ode 113 | ode 15s | ode23s |
%ode23t | ode23tb | 
[v,y] = ode45(@ODEfun, Vspan, y0); %calling function file into the solver and passing input arguments (Vspan, yo) to function file
%y is column vector of Ta, T and X ; v is column vector of volumn; output
%will be stored in v,y
z = size(y)
% Xe=Kc/(1+Kc)
%And Kc = 3.03*exp((-34500/8.314)*((T-333)/(T*333)))

% To evaluate the value of Xe at z (1,1) number of points, we need to create a “for” loop. We will first
% evaluate the value of Kc at different temperature and then calculate the value of Xe at different Kc. In
% the equation of Kc and Xe, T can be replaced by y(i, 2) as temp is the second dependent variable of y
% matrix
% Now we will evaluate the value of Xe at i=1: z(1,1)

for i = 1 : z(1,1)
    Kc(i) = 3.03 * exp(-4149.63 * (y (i,2) - 333) / (y(i,2) * 333 ));
    Xe(i) =   Kc (i ) / (1+Kc(i));
end

plot (v,y(:,3), v,Xe);
legend('X', 'X_e')
ylabel('X');
xlabel('V(m^3)');
%axis([0 5 300 380]);
title('Conversion profile down the reactor for co-current heat exchanger')
