%% Homework 3 for CN510 %%

clc
clear all

% first section of homework: a shunting network of the shift property 


% Set the parameters 

A = 15; % constant
B = 115; % approximate for sodium channel
x_start = -4; % begin with an x value of 0, x(0) = 0
x_end = 20; % final x value 
Le = 10 .^(1:5); % list of our L log values
Ll = 10 .* (1:5); % list of our L linear values 

M = linspace(x_start, x_end, 1000); % generates a vector

%create the graph by changing our L vlues logarthic
figure(1); % create first figure
hold on;
for i = 1:5 
    L = Le(i); %creating L to be our logarthic values 
    x = (B .* exp(M))./( A + exp(M) + L); % shunting network (activity of one neuron)
    plot(M,x, 'LineWidth',2);
end

title('Shift Property of Shunting Network', 'FontSize',15)
ylabel('Neural Activity', 'FontSize',13)
xlabel('Input Range (logarithmic)', 'FontSize',13)

%create a loop for labeling our legends to be clear on the graph
Ltext = cell(5,1); 
for i = 1 : -27
    Ltext{i} = sprintf('L value = %d', Le(i));
end 
legend(Ltext,'FontSize',12);

%create the graph by changing our L values linearly
figure(2); 
hold on;
for i = 1:5
    L = Ll(i); %creating L to be our linear values 
    x = (B .* exp(M))./( A + exp(M) + L); % shunting network (activity of one neuron)
    plot(M,x,'LineWidth',2);
end

title('Shift Property of Shunting Network', 'FontSize',15)
ylabel('Neural Activity', 'FontSize',13)
xlabel('Input Range (logarithmic)', 'FontSize',13)

%create a loop for labeling our legends to be clear on the graph
Ltext = cell(5,1);
for (i = 1 : 5)
    Ltext{i} = sprintf('L value = %d', Ll(i));
end 
legend(Ltext,'FontSize',12);

%% part b of homework 3 %%
% Set the parameters 

A = 15; % constant
B = 115; % approximate for sodium channel
x_start = -4; % begin with an x value of 0, x(0) = 0
x_end = 20; % final x value 
Le = 10 .^(1:5); % list of our L log values
Ll = 10 .* (1:5); % list of our L linear values 
C = [1, 10, 100, 200]; %C values to manipulate on graph

M = linspace(x_start, x_end, 1000); % generates a vector

%loop that includes changing values of C and L (logarthic)
figure(3);
for r = 1:4 
    c = C(r);
    subplot(2,2,r);
    hold on;
for i = 1:5
    L = Le(i); %values of L that we need to count by
    x = (B .* exp(M) - (c * L))./( A + exp(M) + L); % shunting network (activity of one neuron)
    plot(M,x,'LineWidth', 2);
end
    title(sprintf('C value = %.d', c));
    ylabel('Neural Activity', 'FontSize',13)
    xlabel('Input Range (logarithmic)', 'FontSize',13)
end 

Ltext = cell(5,1);
for i = 1 : 5
    Ltext{i} = sprintf('L value = %d', Le(i));
end 
legend(Ltext,'FontSize',12);

%loop that includes changing values of C and L (linear)
figure(4);
for r = 1:4 % all the values of C that we are going to use
    c = C(r);
    subplot(2,2,r);
    hold on;
for i = 1:5 % these are the values of L that we are going to use 
    L = Ll(i);
    x = (B .* exp(M) - (c * L))./( A + exp(M) + L); % shunting network (activity of one neuron)
    plot(M,x,'LineWidth', 2);
end
    title(sprintf('C value = %.d', c));
    ylabel('Neural Activity', 'FontSize',13)
    xlabel('Input Range (logarithmic)', 'FontSize',13)
end 

Ltext = cell(5,1);
for i = 1 : 5
    Ltext{i} = sprintf('L value = %d', Ll(i));
end 
legend(Ltext, 'FontSize', 12);
%% part c of homework 3 %%
A = 15; % constant constant
B = 10; % 
L = 1; % L is now a constant
I = 10; %holding our input constant for demonstration of graph
x_start = 0; % begin with an x value of 0, x(0) = 0
x_inc = .01; 
x_end = 1; % final x value 
time = x_start:x_inc:x_end;
x = zeros(length(time), 1); %initalize x 
dx = 0;
C = [1, 10, 100, 200]; %values for c

% this is the plot that we are going to use in order to demonstrate our
% change in c over time 


figure(5)
for i = 1:4 % different value of C to indicate different times 
    %c = C(i);
    %subplot(2,2,i);
for t = 1:(length(time) - 1)
    dx = ((-1 * A * x(t)) + ((B - x(t))* I) - ((x(t) +16) * L)) * x_inc; 
    x(t + 1) = x(t) + dx;
end
%plot(time, x,'LineWidth', 2)
%title(sprintf('C value = %.d', c));
%ylabel('Neural Activity', 'FontSize',13)
%xlabel('time', 'FontSize',13)
%ylim([-10,10])
[X,Y]= mesgrid(1:0.5:10,1:20);
Z = x;
surf(X,Y,Z);
end
