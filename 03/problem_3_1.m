% problem 3.1

clear all;
close all;

%System = context() % [variable_name] = [class_name]([constructor_parameters]);
% System.set('N', [1, 2, 3, 4, 6, 9])

N = [1,2,3,4,6,8];

x_min = 0;
x_max = 7;
plot_filename_prefix = '3_1';
title_getter = @(index) sprintf('Neuron: %d', N(index) );
neuron_number_getter = @(index) N(index);
loop_length = length(N);
net_modifier = @(net, index) setPerformFcn(net, 'mse');


teach_and_plot_feedforward_neural_network(plot_filename_prefix, title_getter, ...
    neuron_number_getter, loop_length, net_modifier );


