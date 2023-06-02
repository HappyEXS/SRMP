% jeden obiekt, krawêdŸ clutteru (zmienne t³o)
clear all;
close all;

B = 5e6;
fs = 10e6;
T = 10e-6;
r0 = 10e3;
N_win = 32;
N_guard = 10;
threshdB = 10;
tB = 10^(threshdB/20);

r = (0:3e8/2/fs:20e3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = my_chirp(r, r0, B, T);
w = randn(size(r))+1j*randn(size(r));
w(round(end/2):end) = 10*w(round(end/2):end);
x = x+w;

rh = 3e8/2*(-T/2:1/fs:T/2);
h = my_chirp(rh, 0, B, T);
h = h.*hamming(length(h))';

rf = r - 3e8*T/2/2;

h = conj(h(end:-1:1));
y = abs(filter(h, 1, x));

[mean_y, det_vec] = mo_cfar(y, N_win, N_guard, tB);

figure(1)
plot(rf, 20*log10(abs(y)), ...
    rf, 20*log10(mean_y), ...
    rf, 20*log10(mean_y*tB), ...
    rf, det_vec)


