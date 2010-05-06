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
    
    for index = 1:loop_length
       neuron_number = neuron_number_getter(index);
       net = newff([min max], [neuron_number, 1], {'logsig', 'purelin'}, 'trainscg');
       net.trainParam.epochs = 100;
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
    
    neuron_numbers = 1:loop_length;
       
    clf reset; 
    
    hold on; 
     
    plot(neuron_numbers, mse_train_list, 'r');
    title(sprintf('%s MSE over the used neuron count - training data', title_front));
    ylabel('Mean Squared Error with Regularization (msereg)');
    xlabel('# neuron');
  
    plot(neuron_numbers, mse_test_list, 'r');
    title(sprintf('%s MSE over the used neuron count - test data', title_front));
    ylabel('Mean Squared Error with Regularization (msereg)');
    xlabel('# neuron');
  
    legend('MSE training data', 'MSE test data');
    hold off;
  
    print('-dpng', '-r300', sprintf('plot_%s_mse.png', ...
        plot_filename_prefix));
end

