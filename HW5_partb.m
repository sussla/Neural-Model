%%HW5: Recurrent Competitive Fields: Part 2%%

clc
clear all 

%First g(w)

%Set parameters 
A = 1; % parameter set by assignment 
B = 3; % parameter set by assignment 
F = 0.25; % set parameter by assignment
SP = [0.7, 0.6, 0.8, 0.9, 0.5, 0.3, 0.5, 0.7, 0.8, 0.4]; %xi pattern indicated in part a of homework 

%set timing and start pattern
t_start = 0; % begin with an x value of 0, x(0) = 0 
t_inc = .001; % increments that I want to count by
t_end = 10; % final x value  
time = t_start:t_inc:t_end;
x = zeros(length(SP),length(time));
dx = 0;

%loop for (i) where f(w) = w

for t = 1:(length(time)-1)
    for i = 1:10
    L = sum(x(1:10~=i,t)); %creating L from the inhibitory term
    if time(t) <= 1
    I = SP(i);
    else 
    I = 0;
    end
        dx = ((-1 .* A .* x(i,t))+(B -x(i,t)).*(x(i,t)+ I) - (x(i,t).*L)) * t_inc;
        x(i,t+1) = x(i,t) + dx;
    end
end 

XN = x(:,:)./sum(x(:,:)); %normalizing the X values

figure(1);
First_plot = surf(time, 1:10, XN);
First_plot.FaceAlpha=0.8;
First_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
title('(i) f(w)=w ', 'FontSize',18)

%bar graph for figures
figure(2);
norm = x(:,end)./(sum(x(:,end)));
bar(1:10,norm);
xlabel('Index of Neurons')
ylabel('Activity')
title('(i) f(w)=w ', 'FontSize',18)

%% Second f(w)

%loop for (ii) where f(w) = w^2
for t = 1:(length(time)-1) 
    for i = 1:10
    Sq_X = (x(i,t))^2;
    Square = x(1:10~=i,t).^2;
    Sq_L = sum(Square); %creating L from the inhibitory term 
    if time(t) <= 1
    I = SP(i);
    else 
    I = 0;
    end
        dx = ((-1 .* A .* x(i,t))+(B -x(i,t)).*(Sq_X+ I) - (x(i,t).*Sq_L)) * t_inc;
        x(i,t+1)= x(i,t) + dx;
    end
end

XN = x(:,:)./sum(x(:,:)); %normalizing the X values

figure(3);
Second_plot = surf(time, 1:10, XN);
Second_plot.FaceAlpha=0.8;
Second_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
title('(ii) f(w)= w^2 ', 'FontSize',18)

%bar graph for figures
figure(4);
norm = x(:,end)./(sum(x(:,end)));
bar(1:10,norm);
axis([0 10 0 1.5]);
xlabel('Index of Neurons')
ylabel('Activity')
title('(ii) f(w)=w^2 ', 'FontSize',18)

%% Third f(w) 


%loop for (iii) where f(w) = w/(F + w)
for t = 1:(length(time)-1)
    for i = 1:10
    Third_X = (x(i,t))./(F + x(i,t));
    third = (x(1:10~=i,t)./(F+x(1:10~=i,t)));
    Third_L = sum(third); %creating L from the inhibitory term
    if time(t) <= 1
    I = SP(i);
    else 
    I = 0;
    end
        dx = ((-1 .* A .* x(i,t))+(B -x(i,t)).*(Third_X + I) - (x(i,t).*Third_L)) * t_inc;
        x(i,t+1)= x(i,t) + dx;
    end
end

XN = x(:,:)./sum(x(:,:)); %normalizing the X values

figure(5);
Third_plot = surf(time, 1:10, XN);
Third_plot.FaceAlpha=0.8;
Third_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
title('(iii) f(w)= w/(F+w)  ', 'FontSize',18)

%bar graph for figures
figure(6);
norm = x(:,end)./(sum(x(:,end)));
bar(1:10,norm);
axis([0 10 0 1]);
xlabel('Index of Neurons')
ylabel('Activity')
title('(iii) f(w)= w/(F+w)  ', 'FontSize',18)
%% Fourth f(w) 


%loop for (iv) where f(w) = w^2/(F + w^2)
for t = 1:(length(time)-1)
    for i = 1:10
    IV_X = (x(i,t)^2)./(F + x(i,t)^2);
    Square = x(1:10~=i,t).^2;
    iv = (Square)./(F + Square); %creating L from the inhibitory term
    IV_L = sum(iv);
    if time(t) <= 1
    I = SP(i);
    else 
    I = 0;
    end
        dx = ((-1 .* A .* x(i,t))+(B -x(i,t)).*(IV_X + I) - (x(i,t).*IV_L)) * t_inc;
        x(i,t+1)= x(i,t) + dx;
    end
end

XN = x(:,:)./sum(x(:,:)); %normalizing the X values

figure(7);
Fourth_plot = surf(time, 1:10, XN);
Fourth_plot.FaceAlpha=0.8;
Fourth_plot.LineStyle='none';
xlabel('Time')
zlabel('Activity')
ylabel('Input')
set(gca, 'fontsize',18)
title('(iv) f(w)= w^2/(F+w^2)  ', 'FontSize',18)

%bar graph for figures
figure(8);
norm = x(:,end)./(sum(x(:,end)));
bar(1:10,norm);
axis([0 10 0 1]);
xlabel('Index of Neurons')
ylabel('Activity')
title('(iv) f(w)= w^2/(F+w^2)  ', 'FontSize',18)