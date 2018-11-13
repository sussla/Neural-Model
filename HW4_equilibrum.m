%% Homework 4 (question A) %%

clc
clear all 

% set parameters 
A = 0.1; %constant specified in homework 
B = 1; %constant specified in homework 
I = [1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1];  
xs = zeros(10,1);

%for the additive equation of xi at equilibrium
figure(1);
for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h)));
    x = (((B.*i) - L) ./ (A));
    xs(h) = x;
end

plot(1:10,xs,'LineWidth',3);

%create figure 1 for additive xi
title('Actual xi Additive plot', 'FontSize',20)
ylabel('STM activity', 'FontSize', 18)
xlabel('Input pattern','FontSize', 18)

%for the additive equation of Xi at equilibrium
figure(2);
for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h))); % summation of all inhibitory terms without specific term 
    x = (((B.*i) - L) ./ (A));
    xs(h) = x;
end

xsnorm = xs / sum(xs);
xn = (xsnorm);
plot(1:10,xn,'LineWidth',3);

title('Normlaized Xi Additive plot', 'FontSize',20)
ylabel('STM activity', 'FontSize', 18)
xlabel('Input pattern','FontSize', 18)

%for the shunting equation of xi at equilibrium
figure(3);
for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h)));% summation of all inhibitory terms without specific term 
    x = ((B .* i)./(A + L));
    xs(h) = x;
end

plot(1:10,xs,'LineWidth',3);

%create figure 3 for shunting xi
title('Actual xi Shunting plot', 'FontSize',20)
ylabel('STM activity', 'FontSize', 18)
xlabel('Input pattern','FontSize', 18)

%for the shunting equation of Xi at equilibrium
figure(4);
for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h))); % summation of all inhibitory terms without specific term 
    x = ((B .* i)./(A + L)); 
    xs(h) = x;
end

xsnorm = xs / sum(xs);
xn = (xsnorm);
plot(1:10,xn,'LineWidth',3);

%create figure 4 for shunting Xi
title('Normalized Xi Shunting plot', 'FontSize',20)
ylabel('STM activity', 'FontSize', 18)
xlabel('Input pattern','FontSize', 18)

%part C new additive equation
figure(5);
for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h)));% summation of all inhibitory terms without specific term 
    x = (((B .*i) - L) ./ (A + i));
    xs(h) = x;
end

plot(1:10,xs,'LineWidth',3);

%create figure 5 for new part C additive equation
title('Actual xi Additive plot - Eq3', 'FontSize',20)
ylabel('STM activity', 'FontSize', 18)
xlabel('Input pattern','FontSize', 18)

%part C Normalized
figure(6);
for h = 1:10
    i = I(h);
    L = sum(I(I~=I(h))); % summation of all inhibitory terms without specific term 
    x = (((B .*i) - L) ./ (A + i));
    xs(h) = x;
end

xsnorm = xs / sum(xs);
xn = (xsnorm);
plot(1:10,xn,'LineWidth',3);

%create figure 6 for part C normalized
title('Normalized Additive plot - Eq3', 'FontSize',20)
ylabel('STM activity', 'FontSize', 18)
xlabel('Input pattern','FontSize', 18)