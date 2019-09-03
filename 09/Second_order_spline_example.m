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

Coef = zeros(2*(n-1));
RH = zeros(2*(n-1),1);

Coef(1:n-1,1:n-1) = diag(hi);
Coef(1:n-1,n:2*(n-1)) = diag(hi).^2;
RH(1:n-1) = df;

Coef(n:2*(n-1),1:n-1) = eye(n-1) - circshift(eye(n-1),-1);
Coef(2*(n-1),1:n-1) = 0;
Coef(n:2*(n-1)-1,n:2*(n-1)-1) = 2*diag(hi(1:n-2));

Coef(2*(n-1),n) = 1;

res = Coef\RH;
bi = res(1:n-1);
ci = res(n:2*(n-1));
x = linspace(3,9);
f = zeros(size(x));

for count = 1:100
    i = find(x(count)>=xi(1:n-1),1,'last');
    f(count) = ai(i) + bi(i) * (x(count)-xi(i)) + ci(i) * (x(count)-xi(i))^2;
end
figure
plot(x,f)
hold on
plot(xi,fi,'o')
xlim([2 10])
ylim([0 4])