function [ X ] = calculate_matrix( x, degree )
    x_length = length(x);
    X = ones(x_length, degree+1);
    for exponent = 0:degree
       X(:,exponent+1) = x .^ exponent;
    end
end
