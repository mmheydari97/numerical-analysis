clear
x = linspace(0,2);
y = x;
r = .02;
N = 200;
for ii = 1:N
    y = y*r;
end

w = y;
for ii = 1:N
    w = w/r;
end
figure
semilogy(x,abs(w-x))
xlabel('x')
ylabel('Absolute error')