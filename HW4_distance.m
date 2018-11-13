% Question D of the distance-dependent receptive field %

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
CKI = exp((-(-4:4).^2)./4);
EKI = (0.5 .* exp(((-(-4:4).^2))./16));

figure(80);
plot(CKI, 'Linewidth',3);
title('CKI', 'FontSize',20)
ylabel('', 'FontSize', 18)
xlabel('','FontSize', 18)


figure(82);
plot(EKI, 'Linewidth',3);
title('EKI', 'FontSize',20)
ylabel('', 'FontSize', 18)
xlabel('','FontSize', 18)


%working on IA input 
x = zeros(length(IA), length(time));

for h = 1:10
    i = IA(h);
    start_k =max(h-4,1);
    end_k =min(10,h+4);
    k = (start_k:end_k); %creating our k vectors
    IA(k); %index K 
    ML= max(5-h,0);%what we are missing on left 
    MR = max(h-6,0); %what we are missing on right
    R = [repmat(IA(start_k), ML, 1);(IA(k))';repmat(IA(end_k), MR, 1)]; %creating input for K 
    ISum = sum(EKI' .* R);
    ASum = sum(CKI' .* R);
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* ASum) - (x(h,t) .* ISum)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end 


figure(10);
IA_plot = surf(time, 1:10, x);
IA_plot.FaceAlpha=0.8;
IA_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',13)
title('Input A', 'FontSize',20)

%working on IB input 

x = zeros(length(IB), length(time));

for h = 1:10
    i = IB(h);
    start_k =max(h-4,1);
    end_k =min(10,h+4);
    k = (start_k:end_k); %creating our k vectors
    IB(k); %index K 
    ML= max(5-h,0);%what we are missing on left 
    MR = max(h-6,0); %what we are missing on right
    R = [repmat(IB(start_k), ML, 1);(IB(k))';repmat(IB(end_k), MR, 1)]; %creating input for K 
    ISum = sum(EKI' .* R);
    ASum = sum(CKI' .* R);
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* ASum) - (x(h,t) .* ISum)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end 

figure(11);
IB_plot = surf(time, 1:10, x);
IB_plot.FaceAlpha=0.8;
IB_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',13)
title('Input B', 'FontSize',20)

%working on IC input
x = zeros(length(IC), length(time));

for h = 1:10
    i = IC(h);
    start_k =max(h-4,1);
    end_k =min(10,h+4);
    k = (start_k:end_k); %creating our k vectors
    IC(k); %index K 
    ML= max(5-h,0);%what we are missing on left 
    MR = max(h-6,0); %what we are missing on right
    R = [repmat(IC(start_k), ML, 1);(IC(k))';repmat(IC(end_k), MR, 1)]; %creating input for K 
    ISum = sum(EKI' .* R);
    ASum = sum(CKI' .* R);
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* ASum) - (x(h,t) .* ISum)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end 

figure(12);
IC_plot = surf(time, 1:10, x);
IC_plot.FaceAlpha=0.8;
IC_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',13)
title('Input C', 'FontSize',20)

%working on ID input
x = zeros(length(ID), length(time));

for h = 1:10
    i = ID(h);
    start_k =max(h-4,1);
    end_k =min(10,h+4);
    k = (start_k:end_k); %creating our k vectors
    ID(k); %index K 
    ML= max(5-h,0);%what we are missing on left 
    MR = max(h-6,0); %what we are missing on right
    R = [repmat(ID(start_k), ML, 1);(ID(k))';repmat(ID(end_k), MR, 1)]; %creating input for K 
    ISum = sum(EKI' .* R);
    ASum = sum(CKI' .* R);
   for t = 1:(length(time)-1)
    dx = ((-1 .* A .* x(h,t)) + ((B - x(h,t)).* ASum) - (x(h,t) .* ISum)) * x_inc;
    x(h,t+1)= x(h,t) + dx;
   end 
end 

figure(13);
ID_plot = surf(time, 1:10, x);
ID_plot.FaceAlpha=0.8;
ID_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',13)
title('Input D', 'FontSize',20)
