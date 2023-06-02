% Order Statiscic CFAR
% sortowanie wartości z okna i mediana (środkowa wartość)
function [mean_level, det_vec] = os_cfar(x, Nw, Ng, Th)
    mean_level = zeros(length(x),1);
    det_vec = zeros(length(x),1);
    for k = 1+Ng+Nw:length(x)-Ng-Nw
        left = x(k-Nw-Ng : k-Ng-1);
        right = x(k+Nw+1 : k+Nw+Ng);
        sorted = sort([left right]);
        mean_level(k) = sorted(round(end/2));
        if x(k) > mean_level(k) * Th
            det_vec(k) = 1;
        end
    end
end