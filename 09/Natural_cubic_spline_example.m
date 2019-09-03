clear
xi = [3.0;
    4.5;
    7.0;
    9.0;];
fi = [2.5;
    1.0;
    2.5;
    0.5;];
n = length(xi);

hi = diff(xi);
df = diff(fi);

ai = fi(1:n-1);

Coef = zeros(n);
RH = zeros(n,1);

Coef(1,1) = 1;
for ii = 2:n-1
    Coef(ii,ii-1) = hi(ii-1);
    Coef(ii,ii) = 2*(hi(ii-1)+hi(ii));
    Coef(ii,ii+1) = hi(ii);
    RH(ii) = 3*(df(ii)/hi(ii)-df(ii-1)/hi(ii-1));
end
Coef(n,n) = 1;

ci = Coef\RH;
di = diff(ci)./hi/3;

for ii = 1: n-1
    bi(ii) = df(ii)/hi(ii) - hi(ii)/3*(2*ci(ii)+ci(ii+1));
end

x = linspace(3,9);
f = zeros(size(x));

for count = 1:100
    i = find(x(count)>=xi(1:n-1),1,'last');
    f(count) = ai(i) + bi(i) * (x(count)-xi(i)) + ci(i) * (x(count)-xi(i))^2 + ...
        di(i) * (x(count)-xi(i))^3;
end
figure
plot(x,f)
hold on
plot(xi,fi,'o')
xlim([2 10])
ylim([0 4])