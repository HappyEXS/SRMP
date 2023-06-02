clear all;
close all;

B = 5e6;
fs = 10e6;
T1 = 10e-6;
T2 = 100e-6;
r1 = 10e3;

r = (0: 3e8/2/fs: 50e3);
x1 = mychirp(r, r1, B, T1);
x2 = mychirp(r, r1, B, T2);
w = 1*(randn(size(r))+1j*randn(size(r)));
x1 = x1+w;
x2 = x2+w;

%plot(r, x1, r, x2);

rh1 = 3e8/2*(-T1/2:1/fs:T1/2);
rh2 = 3e8/2*(-T2/2:1/fs:T2/2);

h1 = mychirp(rh1, 0, B, T1);
h1 = conj(flipud(h1));

h2 = mychirp(rh2, 0, B, T2);
h2 = conj(flipud(h2));

y1 = filter(h1, 1, x1)/length(h1);
y2 = filter(h2, 1, x2)/length(h2);

rf1 = r - 3e8*T1/2/2;
rf2 = r - 3e8*T2/2/2;

plot(rf1, abs(y1), rf2, abs(y2));