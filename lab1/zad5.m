clear all;
close all;

B = 5e6;
fs = 10e6;
T1 = 10e-6;
T2 = 100e-6;
r1 = 10e3;
deltaR = 3e8/2/B;
r2 = r1 + 3*deltaR;

r = (0: 3e8/2/fs: 20e3);
x1 = mychirp(r, r1, B, T1);
x2 = mychirp(r, r2, B, T1);
x1 = x1+0.3*x2;
w = 1*(randn(size(r))+1j*randn(size(r)));
x3 = x1+w;
%plot(r, abs(x1),r, abs(x3));

rh1 = 3e8/2*(-T1/2:1/fs:T1/2);
h1 = mychirp(rh1, 0, B, T1);
h1 = conj(flipud(h1));
h1 = h1.*hamming(length(h1))';

y1 = filter(h1, 1, x3)/length(h1);
rf1 = r - 3e8*T1/2/2;

plot(rf1, abs(y1));