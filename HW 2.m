%% Question A when A = 1 

% first clear matlab
clc
clear all

% Question a from leaky_integrator homework 1
% Set the parameters for when A = 1 

A = 1; % constant representing the spontaneous decay of the neuron 
x_start = 0; % begin with an x value of 0, x(0) = 0 
x_inc = .001; % increments that I want to count by
x_end = 10; % final x value  
I = 0; % create the I variable 

% integrate dx/dt = -Ax + I

x = [0]; % creating an empty x vector 
dx = 0 ; % starting dx at 0

time = x_start:x_inc:x_end;

for t = 1:length(time)  %time position, t=1 refers to the first time point 
    if time(t) >= 1 && time(t) <= 6 %time either below 1 or above 6
        I = 5; % I is equal to 5
    else 
        I = 0; % for all t points besides the ones specified above, I would be equal to 0
    end
    dx = [-1 * A * x(t) + I] * x_inc; % leaky integrator formula
    x(end+1) = x(t) + dx; % change in x 
end       
        
x = x(1:end-1); % removing the last incremident to make x and time the same vector 


%create figure 1
figure(1)
plot(time,x)
title('Leaky Integrator (a)')
ylabel('neuron activity')
xlabel('Time in seconds')

%% Question b when A =2 

A = 2; % constant representing the spontaneous decay of the neuron, which for this question b is 2 
x_start = 0; % begin with an x value of 0, x(0) = 0 
x_inc = .001; % increments that I want to count by
x_end = 10; % final x value  
I = 0; % create the I variable 

% integrate dx/dt = -Ax + I

x = [0]; % creating an empty x vector 
dx = 0 ; %starting dx

time = x_start:x_inc:x_end;

for t = 1:length(time)  %time position, t=1 refers to the first time point (not time point 1)
    if time(t) >= 1 && time(t) <= 6 %time either below 1 or above 6
        I = 5; % I is equal to 5
    else 
        I = 0; % for all t points besides the ones specified, I would be equal to 0
    end
    dx = [-1 * A * x(t) + I] * x_inc; % formula
    x(end+1) = x(t) + dx; % change in x 
end       
        
x = x(1:end-1); % removing the last increment to make x and time the same vector 


%create figure 2
figure(2)
plot(time,x)
title('Leaky Integrator (b)')
ylabel('neuron activity')
xlabel('Time in seconds')
