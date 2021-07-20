% Rate profile

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
Cao = 1.86;
for i = 1 : z(1,1)
    Kc(i) =  3.03 * exp(-4149.63 * (y (i,2) - 333) / (y(i,2) * 333 ));
    K (i) =  31.1 * exp(7906 * (y(i,2) - 360) / (y(i,2) * 360));
    ra(i) = -K(i) * Cao * (1-(1+1/Kc(i)) * y(i,3));
end
plot (v,-ra);
ylabel('-ra (kmol/m^3.h)');
xlabel('V(m^3)');
axis([0 5 0 30])
legend('rate')
title('Reaction rate profile down the reactor for co-current heat exchanger')