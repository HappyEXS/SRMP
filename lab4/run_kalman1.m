% filtr Kalmana pierwszego rzêdu (sk³adowa sta³a)
clearvars;
close all;

N     = 100;  
std_r = 10;
x     = 1000;
std_u = 5;
F     = 1;
H     = 1;
R     = std_r^2;
Q     = std_u^2;

%% inicjalizacja
z = H*x + std_r*randn(1);
x_est = z;
P = std_r^2;

%% symulacja i filtracja
for k = 2:N  
  x(:,k) = F*x(:,k-1) + std_u*randn(1); 
  z(:,k) = H*x(:,k)   + std_r*randn(1);
  
  [x_est(:,k), P(:,:,k)] = kalman_filter(x_est(:,k-1), P(:,:,k-1), z(:,k), F, H, R, Q);
end

%% wyœwietlanie
n = 1:N;
figure(1)
plot(n, x_est(1, :), n, x(1, :), n, z, '.', 'linewidth', 1.5, 'markersize', 15);

e = x-x_est;
P1 = sqrt(P(1,1,:));
P1 = P1(:);
figure(4)
plot(n, e(1,:), n, -3*P1, 'r--', n, 3*P1, 'r--', 'linewidth', 1.5);

