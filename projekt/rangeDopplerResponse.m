% Parametry nagrania
PRF = 1000;
Fc = 25.26e9;
B = 1e9;
SamplesInPulse = 1000;
Time = 5;
T = 1/PRF;

% Pozostałe stałe
c = physconst('LightSpeed');
numPulses = 100;     % liczba sondowań do jednej mapy
k = 1000;            % przesunięcie - od którego sondowania zaczynamy
%% Wczytanie pliku z sygnałem
[X, ch0, ch1] = readSignal('Output23.bin');

%% Sygnał wysłany
waveform = phased.FMCWWaveform('SweepBandwidth',B,...
    'OutputFormat','Sweeps',...
    'NumSweeps',numPulses,...
    'SweepTime',1/PRF);

% plot(waveform)
%% Macierz impulsów
rx_puls = zeros(SamplesInPulse, numPulses);
for i = 1:numPulses
    rx_puls(:,i) = ch0(k*SamplesInPulse+(i-1)*SamplesInPulse+1 : (k*SamplesInPulse+i*SamplesInPulse));
end

%% Range-Doppler
rangedoppler = phased.RangeDopplerResponse(...
    'RangeMethod','FFt',...
    'PropagationSpeed',c,...
    'DopplerOutput','Speed', ...,
    'SampleRate', SamplesInPulse, ...
    'OperatingFrequency',Fc,...
    'SweepSlope', B);

%% Plot
plotResponse(rangedoppler,rx_puls, ...
    'Unit','db')
