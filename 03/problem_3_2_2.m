% problem 3_2_2


clear all;
close all;

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

net = newff([0 7], [20, 1], {'logsig', 'purelin'}, 'trainscg');

net = init(net);

net.performFcn = 'mse';
net.trainParam.epochs = 700;
net.trainParam.show = NaN;

% Save network parameters ! We have to use the SAME intial conditions!!
net2 = net;

[net, perf] = train(net, x_train, y_train, [],[],[], TestSet);


mseTrain = sum((y_train - sim(net, x_train)).^2) / length(x_train);
mseTest = sum((y_test - sim(net, x_test)).^2) / length(x_test);

[minMSE, index] = min(perf.tperf);

fprintf('ES: %f mse on training set, %f final mse on testset, ES mse on testset: %f\n', mseTrain, mseTest, minMSE);

net2.trainParam.epochs = index;

[net2, perf] = train(net2, x_train, y_train, [],[],[], TestSet);


figure;
clf reset

y_learned1 = sim(net, x);
y_learned2 = sim(net2, x);

hold on;
plot(x_train, y_train, 'g.');
plot(x, y_learned1, 'm'); 
plot(x, y_learned2, 'r'); 


figure;
clf reset

y_learned = sim(net, x);

title('Training and learned function');
hold on;
plot(x_train, y_train, 'g.');
plot(x, y_learned, 'm'); 
ylabel('y');
xlabel('x');
legend('Train', 'Learned');
print('-dpng', '-r300', sprintf('plot_%s.png', ...
    '3_2_2'));
