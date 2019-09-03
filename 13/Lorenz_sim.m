clear
s = 10; r = 28; b = 8/3;
tspan=[0 20];y0=[5 5 5];
h = 0.03125;
[t y] = rk4sys(@Lorenz,tspan,y0,h,s,r,b);
figure
plot(t,y(:,1))

y0=[5.001 5 5];
[t y] = rk4sys(@Lorenz,tspan,y0,h,s,r,b);
hold on
plot(t,y(:,1))
xlabel('t'); ylabel('x')
legend('x=y=z=5','x=5.001,y=z=5')
figure
plot3(y(:,1),y(:,2),y(:,3)) %'plot3' is the command to make 3D plot
xlabel('x')
ylabel('y')
zlabel('z')