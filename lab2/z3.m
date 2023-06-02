close all;
clear all;

prf = 1000;
prf2 = 700;

N = 10;
N_fft = 20;
fd = 800;

n = 1:N;
f = linspace(-0.5, 0.5-1/N, N);
f_fft = linspace(-0.5, 0.5-1/N_fft, N_fft);
f1 = f_fft*prf;
f2 = f_fft*prf2;

s1 = exp(1j*2*pi*fd/prf*n);
S1 = fftshift(fft(s1, N_fft));

s2 = exp(1j*2*pi*fd/prf2*n);
S2 = fftshift(fft(s2, N_fft));
plot(f1, abs(S1), f2, abs(S2))


