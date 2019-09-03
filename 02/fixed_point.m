clear
N = 100;
func = @(x) exp(-x);
xn = 1;
en = 1;
iter = 0;
while (en>1e-15) && (iter<N)
    iter = iter + 1;
    xn = func(xn);
    en = abs(func(xn)-xn);
end