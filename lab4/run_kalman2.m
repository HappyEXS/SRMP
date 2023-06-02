%% filtr Kalmana drugiego rzêdu (odleg³oœæ+prêdkoœæ)
clearvars;
close all;

N     = 100;
T     = 5;
std_r = 50;
std_v = 5;
std_u = 1;
%std_u = 1;
F     = [1 T;...
         0 1];
H     = [1 0];
R     = std_r^2;
Q     = std_u^2*[T; 1]*[T; 1]';

%% inicjalizacja
x = [1000; std_v*randn(1)];
z = H*x + std_r*randn(1);
x_est = [z; 0];
P = diag([std_r^2 std_v^2]);

%% symulacja i filtracja
for k = 2:N
  x(:, k) = F*x(:, k-1) + std_u*randn(1)*[T; 1]; 
  z(:, k) = H*x(:, k)   + std_r*randn(1);
  
  [x_est(:, k), P(:,:,k)] = kalman_filter(x_est(:,k-1), P(:,:,k-1), z(:, k), F, H, R, Q);
end

%% wyœwietlanie
n = 1:N;
figure(1)
plot(n, x_est(1, :), n, x(1, :), n, z, '.', 'linewidth', 1.5, 'markersize', 15);

figure(11)
plot(n, x_est(2, :), n, x(2, :), 'linewidth', 1.5, 'markersize', 15);

e = x-x_est;
P1 = sqrt(P(1,1,:));
P1 = P1(:);
figure(4)
plot(n, e(1,:), n, -3*P1, 'r--', n, 3*P1, 'r--', 'linewidth', 1.5);

P2 = sqrt(P(2,2,:));
P2 = P2(:);
figure(5)
plot(n, e(2,:), n, -3*P2, 'r--',  n, 3*P2, 'r--', 'linewidth', 1.5);

