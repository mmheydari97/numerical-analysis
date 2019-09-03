clear

% f = @(x) exp(x);
% fp = @(x) exp(x);

f =@(x) besselj(0,x);
fp = @(x) -besselj(1,x);

x0 = 1;

k = 1:60;
h = 2.^-k;
Dn = (-f(x0+2*h)+4*f(x0+h)-3*f(x0));
D = Dn./h/2;
figure
loglog(h,abs((D-fp(x0))/fp(x0)))
xlabel('h')
ylabel('Relative error')