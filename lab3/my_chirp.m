function x = my_chirp(r, r0, B, T)

t = 2*(r-r0)/3e8;
x = exp(1j*pi*B/T*t.^2).*rectpuls(t/T);
