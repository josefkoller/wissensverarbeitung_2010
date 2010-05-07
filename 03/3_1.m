clear all;
close all;


% In this example we want to learn a simple 1-D regression task


x = -7:0.01:7;
load('neuralnetworks.mat');

x_test = x_test';
y_test = y_test';
x_train = x_train';
y_train = y_train';

TestSet.P = x_test;
TestSet.T = y_test;

hold on;
plot(x_train, t_train, 'g*');

TestSet.P = x_test;
TestSet.T = y_test;

% Estimate the effect of the number of training examples


N = [1,2,3,4,6,8];
index = 4;
net = newff([-7 7], [neurons(index), 1], {'logsig', 'purelin'}, 'trainscg');

net = init(net);

net.performFcn = 'mse';
net.trainParam.epochs = 700;
net.trainParam.show = NaN;

[net, perf] = train(net, x_train, t_train, [],[],[], TestSet);


mseTrain = sum((t_train - sim(net, x_train)).^2) / length(x_train);
mseTest = sum((t_test - sim(net, x_test)).^2) / length(x_test);

fprintf('%d Neurons: %f mse on training set, %f mse on testset\n', neurons(index), mseTrain, mseTest);

figure;
clf reset

y_learned = sim(net, x);

plot(x,y);
hold on;
plot(x_train, t_train, 'g.');
plot(x, y_learned, 'm'); 

title(sprintf('%d Neurons', neurons(index)));  


