close all;
clear all;

N = 500;
std_c = 0.05;
n = 1:N;
f = linspace(-0.5, 0.5-1/N, N);

w = 1*(randn(N,1)+1j*randn(N,1));
W = fftshift(fft(w));
C = exp(-f.^2/2/std_c.^2);
F = W.*C.';
sf = ifft(fftshift(F));

plot(f, abs(F), f, abs(sf))

h2 = []; 
x2 = 
H2 = fftshift(fft(h2,N));
X2 = fftshift(fft(x2, N));

h2 =
x3 = 
H3 = fftshift(fft(h3,N));
X3 = fftshift(fft(x3, N));

plot(f, abs(F), f, abs(X2), f, abs(X3))
