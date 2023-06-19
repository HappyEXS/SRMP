function [image,x,y] = my_RangeDoppler(rx_puls,numPulses,samplesInPulse,PRF,Fc,B)
    T = 1/PRF;
    c = physconst('LightSpeed');
    %% FFt2 - dwuwymiarowa transformata    SamplesInImpulse
    rx_fft2 = fft2(rx_puls);
    rx_fft2 = 20*log10(abs(rx_fft2));
    %% Zamiana lewej strony z prawą (aby zerowa prędkość była na środku)
    tmp = rx_fft2(:, numPulses/2+1:numPulses);
    rx_swapped = zeros(samplesInPulse, numPulses);
    for i = 1:samplesInPulse
        rx_swapped(i, :) = cat(2, tmp(i, :), rx_fft2(i, 1:numPulses/2));
    end
    %% Zamiana górnej połowy z dolną (aby zerowa odległość była na środku)
    tmp = rx_swapped(samplesInPulse/2+1:samplesInPulse, :);
    rx_swapped2 = zeros(samplesInPulse, numPulses);
    for i = 1:numPulses
        rx_swapped2(:, i) = cat(1, tmp(:, i), rx_swapped(1:samplesInPulse/2, i));
    end
    %% Maksymalne zakresy wartości
    v_max = PRF * c / (4 * Fc);
    range_max = c * samplesInPulse * PRF / (4 * B / T);
    %% Wyjście
    x = [-v_max v_max];
    y = [range_max -range_max];
    image = rx_swapped2;
end