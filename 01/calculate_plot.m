
function calculate_plot( l,x,y,y_nonoise )
    x_length = length(x);
    mse = l;
    for degree = l
        X_matrix = ones(x_length, degree+1);
        for exponent = 0:degree
           X_matrix(:,exponent+1) = x .^ exponent;
        end
        w = (X_matrix' * X_matrix)^-1 * X_matrix' * y;
        y_calc = X_matrix * w;
        mse(degree+1) = sum((y_calc - y) .^ 2)  / x_length

       figure;
       plot(x, y, '.b');
       hold all;
       plot(x, y_calc, '-r');

       titles = ['input', 'approximated'];
       if nargin == 4
           plot(x, y_nonoise, '-g');
           legend('input', 'approximated', 'input without noise');
       else
           legend('input', 'approximated');           
       end
       xlabel('x'); 
       ylabel('y');
    end
    figure;
    plot(l,mse);
    title('Mean squared error as a function of the degree.');

end
