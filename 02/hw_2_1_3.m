%hw_2_1_3.m

close all;

w0 = [0.2, 0.5];
eta_list = 0.4:-0.1:0.1; % step size

plot_error_evolution(w0, eta_list);