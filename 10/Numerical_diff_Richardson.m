clear

f = @(x) exp(x);
fp = @(x) exp(x);

% f =@(x) besselj(0,x);
% fp = @(x) -besselj(1,x);

x0 = 1;

h = 2.^-(0:30);
figure
loglog(h,abs((D_Richardson(f,x0,h,0)-fp(x0))/fp(x0)))
hold all
for k = 1:5
    loglog(h,abs((D_Richardson(f,x0,h,k)-fp(x0))/fp(x0)))
end
legend('0','1','2','3','4','5')
xlabel('h')
ylabel('Relative error')