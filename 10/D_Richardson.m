function out = D_Richardson(f,x,h,k)

if k==0
    out = (f(x+h)-f(x-h))./h/2;
else
    out = (4^k*D_Richardson(f,x,h,k-1)-D_Richardson(f,x,2*h,k-1))/(4^k-1);
end
