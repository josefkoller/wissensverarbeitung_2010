% create_and_train_network
function [ network, performance ] = create_and_train_network( x_min, x_max, ...
    neuron_count, performance_function, epoch_count, ...
    x_train, y_train, x_test, y_test, alpha)

    network = newff([x_min x_max], [neuron_count, 1], ...
        {'logsig', 'purelin'}, 'trainscg');
    network.performFcn = performance_function;
    network.trainParam.epochs = epoch_count;
    network.trainParam.show = epoch_count;

    if exist('alpha', 'var') 
        network.performParam.ratio = alpha;
    end

    network = init(network);
    plotbrowser;
    % train the network with the done config

    x_train2 = [x_train, x_test];
    t_train2 = [y_train, y_test];

    network.divideFcn = 'divideind';
    network.divideParam.trainInd = 1:size(x_train,2);
    network.divideParam.valInd = [];
    network.divideParam.testInd = (1+size(x_train,2)):size(x_train2,2);
    
    [network, performance] = train(network, x_train2, t_train2);
end

