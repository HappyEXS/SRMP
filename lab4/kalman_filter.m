function [X, P] = kalman_filter(X, P, Z, F, H, R, Q)
% X - state vector
% Z - measurement vector
% F - state transformation matrix
% H - state-to-measurement transformation matrix
% R - measurement error matrix
% Q - state error matrix
% P - prediction error matrix

I = eye(length(X));

% predict
X = F * X;
P = F*P*F' + Q;

% update
K = P*H' * inv(H*P*H'+R);
X = X + K*(Z-H*X);
P = (I - K*H) * P;


