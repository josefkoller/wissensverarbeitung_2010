function [y_calc, mse, w] = plot_mse_alpha(x, y, space, degree, plot_style)
    x_length = length(x);
    X = ones(x_length, degree+1);
    for exponent = 0:degree
       X(:,exponent+1) = x .^ exponent;
    end

    space_length = length(space);
    mse = zeros(space_length, 1);
    y_calc = zeros(space_length, x_length);
    w = zeros(space_length, degree+1);
    for index = 1:length(space)
        alpha = space(index);
        current_w = calculate_weight( alpha, X, y, degree );

        current_y_calc = X * current_w;
        
        w(index, :) = current_w;
        y_calc(index, :) = current_y_calc;
        
        mse(index) = sum((current_y_calc - y) .^ 2)  / x_length;
    end

    semilogx(space, mse, plot_style);
    xlabel('alpha');
    ylabel('mean squared error');
end

