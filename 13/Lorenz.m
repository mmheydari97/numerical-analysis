function yp = Lorenz(t,y,s,r,b)
yp = [-s*y(1)+s*y(2);r*y(1)-y(2)-y(1)*y(3);-b*y(3)+y(1)*y(2)];