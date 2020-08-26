clear;close all; clc

figure; hold on;
data = load('ex2data1.txt');
X = data(:, [1, 2]); 
y = data(:, 3);

% Plot the data with + indicating (y = 1) examples and o indicating (y = 0) examples.
plotData(X, y);

xlabel('Exam 1 score')
ylabel('Exam 2 score')
 
% % Specified in plot order
legend('Admitted', 'Not admitted')
hold off;



[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n+1,1);
[J, grad] = costFunction(initial_theta, X, y);


fprintf('Cost at initial theta (zeros): %f\n', J);
disp('Gradient at initial theta (zeros):'); 
disp(grad);

options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

p = predict(theta, X);
