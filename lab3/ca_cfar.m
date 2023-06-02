function [mean_level, det_vec] = ca_cfar(x, Nw, Ng, Th)
    mean_level = zeros(length(x),1);
    det_vec = zeros(length(x),1);
    for k = 1+Ng+Nw:length(x)-Ng-Nw
        mean_left = mean(x(k-Nw-Ng : k-Ng-1));
        mean_right = mean(x(k+Nw+1 : k+Nw+Ng));
        mean_level(k) = 0.5 * mean(mean_right + mean_left);
        if x(k) > mean_level(k) * Th
            det_vec(k) = 1;
        end
    end
end