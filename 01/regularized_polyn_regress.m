% regularized polynomial regression


clear all;
close all;

load('linearregression_homework.mat');
degree = 10;
space = logspace(-3, 0, 10);
train_plot_style = 'b-';
test_plot_style =  'm-'; 

figure;
[calc_y_train, mse_train, w_train] = plot_mse_alpha(x_train, y_train, space, degree, train_plot_style);
hold on;
[calc_y_test, mse_test, w_test] = plot_mse_alpha(x_test, y_test, space, degree, test_plot_style);
legend('training data', 'test data');
hold off;
% What is the best alpha?
% TODO
% Interpret your result!
% TODO


lowest_alpha_index = 1;
highest_alpha_index = length(space);

figure;
hold on;
%for x = [x_train, x_test]
    [min_mse, best_alpha_index] = min(mse_train);
    
    handle = plot(x_train, calc_y_train(lowest_alpha_index, :), 'b-');
    set(handle, 'linewidth', 3);
    plot(x_train, calc_y_train(highest_alpha_index, :), 'g-');
    plot(x_train, calc_y_train(best_alpha_index, :), 'r-');
    
    plot(x_train, y_train, 'co');
    plot(x_test, y_test_nonoise, 'm-');
%end
xlabel('x');
ylabel('y');
legend('y for lowest alpha', 'y for highest alpha', 'y for best alpha', 'training points', 'target function');
title('y for different alphas');
hold off;
    
w_mean = zeros(length(space), 1);
for index = 1:length(space)
   w = w_train(index, :)
   w_mean(index) = mean(abs(w));
end

figure;
semilogx(space, w_mean);
title('mean absolute weight values');
