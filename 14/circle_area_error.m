clear
r = 1;
N = 10000;
s = zeros(N,1);
for n = 1:N
    x = rand(n,1);
    y = rand(n,1);
    in = x.^2+y.^2<r^2;
    s(n) = sum(in)/n*4;
end
figure
loglog(1:N,abs(s-pi)/pi)
hold on
loglog(1:N,1./sqrt(1:N))
xlabel('N')
ylabel('relative error')