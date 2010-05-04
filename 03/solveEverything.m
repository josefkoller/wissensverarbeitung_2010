function [ ] = solveEverything( plot_filename_prefix, ...
    title_getter, neuron_number_getter, loop_length, net_modifier )
    load('neuralnetworks.mat');

    x_test = x_test';
    y_test = y_test';
    x_train = x_train';
    y_train = y_train';

    TestSet.P = x_test;
    TestSet.T = y_test;

    x = -2:0.01:2;
    
    for index = 1:loop_length
       neuron_number = neuron_number_getter(index);
       net = newff([-2 2], [neuron_number, 1], {'logsig', 'purelin'}, 'trainscg');
       net.trainParam.epochs = 700;
       net.trainParam.show = NaN;
       
       net_modifier(net, index);
       
       net = init(net);
       plotbrowser;
       [net, perf] = train(net, x_train, y_train, [],[],[], TestSet);

       mseTrain = sum((y_train - sim(net, x_train)).^2) / length(x_train);
       mseTest = sum((y_test - sim(net, x_test)).^2) / length(x_test);

       figure;
       clf reset

       y_learned = sim(net, x);

       hold on;
       plot(x_train, y_train, 'g.');
       plot(x, y_learned, 'm'); 

       title(title_getter(index));
       
       figure;
       hold on;
       plot(perf.perf, 'r');
       plot(perf.tperf, 'b');
       ylabel('Mean Squared Error with Regularization (msereg)');
       xlabel('Epochs');
       legend('Test', 'Train');
       print('-dpng', '-r300', sprintf('plot_%s_%d.png', ...
           plot_filename_prefix, index));
       hold off;
    end
end

