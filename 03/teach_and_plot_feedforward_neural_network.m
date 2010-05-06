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
    
    for index = 1:loop_length
       neuron_number = neuron_number_getter(index);
       net = newff([min max], [neuron_number, 1], {'logsig', 'purelin'}, 'trainscg');
       net.trainParam.epochs = 100;
       net.trainParam.show = NaN;
       
       net = net_modifier(net, index);
       
       net = init(net);
       plotbrowser;
       [net, perf] = train(net, x_train, y_train, [],[],[], TestSet);

       mseTrain = sum((y_train - sim(net, x_train)).^2) / length(x_train);
       mseTest = sum((y_test - sim(net, x_test)).^2) / length(x_test);

       figure;
       clf reset

       y_learned = sim(net, x);

       figure;
       hold on;
       
       title_getter(index)
       title(title_getter(index));
       
       plot(x_train, y_train, 'g.');
       plot(x, y_learned, 'm'); 

       title(title_getter(index));
       
       figure;
       hold on;
       plot(mseTrain, 'r');
       plot(mseTest, 'b');
       ylabel('Mean Squared Error with Regularization (msereg)');
       xlabel('Epochs');
       legend('Test', 'Train');
       print('-dpng', '-r300', sprintf('plot_%s_%d.png', ...
           plot_filename_prefix, index));
       hold off;
    end
end

