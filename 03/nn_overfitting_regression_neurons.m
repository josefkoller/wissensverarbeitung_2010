clear all;
close all;

rand('state', 30032007);
randn('state', 30032007);


% In this example we want to learn a simple 1-D regression task


x = -2:0.01:2;
% This is the function to learn
period = 2;

y = sin(x * period * pi) .* exp(-abs(x));

fig1 = figure;
plot(x,y);
hold on;



% Create the Test Data to estimate the true error

x_train = rand(1, 25) * 4 - 2;
t_train = sin(x_train * period * pi) .* exp(-abs(x_train)) + randn(size(x_train)) * 0.05;

hold on;
plot(x_train, t_train, 'g*');

x_test = rand(1, 1000) * 4 - 2;
t_test = sin(x_test * period  * pi) .* exp(-abs(x_test)) + randn(size(x_test)) * 0.05;

TestSet.P = x_test;
TestSet.T = t_test;

% Estimate the effect of the number of training examples

neurons = [3, 5, 7, 10, 15, 20, 50];

index = 4;
net = newff([-2 2], [neurons(index), 1], {'logsig', 'purelin'}, 'trainscg');

net = init(net);

net.performFcn = 'mse';
net.trainParam.epochs = 500;
net.trainParam.show = 5;

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


