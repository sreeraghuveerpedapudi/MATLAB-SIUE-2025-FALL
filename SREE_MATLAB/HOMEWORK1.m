%Homework_1
%Name:Sree Raghuveer Pedapudi
% Heat Capacity vs function
%Question:14.19
%Data:
T=[-50 -30 0 60 90 110];
c=[1250 1280 1350 1480 1580 1700];
%linear function%
[p1,c_lin]=linear_fit(T,c);
%quadratic function%
[p2,c_quad]=quadratic_fit(T,c);
%results%
    plot(T,c,'o');
    hold on;
    plot(T,c_lin,'b-','LineWidth',2);
    plot(T,c_quad,'r-','LineWidth',2);
    xlabel('Temperature'); 
    ylabel('Heat Capacity');
    title('Heat vs Temperature'); 
    legend('Data','Linear fit','Quadratic fit','Location','NorthWest');
    grid on


%---------------------14.20---------------------%
%Data
Time = [10 15 20 25 40 50 55 60 75];
Tens = [5 20 18 40 33 54 70 60 78];

[p3,Tens_lin]=linear_fit(Time,Tens);
Tens_32=polyval(p3,32);
fprintf('Tensile strength = %.2f\n',Tens_32); 

[m0,Tens_Zero]=zero_intercept_fit(Time,Tens);
Tens_Zero_32=m0*32;
fprintf('Tensile strength (Zero intercept) = %.2f\n', Tens_Zero_32);

% result %
figure;
plot(Time,Tens,'o');
hold on;
plot(Time,Tens_lin,'b-','LineWidth',2);
plot(Time,Tens_Zero,'r-','LineWidth',2);
xlabel('Time');
ylabel('Tensile Strength');
title('Time vs Tensile Strength');
legend('Data','Unconstrained line','Zero-intercept fit','Location','NorthWest');
grid on  

%functions%
%Linear Function%
function [p1,yfit]=linear_fit(x,y)
    p1 = polyfit(x, y, 1); 
    yfit = polyval(p1, x); 
    fprintf('Linear fit:y(x)=%.2f*x+%.2f\n',p1(1),p1(2));
end
%Quadratic Function%
function [p2,yfit]=quadratic_fit(x,y)
    p2 = polyfit(x, y, 2); 
    yfit = polyval(p2, x); 
    fprintf('Quadratic fit:y(x)=%.5f*x^2+%.2f*x+%.2f\n',p2(1),p2(2),p2(3)); 
end
function [m,yfit]=zero_intercept_fit(x,y)
    x=x(:); y=y(:);
    m = sum(y) / sum(x); 
    yfit = m * x; 
    fprintf('Zero_fit:y(x)=%.6f*x\n',m);
end