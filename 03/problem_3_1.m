
% problem 3_1

clear all;
close all;

[ x_test, y_test, x_train, y_train, TestSet, x_min, x_max, x_step] = load_input();

neuron_count_list = [1,2,3,4,6,8];

performance_function = 'mse';
epoch_count = 700;
if exist('SPEED', 'file')
    epoch_count = 50;
end

mse_train_list = [];
mse_test_list = [];

for neuron_count = neuron_count_list
    [ network, performance ] = create_and_train_network( x_min, x_max, ...
        neuron_count, performance_function, epoch_count, ...
        x_train, y_train, x_test, y_test);

    mse_train = sum((y_train - sim(network, x_train)).^2) / length(x_train);
    mse_train_list(length(mse_train_list)+1) = mse_train;
    mse_test = sum((y_test - sim(network, x_test)).^2) / length(x_test);
    mse_test_list(length(mse_test_list)+1) = mse_test;
    
    plot_filename_prefix = sprintf('3_1_%d_neurons', neuron_count);
    
    % check trained network with new input
    x = x_min:x_step:x_max;
    y_learned = sim(network, x);

    figure_title = sprintf('training and test data - Weight Decay - Simple Regression - neurons: %d', neuron_count);
    plot_curves(x, y_learned, x_train, y_train, ...
        figure_title, plot_filename_prefix)
end
    

plot_file_name_prefix = 'mse_for_neuron_counts';
x = neuron_count_list;
sprintf('size(x): %d', length(x) )
sprintf('size(mse_train_list): %d', length(mse_train_list))

figure_title = sprintf('MSE for the number of epochs used - Simple Regression - neurons: %d', neuron_count);
error_x_label = '# epochs';
plot_error(mse_train_list, mse_test_list, ...
   figure_title, error_x_label, plot_filename_prefix, x); 

