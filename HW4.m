%% Time series version of question A %%
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
[TGrid, LGrid] = meshgrid(time, I);
additive_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)


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
[TGrid, LGrid] = meshgrid(time, I);
shunting_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)

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
[TGrid, LGrid] = meshgrid(time, I);
second_shunting_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)
%% Question D of the distance-dependent receptive field %%

% set parameters 
A = 0.1; %constant specified in homework 
B = 1; %constant specified in homework 
x_start = -10; % begin with an x value of 0, x(0) = 0 
x_inc = .001; % increments that I want to count by
x_end = 100; % final x value  
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
[TGrid, LGrid] = meshgrid(time, IA);
IA_plot = surf(TGrid, LGrid, x(:,1:end));
shading interp
xlabel('Time')
zlabel('Activity of neuron')
ylabel('Input')
set(gca, 'fontsize',13)
