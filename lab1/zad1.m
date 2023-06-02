clear all;
close all;

B = 5e6;
fs = 10e6;
T1 = 10e-6;
r0 = 10e3;

r = (0: 3e8/2/fs: 20e3);
x1 = mychirp(r, r0, B, T1);

figure(1);
plot(r, real(x1), r, imag(x1));
%plot(r, abs(x1));