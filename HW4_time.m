%% Time series version of question A %%

clc
clear all 

% Additive equation of xi at equilibrium 

% set parameters 
A = 0.1; %constant specified in homework 
B = 1; %constant specified in homework 
I = [1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1];
x_start = 0; % begin with an x value of 0, x(0) = 0 
x_inc = .001; % increments that I want to count by
x_end = 10; % final x value  
time = x_start:x_inc:x_end;
x = zeros(length(I),length(time));
dx = 0;


for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h)));
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + (B .* i) - L) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end

figure(7);
Add_plot = surf(time, 1:10, x);
Add_plot.FaceAlpha=0.8;
Add_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
%% Shunting equation of Xi at equilibrium %%

% set parameters 
A = 0.1; %constant specified in homework 
B = 1; %constant specified in homework 
I = [1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1];
x_start = 0; % begin with an x value of 0, x(0) = 0 
x_inc = .001; % increments that I want to count by
x_end = 10; % final x value  
time = x_start:x_inc:x_end;
x = zeros(length(I),length(time));
dx = 0;

for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h)));
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* i) - (x(h,t).* L)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end

figure(8);
Shunt_plot = surf(time, 1:10, x);
Shunt_plot.FaceAlpha=0.8;
Shunt_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)

%% Part C shunting equation %%
% set parameters 
A = 0.1; %constant specified in homework 
B = 1; %constant specified in homework 
I = [1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1];
x_start = 0; % begin with an x value of 0, x(0) = 0 
x_inc = .001; % increments that I want to count by
x_end = 10; % final x value  
time = x_start:x_inc:x_end;
x = zeros(length(I),length(time));
dx = 0;

for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h)));
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* i) - L) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end

figure(9);
PartC_plot = surf(time, 1:10, x);
PartC_plot.FaceAlpha=0.8;
PartC_plot.LineStyle='none';

xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)