clear
func = @(x) -x.^-10+50;
xmin = 0.1;
xmax = 3;
delta = 1e-8;
disp(log2( (xmax-xmin)/delta))
xr_old = xmin-func(xmin)*(xmax-xmin)/(func(xmax)-func(xmin));
xr_new = xr_old+1;
iter = 0;
while abs(xr_old-xr_new)>delta
    iter = iter+1;
    if func(xr_new)*func(xmin)<0
        xmax = xr_new;
    elseif func(xr_new)*func(xmax)<0
        xmin = xr_new;
    elseif func(xr_new)==0;
        xmin = xr_new;
        xmax = xr_new;
    end
    xr_old = xr_new;
    xr_new = xmin-func(xmin)*(xmax-xmin)/(func(xmax)-func(xmin));
end
disp(iter)
disp(xr_new)
disp(abs(xr_new-pi/2))
