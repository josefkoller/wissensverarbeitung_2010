function [ ] = teach_and_plot_feedforward_neural_network( plot_filename_prefix, ...
    title_getter, neuron_number_getter, loop_length, net_modifier )
    % const...
    %     test and training data
    %     x area
    %     feedforward, 1 layer, 
    %     logsig in, purelin out
    %     trainscg
    %     700 epochs
    load('neuralnetworks.mat');

    x_test = x_test';
    y_test = y_test';
    x_train = x_train';
    y_train = y_train';

    TestSet.P = x_test;
    TestSet.T = y_test;

    min = 0;
    max = 7;
    x = min:0.05:max;
    
    %max(x_test) = 6.2637
    %min(x_test) = 0.0058
    %x = linspace(0, 6, 15); %???
    
    mse_train_list = zeros(1, loop_length);
    mse_test_list = zeros(1, loop_length);
    
    neuron_number = -1;
    for index = 1:loop_length
       neuron_number = neuron_number_getter(index);
       net = newff([min max], [neuron_number, 1], {'logsig', 'purelin'}, 'trainscg');
       net.trainParam.epochs = 700;
       net.trainParam.show = NaN;
       
       net = net_modifier(net, index);
       
       
       net = init(net);
       plotbrowser;
       [net, perf] = train(net, x_train, y_train, [],[],[], TestSet);

       clf reset;

       y_learned = sim(net, x);
       title_front = title_getter(index);
       plot_curves(x, y_learned, x_train, y_train, title_front, ...
           plot_filename_prefix, index, net, x_test, y_test);
	           
	   mse_train = sum((y_train - sim(net, x_train)).^2) / length(x_train);
	   mse_test = sum((y_test - sim(net, x_test)).^2) / length(x_test);
	     
	     mse_train_list(index) = mse_train;
	     mse_test_list(index) = mse_test;
    end
    
    plot_mse(neuron_number, mse_train_list, mse_test_list, plot_filename_prefix);   
end

