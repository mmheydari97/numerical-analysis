clear
r = 1;
N = 200;
x = rand(N,1);
y = rand(N,1);
in = x.^2+y.^2<r^2;
s = sum(in);
fprintf('Pi is approximately: %f\n',s/N*4);

figure
xp = 0:0.01:1;
yp = sqrt(1-xp.^2);
line(xp,yp,'Color','k','LineWidth',3)
xlabel('x')
ylabel('y')
axis square
line(x(in),y(in),'LineStyle','none','Marker','o','MarkerSize',1,'Color','r')
line(x(~in),y(~in),'LineStyle','none','Marker','o','MarkerSize',1,'Color','b')