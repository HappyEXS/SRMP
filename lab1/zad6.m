clear all;
close all;

B = 5e6;
fs = 10e6;
fc = 10e9;
T = 10e-6;
fd1 = 0;
fd2 = 2*8e3/3e8*fc;
r1 = 10e3;

r = (0: 3e8/2/fs: 20e3);
x1 = mychirp(r, r1, B, T).*exp(1j*2*pi*fd1/fs*(1:length(r)));
x2 = mychirp(r, r1, B, T).*exp(1j*2*pi*fd2/fs*(1:length(r)));
w1 = 1*(randn(size(r))+1j*randn(size(r)));
w2 = 1*(randn(size(r))+1j*randn(size(r)));
x1 = x1+w1;
x2 = x2+w2;

%plot(r, x1, r, x2);

rh = 3e8/2*(-T/2:1/fs:T/2);
h = mychirp(rh, 0, B, T);
h = conj(flipud(h));
h = h.*hamming(length(h))';

y1 = filter(h, 1, x1)/length(h);
y2 = filter(h, 1, x2)/length(h);

rf = r - 3e8*T/2/2;

plot(rf, abs(y1), rf, abs(y2));