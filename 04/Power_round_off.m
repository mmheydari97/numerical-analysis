clear
x = linspace(0,2);
y = x;
N = 200;
for ii = 1:N
    y = sqrt(y);
end

w = y;
for ii = 1:N
    w = w.^2;
end
figure
semilogy(x,(abs(w-x)))
xlabel('x')
ylabel('Absolute error')