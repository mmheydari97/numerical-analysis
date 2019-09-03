clear
Nsample = 500;
t = linspace(0,1,Nsample);

Nfit = 5;
A0 = 0.3;
A = rand(Nfit,1);
B = rand(Nfit,1);

y = A0;
for n = 1:Nfit
    y = y + A(n)*cos(2*pi*n*t) + B(n)*sin(2*pi*n*t);
end

A0_e = sum(y)/Nsample;
for n = 1:Nfit
    A_e(n) = 2/Nsample*sum(y.*cos(n*2*pi*t));
    B_e(n) = 2/Nsample*sum(y.*sin(n*2*pi*t));
end

y_e = A0;
for n = 1:Nfit
    y_e = y_e + A_e(n)*cos(2*pi*n*t) + B_e(n)*sin(2*pi*n*t);
end

figure
hold all
plot(t,y)
plot(t,y_e)
xlabel('t')
ylabel('y')

