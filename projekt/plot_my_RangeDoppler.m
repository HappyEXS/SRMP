% Parametry nagraniasamplesInPulse
PRF = 1000;
Fc = 25.26e9;
B = 1e9;
samplesInPulse = 1000;
Time = 5;

% Pozostałe stałe
numPulses = 100;    % liczba sondowań do jednej mapy
k = 1000;           % przesunięcie - od którego sondowania zaczynamy

%% Wczytanie pliku z sygnałem
[X, ch0, ch1] = readSignal('Output23.bin');

%% Macierz sondowań
rx_puls = zeros(samplesInPulse, numPulses);
for i = 1:numPulses
    rx_puls(:,i) = ch0(k*samplesInPulse+(i-1)*samplesInPulse+1 : (k*samplesInPulse+i*samplesInPulse));
end

%% my_RangeDoppler
[image, x, y] = my_RangeDoppler(rx_puls,numPulses,samplesInPulse,PRF,Fc,B);

%% Wyświetlanie obrazu
imagesc(x,y,image);
title("my-Range-doppler");
xlabel('Prędkość (m/s)');
ylabel('Ddległość (m)');
colorbar;