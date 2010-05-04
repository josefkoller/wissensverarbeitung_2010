% problem 3.1

clear all;
close all;

N = [1,2,3,4,6,8];

load('neuralnetworks.mat');

x_test = x_test';
y_test = y_test';
x_train = x_train';
y_train = y_train';

TestSet.P = x_test;
TestSet.T = y_test;


n = N(6);
%for n = N 
   net = newff([-2 2], [n, 1], {'logsig', 'purelin'}, 'trainscg');
   net.performFcn = 'mse';
   net.trainParam.epochs = 700;
   net.trainParam.show = 5;
   net = init(net);
   [net, perf] = train(net, x_train, y_train, [],[],[], TestSet);
%end

mseTrain = sum((y_train - sim(net, x_train)).^2) / length(x_train);
mseTest = sum((y_test - sim(net, x_test)).^2) / length(x_test);

fprintf('%d Neurons: %f mse on training set, %f mse on testset\n', neurons(index), mseTrain, mseTest);

figure;
clf reset

y_learned = sim(net, x);

plot(x,y);
hold on;
plot(x_train, t_train, 'g.');
plot(x, y_learned, 'm'); 

title(sprintf('%d Neurons', neurons(index)));  


