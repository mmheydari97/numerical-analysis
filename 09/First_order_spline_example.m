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

ai = fi(1:n-1);
bi = diff(fi)./diff(xi);

x = linspace(3,9,100);
f = zeros(size(x));

for count = 1:100
    i = find(x(count)>=xi(1:n-1),1,'last');
    f(count) = ai(i) + bi(i) * (x(count)-xi(i));
end
figure
plot(x,f)
hold on
plot(xi,fi,'o')
xlim([2 10])
ylim([0 3])