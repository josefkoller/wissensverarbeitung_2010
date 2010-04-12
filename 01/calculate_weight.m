function [ w ] = calculate_weight( alpha, X, y, degree )
    N = length(y);
    w = inv(alpha^2*eye(degree+1) + (X' * X) / N) * ((X'*y)/N);
end

