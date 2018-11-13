% Question D of the distance-dependent receptive field %

% set parameters 
A = 0.1; %constant specified in homework 
B = 1; %constant specified in homework 
x_start = 0; % begin with an x value of 0, x(0) = 0 
x_inc = .001; % increments that I want to count by
x_end = 3; % final x value  
time = x_start:x_inc:x_end;
dx = 0;
IA = [0.1, 0.1, 0.1, 0.1, 0.1, 0.8, 0.8, 0.8, 0.8, 0.8];
IB = [0.1, 0.1, 0.1, 0.1, 0.8, 0.8, 0.1, 0.1, 0.1, 0.1];
IC = [0.1, 0.1, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.1, 0.1];
ID = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];
CKI = exp((-(-4:4).^2)./4);
EKI = (0.5 .* exp(((-(-4:4).^2))./16));

%plot(CKI);
%plot(EKI);


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
[TGrid, LGrid] = meshgrid(time, IA);
IA_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)

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
[TGrid, LGrid] = meshgrid(time, IB);
IA_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)

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
[TGrid, LGrid] = meshgrid(time, IC);
IA_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)

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
[TGrid, LGrid] = meshgrid(time, ID);
IA_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)
