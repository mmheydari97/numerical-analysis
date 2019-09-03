clear

f = @(x) exp(x);
fp = @(x) exp(x);
fpp = @(x) exp(x);

% f =@(x) besselj(0,x);
% fp = @(x) -besselj(1,x);

x0 = 1;

k = 0:60;
h = 2.^-k;

D0 =@(h) (f(x0+h)-f(x0-h))./h/2;
D1 =@(h) (4*D0(h)-D0(2*h))/3;
D2 =@(h) (16*D1(h)-D1(2*h))/15;
figure
loglog(h,abs((D0(h)-fp(x0))/fp(x0)))
hold all
loglog(h,abs((D1(h)-fp(x0))/fp(x0)))
loglog(h,abs((D2(h)-fp(x0))/fp(x0)))
xlabel('h')
ylabel('Relative error')