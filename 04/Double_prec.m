% double_precision numbers

s = 0;
e = 1023;
M_bits = de2bi(1,52);
if e>0
    M = 1+bi2de(M_bits,'right-msb')*2^(-52);
else
    M = 0+bi2de(M_bits,'right-msb')*2^(-52);
end
disp((-1)^s * 2^(e-1023)*M)