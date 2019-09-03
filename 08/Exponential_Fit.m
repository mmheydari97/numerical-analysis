clear
Nfit = 5;
Y = rand(Nfit,1);

y = zeros(Nfit,1);
for j = 0:Nfit-1
    for k = 0:Nfit-1
        y(j+1) = y(j+1) + Y(k+1)*exp(1i*k*2*pi/Nfit*j)/Nfit;
    end
end

Y_e = zeros(Nfit,1);

for k = 0:Nfit-1
    for j = 0:Nfit-1
        Y_e(k+1) = Y_e(k+1) + y(j+1)*exp(-1i*k*2*pi/Nfit*j);
    end
end
