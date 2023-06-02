%% dwuwymiarowy filtr Kalmana drugiego rzêdu (odleg³oœæ+prêdkoœæ x,y)
clearvars;
close all;

N     = 100;
T     = 5;
std_x = 30;
std_y = 30;
std_v = 1;
std_u = 1;
% std_u = 1;
F_p = [1 T;...
       0 1];
F = blkdiag(F_p, F_p);
H = [1 0 0 0;
     0 0 1 0];
R = diag([std_x^2, std_y^2]);

Q_p = std_u^2*[T; 1]*[T; 1]';
Q = blkdiag(Q_p, Q_p);

%% inicjalizacja
x = [1000; std_v*randn(1); 1000; std_v*randn(1)];
z = H*x + [std_x*randn(1); std_y*randn(1)];
x_est = [z(1); 0; z(2); 0];
P = diag([std_x^2 std_v^2 std_y^2 std_v^2 ]);

%% symulacja i filtracja
for k = 2:N
  x(:, k) = F*x(:, k-1) + std_u*randn(1)*[T; 1; T; 1]; 
  z(:, k) = H*x(:, k)   + [std_x*randn(1); std_y*randn(1)];
  
  [x_est(:, k), P(:,:,k)] = kalman_filter(x_est(:,k-1), P(:,:,k-1), z(:, k), F, H, R, Q);
end

%% wyœwietlanie
n = 1:N;
figure(1)
plot(n, x_est(1, :), n, x(1, :), n, z(1,:), '.', 'linewidth', 1.5, 'markersize', 15);

figure(11)
plot(n, x_est(2, :), n, x(2, :), 'linewidth', 1.5, 'markersize', 15);

figure(111)
plot(n, x_est(3, :), n, x(3, :), n, z(2,:), '.', 'linewidth', 1.5, 'markersize', 15);

figure(1111)
plot(n, x_est(4, :), n, x(4, :), 'linewidth', 1.5, 'markersize', 15);

e = x-x_est;
P1 = sqrt(P(1,1,:));
P1 = P1(:);
figure(4)
plot(n, e(1,:),n, -3*P1, 'r--', n, 3*P1, 'r--', 'linewidth', 1.5);

P2 = sqrt(P(2,2,:));
P2 = P2(:);

figure(5)
plot(n, e(2,:),n, -3*P2, 'r--', n, 3*P2, 'r--', 'linewidth', 1.5);

P3 = sqrt(P(3,3,:));
P3 = P3(:);
figure(6)
plot(n, e(3,:), n, -3*P3, 'r--', n, 3*P3, 'r--', 'linewidth', 1.5);

P4 = sqrt(P(4,4,:));
P4 = P4(:);
figure(7)
plot(n, e(4,:), n, -3*P4, 'r--', n, 3*P4, 'r--', 'linewidth', 1.5);

figure(8)
plot(x(1, :), x(3,:), x_est(1, :), x_est(3, :), z(1,:), z(2,:), '.', 'linewidth', 1.5, 'markersize', 15);

