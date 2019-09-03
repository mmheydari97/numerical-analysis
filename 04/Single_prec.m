% single_precision numbers
%       s -      e      -               M                             -
bits = [0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];

s = bits(1);
e = bi2de(bits(2:9),'left-msb');
if e>0
    M = 1+bi2de(bits(10:32),'left-msb')*2^(-23);
else
    M = 0+bi2de(bits(10:32),'left-msb')*2^(-23);
end
disp((-1)^s * 2^(e-127)*M)