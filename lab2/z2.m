close all;
clear all;

prf = [500 600 700];

N = 100;
fd = 0:10:5000;
pri = 1./prf;
t = 0;

for m=1:length(fd)
    x = zeros(N, 1);
    for k=1:N
        pri_curr = pri(mod(k-1, length(pri))+1);
        t = t + pri_curr;
        x(k) = exp(1j*2*pi*fd(m)*t);
        %x(k) = exp(1j*2Jpi*ff*t);
    end
    y = filter([1 -1], 1, x);
    ampl(m) = mean(abs(y(10:end)).^2);
end

%figure(20)
%plot(fd, 10*log10(ampl))
%axis([min(fd) max(fd) -50 10])
%title('10*log10(ampl)')

prf_mean = mean(prf);
H1 = 1 - exp(1j*2*pi*pri(1)*fd);
H2 = 1 - exp(1j*2*pi*pri(2)*fd);

H_mean = (abs(H1).^2 + abs(H2).^2)/2;

plot(fd, 20*log10(abs(H1)), fd, 20*log10(abs(H2)), fd, 10*log10(abs(H_mean)))
