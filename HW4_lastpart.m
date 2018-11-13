% Comparing the distnce-dependent coefficients to the shunting network
% without any distance dependent coefficients 
% Will be the same equation as described in part B of my time graphs, but
% this time with the four different inputs in part D 
clc
clear all 

% set parameters 
A = 0.1; %constant specified in homework 
B = 1; %constant specified in homework 
x_start = 0; % begin with an x value of 0, x(0) = 0 
x_inc = .001; % increments that I want to count by
x_end = 10; % final x value  
time = x_start:x_inc:x_end;
dx = 0;
IA = [0.1, 0.1, 0.1, 0.1, 0.1, 0.8, 0.8, 0.8, 0.8, 0.8];
IB = [0.1, 0.1, 0.1, 0.1, 0.8, 0.8, 0.1, 0.1, 0.1, 0.1];
IC = [0.1, 0.1, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.1, 0.1];
ID = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

%complete loop for IA inputs 
x = zeros(length(IA), length(time));
for h = 1:10
    i = IA(h);
    L = sum(IA(IA~=IA(h)));
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* i) - (x(h,t).* L)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end

figure(14);
CIA_plot = surf(time, 1:10, x);
CIA_plot.FaceAlpha=0.8;
CIA_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',13)
title('Input A', 'FontSize',20)

%complete loop for IB inputs 
x = zeros(length(IB), length(time));
for h = 1:10
    i = IB(h);
    L = sum(IB(IB~=IB(h)));
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* i) - (x(h,t).* L)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end

figure(15);
CIB_plot = surf(time, 1:10, x);
CIB_plot.FaceAlpha=0.8;
CIB_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',13)
title('Input B', 'FontSize',20)

%complete loop for IC inputs 

x = zeros(length(IC), length(time));
for h = 1:10
    i = IC(h);
    L = sum(IC(IC~=IC(h)));
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* i) - (x(h,t).* L)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end

figure(16);
CIC_plot = surf(time, 1:10, x);
CIC_plot.FaceAlpha=0.8;
CIC_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',13)
title('Input C', 'FontSize',20)

%complete loop for ID inputs 
x = zeros(length(ID), length(time));
for h = 1:10
    i = ID(h);
    L = sum(ID(ID~=ID(h)));
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* i) - (x(h,t).* L)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end

figure(17);
CID_plot = surf(time, 1:10, x);
CID_plot.FaceAlpha=0.8;
CID_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',13)
title('Input D', 'FontSize',20)


