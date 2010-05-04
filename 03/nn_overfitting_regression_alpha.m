clear all;
close all;

rand('state', 30032007);
randn('state', 30032007);


% In this example we want to learn a simple 1-D regression task


x = -2:0.01:2;
% This is the function to learn
period = 2;

y = sin(x * period * pi) .* exp(-abs(x));


% Create the Test Data to estimate the true error

x_train = rand(1, 25) * 4 - 2;
t_train = sin(x_train * period * pi) .* exp(-abs(x_train)) + randn(size(x_train)) * 0.05;


x_test = rand(1, 1000) * 4 - 2;
t_test = sin(x_test * period  * pi) .* exp(-abs(x_test)) + randn(size(x_test)) * 0.05;

TestSet.P = x_test;
TestSet.T = t_test;


alpha = [0.95, 0.975, 0.985, 0.99, 0.995, 0.999, 0.9999, 1.0];

index = 6;
net = newff([-2 2], [20, 1], {'logsig', 'purelin'}, 'trainscg');

net = init(net);

net.performFcn = 'msereg';
net.performParam.ratio = alpha(index);
net.trainParam.epochs = 1000;
net.trainParam.show = NaN;

[net, perf] = train(net, x_train, t_train, [],[],[], TestSet);


mseTrain = sum((t_train - sim(net, x_train)).^2) / length(x_train);
mseTest = sum((t_test - sim(net, x_test)).^2) / length(x_test);

fprintf('%f Alpha: %f mse on training set, %f mse on testset\n', alpha(index), mseTrain, mseTest);

figure;
clf reset

y_learned = sim(net, x);

plot(x,y);
hold on;
plot(x_train, t_train, 'g.');
plot(x, y_learned, 'm'); 

title(sprintf('%f Alpha', alpha(index)));  


