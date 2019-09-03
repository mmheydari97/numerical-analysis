clear
func = @(x) exp(-x)-x;
dfunc = @(x) - exp(-x)-1;
N = 100;
xn = 1;
en = 1;
iter = 0;
while (en>1e-15) && (iter<N)
    iter = iter + 1;
    xn = xn - func(xn)/dfunc(xn);
    en = abs(func(xn));
end