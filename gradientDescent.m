function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
theta_0 = 0;
theta_1 = 0;

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    for i = 1:m
    
        hypothesis(i) = X(i,:) * theta;
        errors(i) = hypothesis(i) - y(i);
    end;
    temp_1(1) = 0;
    temp_2(1) = 0;
    for i = 1:m
        temp_1(i+1) = temp_1(i) + (alpha * 1 / m) * errors(i);
        temp_2(i+1) = temp_2(i) + (alpha * 1 / m) * errors(i) * X(i,2);
    %   temp_1(i) = ((alpha * 1 / m) * ((X(i,:) * theta) - y(i)));
    %   temp_2(i) = ((alpha * 1 / m) * X(i,2) * ((X(i,:) * theta) - y(i)));
    end;
    
    theta(1,1) = theta(1,1) - temp_1(m+1);
    theta(2,1) = theta(2,1) - temp_2(m+1);


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
