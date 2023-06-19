function [X, ch0, ch1] = readSignal(filename)
    fid   = fopen(filename);
    if (fid == -1)
      disp(['Unable to open file ' filename]);
      return
    end
    data = fread(fid, Inf, 'int16');
    ch0 = data(1:2:end);    % część rzeczywista sygnału
    ch1 = data(2:2:end);    % część urojona sugnału
    
    X = ch0 + 1j*ch1;
end