% References
% Problem is example 5, https://www.kalmanfilter.net/kalman1d.html 
% Matlab Plotting https://www.mathworks.com/help/matlab/ref/plot.html 

% Define system model
x_true = 50; %True Height of Buildings
z = [47.84, 48.31, 52.56, 54.17, 49.37, 42.56, 46.73, 52.62, 50.85, 49.76];% Simulate measurement
R = 49; % Measurement noise covariance

% Set initial values
N = length(z);  % Number of measurements
P = zeros(N, 1);  % Array to store error covariance
K = zeros(N, 1);  % Array to store Kalman gain
P_minus = zeros(N, 1);  % Array to store predicted error covariance

% Initialize the first value of P and P_minus
P(1) = 225; % Initial error covariance
P_minus(1) = 225; % Initial predicted error covariance

% Initialize the first value of K using the first value of P_minus
 K(1) = P_minus(1)/(P_minus(1) + R); % Initial Kalman gain

% Initialize the state estimate
x_hat(1) = 60; % Initial state estimate

% Loop over measurements
for t = 2:N
    % Measure
    x = x_hat ; % Simulate state
    
    % Predict state and error covariance
    x_hat_minus(t) = x_hat(t-1); % Predicted state estimate
    P_minus(t) = P(t-1); % Predicted error covariance

    % Update state estimate and error covariance
    K(t) = P_minus(t)/(P_minus(t) + R); % Kalman gain
    x_hat(t) = x_hat_minus(t) + K(t)*(z(t) - x_hat_minus(t)); % Updated state estimate
    P(t) = (1 - K(t))*P_minus(t); % Updated error covariance
end

%Plot Measurement data and Estimation data
figure;
t = 1:N;
plot(t, z, 'ko-', 'LineWidth', 1); % Plot measurement data
hold on; 
%hold on is used to hold the current plot so that we can add more plots to the same figure.
plot(t, x_hat(t), 'rsquare-', 'LineWidth', 1); % Estimated value
hold on;
plot(t, x_true*ones(N,1), 'g', 'LineWidth', 1); %True value
hold on;
plot(1, 60*ones(N,1), '*'); % Initialization value
xlabel('Measurement Number');
ylabel('Height(m)');
legend('Measurement', 'Estimation', 'True Value', 'Initialization');
title('Kalman Filter for Building Height Estimation');
axis ([0 11 40 65]);

% Plot Kalman Gain
figure;
plot(t, K, 'bo-', 'LineWidth', 1); % Kalman Gain values against the measurement number
title('Kalman Gain');
xlabel('Measurement Number');
ylabel('Kalman Gain');
axis ([0 11 0 0.9]);
