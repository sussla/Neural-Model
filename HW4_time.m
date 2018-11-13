%% Time series version of question A %%
<<<<<<< HEAD
=======

clc
clear all 

>>>>>>> 8007dd1460bfc9f6b6f7603a39e42237724435cb
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
<<<<<<< HEAD
[TGrid, LGrid] = meshgrid(time, I);
additive_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)
=======
Add_plot = surf(time, 1:10, x);
Add_plot.FaceAlpha=0.8;
Add_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
>>>>>>> 8007dd1460bfc9f6b6f7603a39e42237724435cb
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
<<<<<<< HEAD
[TGrid, LGrid] = meshgrid(time, I);
shunting_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)
=======
Shunt_plot = surf(time, 1:10, x);
Shunt_plot.FaceAlpha=0.8;
Shunt_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
>>>>>>> 8007dd1460bfc9f6b6f7603a39e42237724435cb

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
<<<<<<< HEAD
[TGrid, LGrid] = meshgrid(time, I);
second_shunting_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)
=======
PartC_plot = surf(time, 1:10, x);
PartC_plot.FaceAlpha=0.8;
PartC_plot.LineStyle='none';

xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
>>>>>>> 8007dd1460bfc9f6b6f7603a39e42237724435cb
