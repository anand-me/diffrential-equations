function f = ODEfun(V,Y)
%%
% As the differential equation contains 3 dependent variables (Ta, T, & X), so Y vector contains
% initial values of these 3 variables, where, Ta is the first element, T is the second element and X is the
% third element of Y vector
%%
Ta = Y(1);
T =  Y(2);
X =  Y(3);
% Explicit Equations
Cpc = 28;
m = 500;
% UA = 5000;
%Adiabatic operation UA =0
UA = 0;
Ca0 = 1.86;
FAo = 14.67;
dH = -34500;
k = 31.1*exp((7906)*(T-360)/(T*360));
Kc = 3.03*exp((dH/8.314)*((T-333)/(T*333)));
Xe = Kc/(1+Kc);
ra = -k*Ca0*(1-(1+1/Kc)*X);
CPo = 159;
%Diffrential Equation
%dTadV = UA * (T - Ta) / (m * Cpc);

%For counter-current diffrential equation
%dTadV = - UA * (T - Ta) / (m * Cpc);

%For constant Ta diffrential equation
dTadV = 0 * UA * (T - Ta) / (m * Cpc);

dTdV  = (ra * dH - (UA * (T -Ta))) /(CPo * FAo)
dXdV  = 0 - (ra/FAo);
f     = [dTadV; dTdV; dXdV];

end



