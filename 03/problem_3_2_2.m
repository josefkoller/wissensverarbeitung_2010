
% problem 3_2_2

clear all;
close all;

[ x_test, y_test, x_train, y_train, TestSet, x_min, x_max, x_step] = load_input();

MIN_GRADIENT_DESCENT = 0.0001;
performance_function = 'mse';
neuron_count = 8;
epoch_count = 700;
if exist('SPEED', 'file')
    epoch_count = 50;
end

[ network, performance ] = create_and_train_network( x_min, x_max, ...
    neuron_count, performance_function, epoch_count, ...
    x_train, y_train, x_test, y_test);

% check trained network with new input
x = x_min:x_step:x_max;
y_learned = sim(network, x);

plot_filename_prefix = sprintf('3_2_2_%d_epochs', epoch_count);
figure_title = 'training and test data - Early Stopping';
plot_curves(x, y_learned, x_train, y_train, ...
    figure_title, plot_filename_prefix)

figure_title = 'MSE for the number of epochs used - Early Stopping';
error_x_label = '# epochs';
plot_error(performance.tperf, performance.perf, ...
    figure_title, error_x_label, plot_filename_prefix); 

%min MSE
mse_gradient = gradient(performance.perf);
for i = 1:length(mse_gradient)
    if mse_gradient(i) < MIN_GRADIENT_DESCENT && mse_gradient(i) > -MIN_GRADIENT_DESCENT
        epoch_count = i; % min gradient reached
        break;
    end
end

%[min_mse, epoch_index_with_min_error] = min(performance.perf);

%configure
network2 = network;
network2.trainParam.epochs = epoch_count;
[network2, performance2] = train(network2, x_train, y_train, [],[],[], TestSet);

% check trained network with new input
x = x_min:x_step:x_max;
y_learned = sim(network2, x);

plot_filename_prefix = sprintf('3_2_2_%d_epochs', epoch_count);
figure_title = 'training and test data - Early Stopping';
plot_curves(x, y_learned, x_train, y_train, ...
    figure_title, plot_filename_prefix)

figure_title = 'MSE for the number of epochs used';
error_x_label = '# epochs';
plot_error(performance2.tperf, performance2.perf, ...
    figure_title, error_x_label, plot_filename_prefix); 
