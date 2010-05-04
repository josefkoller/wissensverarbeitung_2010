% problem 3.2

clear all;
close all;

alpha = [0.9, 0.95, 0.975, 0.99, 0.995, 1.0];

plot_filename_prefix = '3_2';
title_getter = @(index) sprintf('alpha: %d', index);
neuron_number_getter = @(index) 8;
loop_length = length(alpha);
net_modifier = @(net, index) setPerformFcnAndRatio(net, 'msereg', alpha(index));

solveEverything(plot_filename_prefix, title_getter, ...
    neuron_number_getter, loop_length, net_modifier );
