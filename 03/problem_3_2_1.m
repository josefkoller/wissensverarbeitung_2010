
% problem 3_2_1

clear all;
close all;

[ x_test, y_test, x_train, y_train, TestSet, x_min, x_max, x_step] = load_input();

alpha_list = [0.9, 0.95, 0.975, 0.99, 0.995, 1.0];
performance_function = 'msereg';
neuron_count = 8;
epoch_count = 700;
if exist('SPEED', 'file')
    epoch_count = 50;
end

for alpha = alpha_list
    
    [ network, performance ] = create_and_train_network( x_min, x_max, ...
        neuron_count, performance_function, epoch_count, ...
        x_train, y_train, x_test, y_test,  ...
        alpha);
    
    mse_train = sum((y_train - sim(network, x_train)).^2) / length(x_train);
    mse_test = sum((y_test - sim(network, x_test)).^2) / length(x_test);

    plot_filename_prefix = sprintf('3_2_1_%1.2f_alpha', alpha);
    figure_title = sprintf('MSE for the number of epochs used - Weight Decay - alpha: %1.2f', alpha);
    error_x_label = '# epochs';
    plot_error(performance.tperf, performance.perf, ...
        figure_title, error_x_label, plot_filename_prefix); 
    
    % check trained network with new input
    x = x_min:x_step:x_max;
    y_learned = sim(network, x);

    figure_title = sprintf('training and test data - Weight Decay = alpha: %1.2f', alpha);
    plot_curves(x, y_learned, x_train, y_train, ...
        figure_title, plot_filename_prefix)

end
    