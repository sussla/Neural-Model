%%HW5: Recurrent Competitive Fields: Part 2%%

clc
clear all 

%Set parameters 
A = 1; % parameter set by assignment 
B = 3; % parameter set by assignment 
F = 0.2; % set parameter by assignment
SP = [0.2, 0.6, 0.9, 0.6, 0.2, 0.1, 0.4, 0.8, 0.4, 0.1]; %xi pattern indicated in part a of homework 

%set timing and start pattern
t_start = 0; % begin with an x value of 0, x(0) = 0 
t_inc = .001; % increments that I want to count by
t_end = 10; % final x value  
time = t_start:t_inc:t_end;
x = zeros(length(SP),length(time));
dx = 0;

%loop for (i) where f(w) = w
for i = 1:10
    for t = 1:(length(time)-1)
    if time(t) <= 1
    I = SP(i);
    L = sum(SP(SP~=SP(i))); %creating L from the inhibitory term
    else 
    I = 0;
    L = 0;
    end
        dx = ((-1 .* A .* x(i,t))+(B -x(i,t)).*(x(i,t)+ I) - (x(i,t).*L)) * t_inc;
        x(i,t+1) = x(i,t) + dx;
    end
end

figure(1);
Add_plot = surf(time, 1:10, x);
Add_plot.FaceAlpha=0.8;
Add_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
title('(i) f(w)=w ', 'FontSize',20)

%loop for (ii) where f(w) = w^2
for i = 1:10
    for t = 1:(length(time)-1)
    if time(t) <= 1
    I = SP(i);
    L = sum(SP(SP~=SP(i))); %creating L from the inhibitory term
    Sq_L = L^2;
    Sq_X = (x(i,t))^2;
    else 
    I = 0;
    L = 0;
    end
        dx = ((-1 .* A .* x(i,t))+(B -x(i,t)).*(Sq_X+ I) - (x(i,t).*Sq_L)) * t_inc;
        x(i,t+1)= x(i,t) + dx;
    end
end

figure(2);
Add_plot = surf(time, 1:10, x);
Add_plot.FaceAlpha=0.8;
Add_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
title('(ii) f(w)= w^2 ', 'FontSize',20)


%loop for (iii) where f(w) = w/(F + w)
for i = 1:10
    for t = 1:(length(time)-1)
    if time(t) <= 1
    I = SP(i);
    L = sum(SP(SP~=SP(i))); %creating L from the inhibitory term
    Third_L = (L)./(F + L);
    Third_X = (x(i,t))./(F + x(i,t));
    else 
    I = 0;
    L = 0;
    end
        dx = ((-1 .* A .* x(i,t))+(B -x(i,t)).*(Third_X + I) - (x(i,t).*Third_L)) * t_inc;
        x(i,t+1)= x(i,t) + dx;
    end
end

figure(3);
Add_plot = surf(time, 1:10, x);
Add_plot.FaceAlpha=0.8;
Add_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
title('(iii) f(w)= w/(F+w)  ', 'FontSize',20)


%loop for (iv) where f(w) = w^2/(F + w^2)
for i = 1:10
    for t = 1:(length(time)-1)
    if time(t) <= 1
    I = SP(i);
    L = sum(SP(SP~=SP(i))); %creating L from the inhibitory term
    IV_L = (L^2)./(F + L^2);
    IV_X = (x(i,t)^2)./(F + x(i,t)^2);
    else 
    I = 0;
    L = 0;
    end
        dx = ((-1 .* A .* x(i,t))+(B -x(i,t)).*(IV_X + I) - (x(i,t).*IV_L)) * t_inc;
        x(i,t+1)= x(i,t) + dx;
    end
end

figure(4);
Add_plot = surf(time, 1:10, x);
Add_plot.FaceAlpha=0.8;
Add_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
title('(iv) f(w)= w^2/(F+w^2)  ', 'FontSize',20)